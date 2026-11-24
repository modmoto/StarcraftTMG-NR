import test from 'node:test';
import assert from 'node:assert/strict';
import { formatWording } from './update-official.mjs';

test('Orders restores source paragraphs as a compact list', () => {
  assert.equal(formatWording('Apply one of the following effects:\n\n1 CP: First.\n\n2 CP: Second.', ''),
    'Apply one of the following effects:\n- 1 CP: First.\n- 2 CP: Second.');
});

test('list introduction can have additional sentences', () => {
  assert.equal(formatWording('Apply one of the following effects. Choose each Round:\n\nFirst.\n\nSecond.', ''),
    'Apply one of the following effects. Choose each Round:\n- First.\n- Second.');
});

test('HTML breaks, bullets and XML escaping preserve readable lines', () => {
  assert.equal(formatWording('Rules:<br><br>• A &amp; B<br><br>• Within 8"', '\r\n'),
    'Rules:\r\n- A &amp; B\r\n- Within 8&quot;');
});

test('prose keeps paragraphs and CRLF is not duplicated', () => {
  assert.equal(formatWording('First.\r\n\r\nSecond.', '\r\n'), 'First.\r\n\r\nSecond.');
});

test('closing condition after a list remains prose', () => {
  assert.equal(formatWording('The following effects:\nFirst.\nSecond.\nIf both apply, resolve in order.', ''),
    'The following effects:\n- First.\n- Second.\nIf both apply, resolve in order.');
});

test('formatting is idempotent', () => {
  const text = 'Apply the following effects:\n- First.\n- Second.';
  assert.equal(formatWording(text, ''), text);
});

import { readFileSync, writeFileSync, copyFileSync, mkdtempSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { spawnSync } from 'node:child_process';
import { makeUnit, addMissingUnits, setEntryCost, updateCatalog, updateStats } from './update-official.mjs';
const game = readFileSync(new URL('./Starcraft The Miniature Game.gst', import.meta.url), 'utf8');
const catalog = readFileSync(new URL('./Terrans.cat', import.meta.url), 'utf8');
const categories = new Map([...game.matchAll(/<categoryEntry name="([^"]+)" id="([^"]+)"/g),
  ...catalog.matchAll(/<categoryEntry name="([^"]+)" id="([^"]+)"/g)].map((match) => [match[1].trim(), match[2]]));
const weapon = (name, linkedTo = '-', costS = 0, costL = costS) => ({ name, linkedTo, costS, costL,
  phase: 'Assault Phase', activation: '',
  description: 'RANGE: 12 | TARGET: All | RoA: 3 | HIT: 4+ | DMG: 1\nSURGE: Light (D3)\n\nPIERCE Armoured (2)' });
const newUnit = () => ({ sourceId: 'test_new_unit', name: 'Test & New Unit', faction: 'Terran', unitType: 'Core',
  tags: 'Biological, Ground, Unique', small: { models: 3, supply: 1, cost: 0 },
  large: { models: 6, supply: 2, cost: 100 }, stats: { shield: '-', speed: '4/7', evade: '6+', armor: '5+', hp: '1', size: '1' },
  squadProfile: [{ modelCount: '1 - 3', supply: 1 }, { modelCount: '4 - 6', supply: 2 }],
  upgrades: [weapon('Rifle'), weapon('Alternative A', 'Rifle', 10, 20), weapon('Alternative B', 'Rifle', 20, 30)] });

function parseXml(xml) {
  const result = spawnSync(process.platform === 'win32' ? 'python' : 'python3', ['-c', `import sys, xml.etree.ElementTree as E
r=E.fromstring(sys.stdin.read())
ids=[e.get('id') for e in r.iter() if e.get('id')]
assert len(ids)==len(set(ids)), 'Duplicate IDs'
for e in r.iter():
 assert e.get('typeId')!='undefined'
 if e.tag=='condition': assert e.get('childId') in ids
 if e.tag=='modifier' and e.get('field') not in ['hidden','${'5bcf-897a-a5c9-d0e8'}']: assert e.get('field') in ids
 assert len(e.findall('modifiers'))<=1, 'Multiple modifier containers'
`], { input: xml, encoding: 'utf8' });
  assert.equal(result.status, 0, result.stderr);
}

test('new units include valid weapons, replacement conditions, reinforcement and without artificial zero costs', () => {
  const xml = makeUnit(newUnit(), game, categories);
  assert.ok(xml);
  parseXml(xml);
  assert.doesNotMatch(xml, /name="Minerals"[^>]*value="0"/);
  assert.doesNotMatch(xml, /name="Gas"[^>]*value="0"/);
  assert.match(xml, /name="Reinforce"/);
  assert.match(xml, /name="Supply"[^>]*>1-3: 1 \| 4-6: 2</);
  assert.match(xml, /scope="roster"[^>]*type="max" value="1"/);
  assert.equal((xml.match(/field="hidden" type="set" value="true"/g) ?? []).length, 2);
  assert.equal((xml.match(/type="set" value="0"><conditions>/g) ?? []).length, 2);
});

test('new unit import is repeatable and aliases do not create duplicates', () => {
  const u = newUnit();
  const first = addMissingUnits(catalog, [u], game);
  assert.equal(addMissingUnits(first, [u], game), first);
  const renamed=addMissingUnits(first, [{ ...u, name: 'Renamed Unit' }], game);
  assert.equal((renamed.match(/name="Renamed Unit"/g)??[]).length,3);
  assert.equal(addMissingUnits(catalog, [{ ...u, name: 'Marine' }], game), catalog);
});

test('ability IDs survive source order changes and same names in different phases', () => {
  const u = newUnit();
  u.upgrades.push({ ...weapon('Rifle'), phase: 'Combat Phase' });
  const first = makeUnit(u, game, categories);
  const second = makeUnit({ ...u, upgrades: [...u.upgrades].reverse() }, game, categories);
  parseXml(first);
  const ids = (xml) => [...xml.matchAll(/ id="([^"]+)"/g)].map((m) => m[1]).sort();
  assert.deepEqual(ids(first), ids(second));
});

test('invalid new units are rejected instead of partially imported', () => {
  const u = newUnit();
  assert.equal(makeUnit({ ...u, stats: {} }, game, categories), null);
  assert.equal(makeUnit({ ...u, upgrades: [weapon('Alternative', 'Missing weapon')] }, game, categories), null);
  assert.equal(makeUnit({ ...u, upgrades: [weapon('Rifle'), weapon('Rifle')] }, game, categories), null);
  assert.equal(makeUnit({ ...u, unitType: 'Unknown' }, game, categories), null);
});

test('missing currency fields are only created for nonzero costs', () => {
  const entry = '    <selectionEntry name="Free" id="free" type="upgrade">\n    </selectionEntry>';
  assert.equal(setEntryCost(entry, 0), entry);
  assert.match(setEntryCost(entry, 10), /name="Gas"[^>]*value="10"/);
});

const mineralId = '5bcf-897a-a5c9-d0e8';
function inspectUnit(xml) {
  const result = spawnSync(process.platform === 'win32' ? 'python' : 'python3', ['-c', `import sys,json,xml.etree.ElementTree as E
r=E.fromstring(sys.stdin.read())
def costs(e): return {c.get('typeId'):float(c.get('value')) for c in e.findall('./costs/cost')}
print(json.dumps({'costs':costs(r),'upgrades':{e.get('name'):{'costs':costs(e),'modifiers':[m.attrib for m in e.findall('./modifiers/modifier')]} for e in r.findall('./selectionEntries/selectionEntry')},'profiles':{e.get('name'):{c.get('name'):c.text or '' for c in e.findall('./characteristics/characteristic')} for e in r.findall('./profiles/profile')}}))
`], {input: xml, encoding:'utf8'});
  assert.equal(result.status, 0, result.stderr);
  return JSON.parse(result.stdout);
}

test('existing generated units update base, reinforcement and optional upgrade costs', () => {
  const unit = newUnit();
  const original = makeUnit(unit, game, categories);
  unit.small.cost = 50;
  unit.large.cost = 170;
  unit.upgrades[1].costS = 15;
  unit.upgrades[1].costL = 35;
  const updated = updateCatalog(original, [unit], []);
  const data = inspectUnit(updated);
  assert.equal(data.costs[mineralId], 50);
  assert.equal(data.upgrades.Reinforce.costs[mineralId], 120);
  assert.equal(data.upgrades['Alternative A'].costs[mineralId], 15);
  assert.ok(data.upgrades['Alternative A'].modifiers.some(m => m.field === mineralId && m.value === '35'));
});

test('cost replacement supports Windows CRLF without changing nested costs', () => {
  const xml = makeUnit(newUnit(), game, categories).replace(/\n/g, '\r\n');
  const updated = setEntryCost(xml, 17, mineralId, 'Minerals');
  assert.equal(inspectUnit(updated).costs[mineralId], 17);
  assert.equal(inspectUnit(updated).upgrades['Alternative A'].costs[mineralId], 10);
  assert.ok(!/(?<!\r)\n/.test(updated));
});

test('new unit without a name or with malformed weapon data is safely rejected', () => {
  const unit = newUnit();
  assert.equal(makeUnit({...unit, name: undefined}, game, categories), null);
  assert.equal(makeUnit({...unit, upgrades:[{...weapon('Broken'), description:'RANGE: 12 | TARGET: All'}]}, game, categories), null);
});

test('updated stats match source and preserve unknown or ambiguous profiles', () => {
  const unit = newUnit();
  const xml = makeUnit(unit, game, categories);
  const changed = {...unit, stats:{...unit.stats, hp:'7', speed:'6/8'}};
  const updated = updateStats(xml, [changed]);
  assert.equal(inspectUnit(updated).profiles[unit.name].HP, '7');
  assert.equal(inspectUnit(updated).profiles[unit.name].Spd, '6/8');
  assert.equal(updateStats(xml, [changed, changed]), xml);
  assert.equal(updateStats(xml, [{...changed,name:'Unknown'}]), xml);
});

test('duplicate official rows are rejected before costs are changed', () => {
  const unit = newUnit();
  assert.throws(() => updateCatalog(makeUnit(unit, game, categories), [unit, unit], []), /Ambiguous/);
});

test('failed reinforcement update preserves the entire hand-authored entry', () => {
  const unit = newUnit();
  const xml = makeUnit({...unit, large:undefined}, game, categories);
  assert.equal(updateCatalog(xml, [unit], []), xml);
});

test('CLI preview, apply and replay work across all factions without changing real files', () => {
  const dir = mkdtempSync(join(tmpdir(), 'starcraft-import-test-'));
  try {
    const files = ['Terrans.cat','Zergs.cat','Protoss.cat','Starcraft The Miniature Game.gst'];
    for (const file of [...files,'update-official.mjs']) copyFileSync(new URL('./'+file, import.meta.url), join(dir,file));
    const units = ['Terran','Zerg','Protoss'].map(faction => ({...newUnit(), faction, sourceId:'test_'+faction, name:'Test New '+faction}));
    const official = {army_units:units, tactical_cards:['Terran','Zerg','Protoss'].map(faction => ({name:'Test Card',faction,cost:0})),
      rules_sections:[{title:'KEYWORD GLOSSARY',items:[{subItems:[{title:'TEST IMPORT RULE',content:[{type:'text',value:'Test <b>rule</b>.'}],subSubItems:[]}]}]}]};
    writeFileSync(join(dir,'source.json'),JSON.stringify(official));
    const before = files.map(file=>readFileSync(join(dir,file),'utf8'));
    const run = (...args) => spawnSync(process.execPath,[join(dir,'update-official.mjs'),'--source-input='+join(dir,'source.json'),...args],{encoding:'utf8'});
    const preview = run();
    assert.equal(preview.status,0,preview.stderr);
    assert.match(preview.stdout,/Would update 4 file/);
    assert.deepEqual(files.map(file=>readFileSync(join(dir,file),'utf8')),before);
    const apply = run('--apply');
    assert.equal(apply.status,0,apply.stderr);
    const after = files.map(file=>readFileSync(join(dir,file),'utf8'));
    for (let i=0;i<3;i++) assert.match(after[i],new RegExp('name="Test New '+units[i].faction+'"'));
    assert.match(after[3],/name="TEST IMPORT RULE"/);
    const replay = run('--apply');
    assert.equal(replay.status,0,replay.stderr);
    assert.match(replay.stdout,/Updated 0 file/);
    assert.deepEqual(files.map(file=>readFileSync(join(dir,file),'utf8')),after);
    official.army_units[0].small.cost=75;
    official.army_units[0].upgrades[1].costS=25;
    writeFileSync(join(dir,'source.json'),JSON.stringify(official));
    const next = run('--apply');
    assert.equal(next.status,0,next.stderr);
    const terran=readFileSync(join(dir,files[0]),'utf8');
    const entry=terran.match(/^    <selectionEntry name="Test New Terran"[^\n]*\n[\s\S]*?^    <\/selectionEntry>/m)[0];
    assert.equal(inspectUnit(entry).costs[mineralId],75);
    assert.equal(inspectUnit(entry).upgrades['Alternative A'].costs[mineralId],25);
    official.tactical_cards=[];
    writeFileSync(join(dir,'source.json'),JSON.stringify(official));
    const snapshot=files.map(file=>readFileSync(join(dir,file),'utf8'));
    assert.notEqual(run('--apply').status,0);
    assert.deepEqual(files.map(file=>readFileSync(join(dir,file),'utf8')),snapshot);
  } finally { rmSync(dir,{recursive:true,force:true}); }
});

test('invalid source records are skipped without crashing or inserting partial units', () => {
  const unit = newUnit();
  for (const invalid of [null, {...unit,name:null}, {...unit,sourceId:42}, {...unit,upgrades:{}},
    {...unit,upgrades:[null]}, {...unit,squadProfile:[{modelCount:3,supply:1}]}]) {
    assert.equal(addMissingUnits(catalog, [invalid], game), catalog);
  }
});

test('large blank gaps before lists normalize in a single pass', () => {
  const source = 'Introduction:\n\n\n\n\n- First.\n\n\n- Second.';
  const once = formatWording(source,'');
  assert.equal(once,'Introduction:\n- First.\n- Second.');
  assert.equal(formatWording(once,''),once);
});

test('zero tactical costs retain profiles, limits and other resource costs', () => {
  const xml = `    <selectionEntry name="Free Card" id="free" type="upgrade">
      <constraints><constraint id="limit" type="max" value="1"/></constraints>
      <costs>
        <cost name="Core" typeId="slots" value="2"/>
      </costs>
      <profiles><profile id="profile" name="Rule"/></profiles>
    </selectionEntry>`;
  const result = updateCatalog(xml, [], [{name:'Free Card',cost:0}]);
  assert.equal(inspectUnit(result).costs.slots,2);
  assert.equal(inspectUnit(result).costs[mineralId],undefined);
  assert.equal(inspectUnit(result).costs['1719-6214-392e-e53f'],undefined);
  assert.match(result, /constraint id="limit"/);
  assert.match(result, /profile id="profile"/);
  assert.equal(updateCatalog(result, [], [{name:'Free Card',cost:0}]),result);
});

 test('rulebook-only CLI leaves unit stats and glossary wording intact', () => {
  const dir = mkdtempSync(join(tmpdir(), 'starcraft-rulebook-test-'));
  try {
    for (const file of ['Terrans.cat','Zergs.cat','Protoss.cat','Starcraft The Miniature Game.gst','update-official.mjs']) copyFileSync(new URL('./'+file, import.meta.url), join(dir,file));
    const source = {rules_sections:[{sourceId:'test-chapter',title:'TEST CHAPTER',items:[{title:'Test section',content:[{type:'text',value:'Test chapter wording.'}]}]}]};
    writeFileSync(join(dir,'source.json'), JSON.stringify(source));
    const before=readFileSync(join(dir,'Terrans.cat'),'utf8');
    const run=()=>spawnSync(process.execPath,[join(dir,'update-official.mjs'),'--mode=rulebook','--source-input='+join(dir,'source.json'),'--apply'],{encoding:'utf8'});
    const result=run(); assert.equal(result.status,0,result.stderr);
    const after=readFileSync(join(dir,'Terrans.cat'),'utf8');
    assert.match(after,/Rules Reference/);
    assert.equal(after.match(/<profile name="Marauders"[\s\S]*?<\/profile>/)[0],before.match(/<profile name="Marauders"[\s\S]*?<\/profile>/)[0]);
    assert.match(run().stdout,/Updated 0 file/);
  } finally {rmSync(dir,{recursive:true,force:true});}
});

test("Wave 4 source typo and faction threshold continuations import correctly", async () => {
  const {addMissingCards} = await import("./update-official.mjs");
  const sourceUnit = {"sourceId": "alarak", "large": {"models": 0, "cost": 0, "supply": 0}, "id": "alarak", "name": "Alarak", "unitType": "Hero", "combatRange": "1", "keywords": "", "tags": "Biological, Psionic, Ground, Unique", "small": {"supply": 1, "models": 1, "cost": 260}, "squadProfile": [{"tier": 1, "modelCount": "-", "supply": 0}, {"tier": 2, "modelCount": "1 - 1", "supply": 1}, {"tier": 3, "modelCount": "-", "supply": 0}], "faction": "Protoss", "upgrades": [{"name": "Bane Blades", "linkedTo": "-", "description": "RANGE: E | TARGET: Ground | RoA: 6 | HIT: 2+ | DMG: 1\nSURGE: Light, Armoured (D3+1)", "activation": "", "phase": "Cobmbat Phase", "costS": 0, "costL": 0}], "stats": {"evade": "5+", "shield": "3", "size": "2", "speed": "7", "armor": "4+", "hp": "6"}};
  const sourceCard = {"sourceId": "tal_darim", "isUnique": true, "faction": "Protoss", "name": "Tal'darim", "cost": 0, "resource": 0, "tags": "Tal'darim", "boosts": [{"name": "Proxy Pylon", "description": "Proxy Pylon <Active> <Movement Phase>: If there is no Friendly Tal'darim Pylon on the battlefield, set a Friendly Tal'darim Pylon Unit anywhere on the GROUND LEVEL of the battlefield more than 10\" away from any Enemy model. This Round, the Tal'darim Pylon is not eligible to use its Special Abilities (excluding Structure)."}, {"name": "Chain of Ascension", "description": "Chain of Ascension <Passive> <Any Phase>: Calculate the total lost Supply of all Friendly Units. While this total is:"}, {"name": "4 or more", "description": "4 or more: All your Units' first used weapons gain PRECISION (1)."}, {"name": "6 or more", "description": "6 or more: All your Units' first used weapons gain CRITICAL HIT (1)."}], "isFactionCard": true, "id": "tal_darim", "timestamp": "2026-11-24T10:29:15.222Z", "slots": {"Hero": 1, "Air": 0, "Support": 0, "Elite": 1, "Core": 4}, "factionTags": ["Tal'darim"]};
  const created = makeUnit(sourceUnit, game, categories);
  assert.ok(created);
  assert.match(created, /typeName="Combat Weapon"/);
  const updated = addMissingCards(catalog, [sourceCard], game);
  assert.match(updated, /name="Tal&amp;apos;darim"|name="Tal&apos;darim"/);
  assert.match(updated, /4 or more: All your Units/);
  assert.match(updated, /6 or more: All your Units/);
  assert.equal(addMissingCards(updated,[sourceCard],game),updated);
});
