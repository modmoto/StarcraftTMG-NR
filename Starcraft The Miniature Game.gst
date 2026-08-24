<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gameSystem id="sys-ce49-e853-2fea-6af1" name="Starcraft The Miniature Game" battleScribeVersion="2.03" revision="11" type="gameSystem" xmlns="http://www.battlescribe.net/schema/gameSystemSchema">
  <costTypes>
    <costType name=" Minerals" id="5bcf-897a-a5c9-d0e8" defaultCostLimit="2000"/>
    <costType name="  Gas" id="1719-6214-392e-e53f" defaultCostLimit="200"/>
    <costType name="   Core" id="472f-46af-8e02-bfbf" defaultCostLimit="0" hidden="true">
      <modifiers>
        <modifier type="set" value="false" field="hidden">
          <comment>Required so it does not show on list creation</comment>
        </modifier>
      </modifiers>
    </costType>
    <costType name="    Elite" id="f5f9-3591-0f2d-0a53" defaultCostLimit="0" hidden="true">
      <modifiers>
        <modifier type="set" value="false" field="hidden">
          <comment>Required so it does not show on list creation</comment>
        </modifier>
      </modifiers>
    </costType>
    <costType name="     Support" id="31a6-c1f1-3d47-fa76" defaultCostLimit="0" hidden="true">
      <modifiers>
        <modifier type="set" value="false" field="hidden">
          <comment>Required so it does not show on list creation</comment>
        </modifier>
      </modifiers>
    </costType>
    <costType name="     Hero" id="7e61-585f-b715-85e0" defaultCostLimit="0" hidden="true">
      <modifiers>
        <modifier type="set" value="false" field="hidden">
          <comment>Required so it does not show on list creation</comment>
        </modifier>
      </modifiers>
    </costType>
    <costType name="     CP" id="d9d3-e904-3bc1-58f4" defaultCostLimit="0" hidden="true">
      <modifiers>
        <modifier type="set" value="false" field="hidden">
          <comment>Required so it does not show on list creation</comment>
        </modifier>
      </modifiers>
    </costType>
    <costType name="     BM" id="2b0c-c74f-79d5-5637" defaultCostLimit="0" hidden="true">
      <modifiers>
        <modifier type="set" value="false" field="hidden">
          <comment>Required so it does not show on list creation</comment>
        </modifier>
      </modifiers>
    </costType>
    <costType name="     EN" id="2498-bcf5-4ce6-ba10" defaultCostLimit="0" hidden="true">
      <modifiers>
        <modifier type="set" value="false" field="hidden">
          <comment>Required so it does not show on list creation</comment>
        </modifier>
      </modifiers>
    </costType>
  </costTypes>
  <profileTypes>
    <profileType name="Unit" id="18be-d8b9-8024-4925" hidden="false" kind="model" sortIndex="1">
      <characteristicTypes>
        <characteristicType name="Shd" id="4301-e83c-7226-741a">
          <formatRules>
            <formatRule name="New Format Rule" id="7974-0f81-9640-c1e0" hidden="false" type="regex" match="^$" replace="-">
              <comment>Empty → -</comment>
            </formatRule>
          </formatRules>
        </characteristicType>
        <characteristicType name="Spd" id="1b39-d395-b125-7ea9"/>
        <characteristicType name="Eva" id="bc5e-a9b9-f09d-8dec"/>
        <characteristicType name="Arm" id="08b0-2471-8408-9222"/>
        <characteristicType name="HP" id="e275-f946-72ee-4a48"/>
        <characteristicType name="Size" id="357b-9a74-5a55-800e" defaultValue="
"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Assault Weapon" id="e8b6-5b29-e80c-a3b3" hidden="false" kind="weapon" sortIndex="2">
      <characteristicTypes>
        <characteristicType name="Rng" id="ebd0-74ec-d612-eac2"/>
        <characteristicType name="Tgt" id="ca62-f052-a905-5e3f"/>
        <characteristicType name="RoA" id="6594-a81b-03da-75a1"/>
        <characteristicType name="Hit" id="f193-00c0-1dbe-ecba"/>
        <characteristicType name="Surge" id="89cf-90ae-fc8c-167a">
          <formatRules>
            <formatRule name="New Format Rule" id="1cfd-db88-3efc-3d5b" hidden="false" type="regex" match="^$" replace="-">
              <comment>Empty → -</comment>
            </formatRule>
          </formatRules>
        </characteristicType>
        <characteristicType name="S.Die" id="3779-8372-ef25-255d">
          <formatRules>
            <formatRule name="New Format Rule" id="8846-7447-a110-6d45" hidden="false" type="regex" match="^$" replace="-">
              <comment>Empty → -</comment>
            </formatRule>
          </formatRules>
        </characteristicType>
        <characteristicType name="Dmg" id="a082-2247-4a81-d1e2"/>
        <characteristicType name="Keyword" id="454d-a5c1-6c5e-8a4e">
          <formatRules>
            <formatRule name="New Format Rule" id="8663-420a-0dff-1b63" hidden="false" type="regex" match="^$" replace="-">
              <comment>Empty → -</comment>
            </formatRule>
          </formatRules>
        </characteristicType>
      </characteristicTypes>
    </profileType>
    <profileType name="Rules (Movement Phase)" id="ec1d-63b8-de26-1894" hidden="false" kind="ability">
      <characteristicTypes>
        <characteristicType name="Effect" id="1c06-5502-fb5a-616e" kind="longText"/>
        <characteristicType name="Cost" id="e11e-d579-0142-8de4" kind="annotation"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Rules (Any Phase)" id="a305-fb8b-8be3-f0fe" hidden="false" kind="ability" sortIndex="4">
      <characteristicTypes>
        <characteristicType name="Effect" id="616e-c7be-abff-a2bf" kind="longText"/>
        <characteristicType name="Cost" id="1696-5ea7-559b-bb8b" kind="annotation"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Rules (Assault Phase)" id="07ee-ef54-fbf7-5ca9" hidden="false" kind="ability">
      <characteristicTypes>
        <characteristicType name="Effect" id="97a6-bd65-3d58-17e9" kind="longText"/>
        <characteristicType name="Cost" id="06d2-1c49-1cfc-44f5" kind="annotation"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Rules (Combat Phase)" id="f61d-0471-085d-248c" hidden="false" kind="ability">
      <characteristicTypes>
        <characteristicType name="Effect" id="b94b-6a13-1240-6b8b" kind="longText"/>
        <characteristicType name="Cost" id="6f0c-b621-2f03-fe52" kind="annotation"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Combat Weapon" id="7b96-11fe-e87a-e61c" hidden="false" kind="weapon" sortIndex="3">
      <characteristicTypes>
        <characteristicType name="Rng" id="f6d9-ff21-6fe9-b821"/>
        <characteristicType name="Tgt" id="0bf8-6c63-e593-8417"/>
        <characteristicType name="RoA" id="af32-03e6-6c32-3580"/>
        <characteristicType name="Hit" id="61d4-8e80-254a-ab52"/>
        <characteristicType name="Surge" id="d7e0-90d3-308e-c357">
          <formatRules>
            <formatRule name="New Format Rule" id="c607-5340-1040-b2c7" hidden="false" type="regex" match="^$" replace="-">
              <comment>Empty → -</comment>
            </formatRule>
          </formatRules>
        </characteristicType>
        <characteristicType name="S.Die" id="52f3-3434-e741-a217">
          <formatRules>
            <formatRule name="New Format Rule" id="5175-c978-a732-8149" hidden="false" type="regex" match="^$" replace="-">
              <comment>Empty → -</comment>
            </formatRule>
          </formatRules>
        </characteristicType>
        <characteristicType name="Dmg" id="5665-56ad-b90d-ffc7"/>
        <characteristicType name="Keyword" id="9b72-90e3-8130-46b1">
          <formatRules>
            <formatRule name="New Format Rule" id="4e94-ae81-0dc5-e91d" hidden="false" type="regex" match="^$" replace="-">
              <comment>Empty → -</comment>
            </formatRule>
          </formatRules>
        </characteristicType>
      </characteristicTypes>
    </profileType>
    <profileType name="Squad" id="cc01-ffd3-bc71-1efe" hidden="false" kind="tag">
      <characteristicTypes>
        <characteristicType name="Supply" id="ee88-5823-7de8-93c0"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Mission Card" id="fa2f-c1b9-95af-1670" hidden="false" kind="ability" sortIndex="5">
      <characteristicTypes>
        <characteristicType name="Format" id="e8de-be79-f9d9-5576"/>
        <characteristicType name="Game Length" id="4640-3d7a-8dae-f311"/>
        <characteristicType name="Supply" id="7ed0-b17e-2d84-faec"/>
        <characteristicType name="Per Round" id="9637-410b-3cce-2016"/>
      
        <characteristicType name="Parameters" id="bbb3-41fd-6c95-e9b2" kind="longText"/>
        <characteristicType name="Scoring Conditions" id="42ab-2780-c1e3-28e5" kind="longText"/>
        <characteristicType name="Additional Conditions" id="ec8b-1bf0-f2bf-fbbb" kind="longText"/></characteristicTypes>
    </profileType>
  </profileTypes>
  <sharedRules>
    <rule name="IMPACT (X) Y" id="7805-5c0f-7d68-90c8" hidden="false">
      <description>IMPACT (X) Y Immediately after this Unit completes a successful Charge, check every model in the Fighting Rank or Supporting Rank. For each eligible model, generate X Impact Dice:
-If the model is in the Fighting Rank or Supporting Rank against only one Enemy Unit, all X dice go to that Unit.
- If the model is in the Fighting Rank or Supporting Rank against multiple Enemy Units, the controlling player may split the dice between those Units.
Roll the allocated dice for each target Unit separately (this is the Impact Hit Roll). For each result of Y or higher, set 1 die into the target’s Armour Pool. Proceed immediately to Armour Rolls. These hits do not generate Surge and treat Damage as 1.</description>
      <alias>IMPACT</alias>
    </rule>
    <rule name="LONG RANGE (X&quot;)" id="a7d8-c669-4f19-2b97" hidden="false">
      <description>The maximum Range of this weapon increases to X&quot;.

Measure each attacking model’s distance to the target individually:
- Within normal profile Range: attack resolves normally.
- Beyond profile Range but Within X&quot;: the model suffers a -1 Modifier to its Hit roll.

If a Batch contains models at both Standard and Long Range, generate the total dice but roll the two groups separately to account for different Hit Target Numbers.</description>
      <alias>LONG RANGE</alias>
    </rule>
    <rule name="SIDEARM" id="870d-b754-2961-8cb6" hidden="false">
      <description>When this Unit performs a Ranged Attack or Close Combat Attack, models equipped with this weapon may use it, ignoring the normal restriction of one weapon per model (Part 8.7.3). If a model is equipped with multiple SIDEARM weapons, it may use all of them in the same activation.

Attacks made with each SIDEARM must be resolved in separate Batches. Because they are separate Batches, SIDEARM attacks may target a different Enemy Unit than the Unit&apos;s other weapons, subject to all standard target eligibility requirements.</description>
    </rule>
    <rule name="INDIRECT FIRE" id="a19f-0594-dd63-2656" hidden="false">
      <description>Ranged Attacks with this weapon may ignore Line of Sight when selecting a target and resolving Damage. The target must still be Within Range. If the target is not Visible, it may make an Evade Roll against this attack.</description>
    </rule>
    <rule name="SPECIALIST" id="1974-2d46-8d07-3b29" hidden="false">
      <description>A Unit may include only one model equipped with this weapon. Multiple upgrades configuring more than one instance of this weapon are not permitted (Part 9.1.7).</description>
    </rule>
    <rule name="REPETABLE" id="f895-258a-9487-f59a" hidden="false">
      <description>REPEATABLE. Select another Friendly Biological Unit Within 8&quot;, spend CP and apply one of the following effects: 1 CP: That Unit’s first used weapon gains the CRITICAL HIT (2). 1 CP: That Unit ignores the Disengage penalty for the remainder of the Round. 2 CP: Remove the Activation Marker from that Unit.</description>
    </rule>
    <rule name="BULKY" id="f460-74cd-768c-a9e4" hidden="false">
      <description>This weapon cannot be used to make a Ranged Attack while the Unit is currently Engaged (Part 8.7.3).</description>
    </rule>
    <rule name="PIERCE [TAG] X" id="8a5b-c6c7-6abf-6879" hidden="false">
      <alias>PIERCE</alias>
      <description>When attacking a Unit with the specified Combat Tag, treat this weapon’s Damage characteristic as X.</description>
    </rule>
    <rule name="BUFF [Characteristic] (X)" id="db39-98a1-2d62-0e5c" hidden="false">
      <description>The Unit gains a bonus of X to the specified Characteristic until the End of the Round.
- Target Number Characteristic (e.g. Armour, Hit): reduce the value by X (easier to roll).
- Value Characteristic (e.g. Speed, RoA): increase the value by X.</description>
      <alias>BUFF</alias>
    </rule>
    <rule name="PRECISION (X)" id="d05b-cebb-50d1-ad49" hidden="false">
      <description>After rolling to Hit, move up to X failed Attack Dice directly into the Armour Pool. Treat them as successful Hits for all purposes, including Surge.</description>
      <alias>PRECISION</alias>
    </rule>
    <rule name="NON-LETHAL DAMAGE (X)" id="0ecb-de24-de57-9c58" hidden="false">
      <alias>NON-LETHAL DAMAGE</alias>
      <description>The Unit suffers X points of Damage. Add this amount effectively to the Unit’s Damage Marker. Unlike standard Damage, NON-LETHAL DAMAGE does not trigger the Remove Casualties step (Part 8.7.4, Step 5), even if Total Damage exceeds a model’s HP. If the Unit subsequently suffers standard Damage, the combined Total Damage triggers casualty removal normally.</description>
    </rule>
    <rule name="CRITICAL HIT (X)" id="3f61-d287-410a-0484" hidden="false">
      <description>Move X dice from the Armour Pool directly to the Damage Pool, bypassing Armour. CRITICAL HIT can never move more dice than are in the Armour Pool.</description>
      <alias>CRITICAL HIT</alias>
    </rule>
    <rule name="ON CREEP" id="b8db-d01a-89fd-efd3" hidden="false">
      <description>A Friendly or Enemy Ground Zerg Unit is considered to be ON CREEP while it is Within 6&quot; of any Creep Tumor Token or any model designated as a Source of Creep. While satisfying this condition, the Unit gains the ON CREEP Keyword. This allows the Unit to trigger specific Special Abilities or Upgrades that require this state.</description>
    </rule>
    <rule name="HIDDEN" id="4bf6-1de9-71aa-02a4" hidden="false">
      <description>This Unit cannot be selected as the target of a Ranged Attack or any LoS-requiring Special Ability unless the acting model is Within 4&quot; of it. A HIDDEN Unit is immune to the IMPACT Keyword. A HIDDEN Unit may make an Evade Roll against every attack targeting it.</description>
    </rule>
    <rule name="LOCKED IN (X)" id="7cfe-f96a-bbcb-8220" hidden="false">
      <alias>LOCKED IN</alias>
      <description>When making a Ranged Attack with this weapon, add X to its RoA if the target Unit has Stationary Status.</description>
    </rule>
    <rule name="HEAL (X)" id="9499-b51b-c280-c0bf" hidden="false">
      <alias>HEAL</alias>
      <description>Remove X points of accumulated Damage from the Unit (reduce its Damage Marker accordingly). HEAL cannot return Destroyed models - it only reduces existing Damage. See also: RESPAWN.</description>
    </rule>
    <rule name="PLACE (X)" id="1a3d-86d9-8aa7-68ab" hidden="false">
      <description>Choose a Leading Model. Remove it and set it Wholly Within X&quot; of its starting position. Then remove and replace all other models in the Unit, maintaining Coherency (Part 4.4). PLACE ignores Gap Clearance, and elevation requirements. The Leading Model is removed and set directly, not moved along a path. However, they must end in a legal position and not Within the Engagement Range. Models using the PLACE effect during the Assault Phase may be set Within the Engagement Range of Enemy models (the Unit becomes Engaged) unless stated otherwise.</description>
      <alias>PLACE</alias>
    </rule>
    <rule name="DISPLACEMENT" id="eb27-1500-88ca-d0f0" hidden="false">
      <description>The Leading Model may end a move Overlapping this Token or Unit (overrides Part 7.3.1).
If the Leading Model ends any Move, Deploy, Run, Charge, Disengage, Close Ranks or Special Ability move Overlapping this Token or model, the controlling player of the Leading Model immediately set it in Base-to-Base contact with the Leading Model. If Base-to-Base is not possible, set it as close as possible.</description>
    </rule>
    <rule name="TOUGH (X)" id="9928-edb1-53e5-438f" hidden="false">
      <description>When this Unit resolves an Armour Roll, change up to X failed results into successes. Treat them as meeting or exceeding the Armour characteristic - discard them without moving to the Damage Pool.</description>
      <alias>TOUGH</alias>
    </rule>
    <rule name="SUMMON (Unit Name)" id="1a39-f874-fdf2-c983" hidden="false">
      <description>SUMMON (Unit Name) Set the Leading Model of the named Unit in Base-to-Base contact with the Parent Unit. Set remaining models In Coherency. Models cannot be set Within the Engagement Range of any Enemy Unit.

Set an Activation Marker next to the summoned Unit - it cannot be Activated during the Phase in which it was summoned. In subsequent Phases, this Unit must be Activated immediately after its Parent Unit’s activation ends, before the opponent’s next activation.

The Summoned Unit cannot be set Within the opponent’s Zone of Influence.

The player must have sufficient Available Supply. If the Unit’s Current Supply Value would cause Total Current Supply to exceed the Supply Pool, it cannot be Summoned.

If the Parent is not present on the battlefield, this Unit can be Activated normally.</description>
      <alias>SUMMON</alias>
    </rule>
    <rule name="RESPAWN (X)" id="d273-74d1-fff7-7002" hidden="false">
      <description>Return up to X Destroyed models to this Unit.
- The return cannot increase the Unit’s Current Supply Value. Do not return a model if doing so would push the Unit into a higher Supply bracket.
- Set each returned model in Base-to-Base contact with an existing model in the Unit. Returned models cannot be set Within the Engagement Range of any Enemy Unit.
- If a model cannot be set legally, it cannot be returned.</description>
      <alias>RESPAWN</alias>
    </rule>
    <rule name="DEBUFF [Characteristic] (X)" id="e9c5-7999-24b7-4858" hidden="false">
      <description>The Unit suffers a penalty of X to the specified Characteristic until the End of the Round.
- Target Number Characteristic: increase the value by X (harder to roll).
- Value Characteristic: decrease the value by X (minimum 0).</description>
      <alias>DEBUFF</alias>
    </rule>
    <rule name="IMPASSABLE TERRAIN" id="0c68-af78-c6ca-9cf8" hidden="false">
      <description>A terrain piece is Impassable if it has no Access Point connecting it to an adjacent elevation level. Models cannot move through, onto, or across IMPASSABLE TERRAIN, and no model may end its movement overlapping it. Terrains of sizes 0 and 1 are never considered IMPASSABLE TERRAIN.</description>
    </rule>
    <rule name="INSTANT" id="a6a8-9065-8680-ddbd" hidden="false">
      <description>Enemy Units cannot declare or resolve Reaction abilities in response to attacks made with this weapon.</description>
    </rule>
    <rule name="ANTI-EVADE (X)" id="cfd0-ab4b-fc25-34be" hidden="false">
      <description>When resolving an attack with this weapon against Enemy Units, the target Unit suffers a -X Modifier to its Evade Roll for this attack (Part 8.7.4, Step 4).</description>
      <alias>ANTI-EVADE</alias>
    </rule>
    <rule name="PINPOINT" id="f9ad-69a2-80e6-c3a5" hidden="false">
      <description>Ranged Attacks with this weapon may target Engaged Enemy Units, ignoring the standard Engagement Status restriction (overrides Part 8.7.3, Step 1).</description>
    </rule>
    <rule name="STAY IN PLAY" id="3a1b-37a2-e426-abca" hidden="false">
      <description>This Token, Marker or Ability Effect persists through Cleanup &amp; Refresh (overrides Part 8.9.5). It remains until a specific condition removes it (e.g. destroyed or duration expires).</description>
    </rule>
  </sharedRules>
  <sharedSelectionEntries>
    <selectionEntry type="upgrade" import="true" name="ABANDONED CAMP" hidden="false" id="7d52-0151-6890-efad">
      <comment>Skirmish Deployment Map | Website ID: xxcLAuwGbNzHzggnAGLW | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a622-64f4-d058-b485"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm00-hide-mod">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm00-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="079a-b92c-c702-487b" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="ACROPOLIS" hidden="false" id="8867-f408-820f-61a1">
      <comment>Standard Deployment Map | Website ID: cW3aQQikqXLZlFEPLa4j | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="dcd7-a9d7-59a5-7bb6"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm01-hide-mod">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm01-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="bc50-404c-c9b5-4840" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="AGRIA VALLEY" hidden="false" id="9bbc-dd07-b172-7b3a">
      <comment>Skirmish Deployment Map | Website ID: Kqz626cBnNVxqdBJePDC | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="63ff-55cd-1646-1e03"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm02-hide-mod">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm02-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="52bc-6c28-86d8-4930" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="BREACH" hidden="false" id="0d04-f286-bc47-8bec">
      <comment>Standard Deployment Map | Website ID: E2Sv30MQfeLbO6Yqgx0l | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="3c08-8109-35c0-1d4c"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm03-hide-mod">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm03-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="ba62-d51c-ccd2-4e84" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="CHAR PLAINS" hidden="false" id="9710-c30a-2bb5-708a">
      <comment>Skirmish Deployment Map | Website ID: a7Ax3InF4uueg3gZ308P | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="dd4a-98ec-3216-44b9"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm04-hide-mod">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm04-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="ead4-cb41-1b10-4133" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="DIRT SIDE" hidden="false" id="3764-12ae-20ed-7a78">
      <comment>Skirmish Deployment Map | Website ID: yQ2mHJMUvEaupcdRVwjm | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="00f7-a2ae-cad7-667d"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm05-hide-mod">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm05-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="aa23-8660-0f36-471c" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="FRONTIER" hidden="false" id="d45e-a494-4545-719c">
      <comment>Skirmish Deployment Map | Website ID: BM1fW5aRzwYA8aKrXd6L | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="5ac8-234d-4343-3a96"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm06-hide-mod">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm06-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="bee2-6596-62d8-424b" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="GAUNTLET" hidden="false" id="574e-cf38-3a94-283c">
      <comment>Standard Deployment Map | Website ID: 2NdngLtIeZAprsWr25hM | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ed37-1292-4b95-4f75"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm07-hide-mod">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm07-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="b8c1-2c0c-c5bb-4fe6" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="PROVING GROUNDS" hidden="false" id="c6cb-bff3-9ca9-a43c">
      <comment>Standard Deployment Map | Website ID: BRp1aN4Ebvu3Wuc8afJj | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9668-8ac0-ce07-b426"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm08-hide-mod">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm08-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="eebb-bba4-4f6c-46d3" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="TYPHOON" hidden="false" id="8488-c350-b0f9-3e67">
      <comment>Standard Deployment Map | Website ID: Nwd5bN4pLjjol85hdyBU | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="c331-0640-80b6-0c11"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="dm09-hide-mod">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="dm09-limit-cond"/>
          </conditions>
        </modifier>
      </modifiers>
      <categoryLinks>
        <categoryLink targetId="d90f-1f84-6e45-9b27" id="68aa-3750-06b8-4928" primary="true" name="Deployment Maps"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Divide and Conquer" hidden="false" id="867c-9d4b-143d-eca1">
      <comment>Standard Engagement Mission Card | Website ID: mission_divide_and_conquer | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="42e5-f22a-2754-6d68"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="b474-7e47-89af-8c52">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="93b0-ccf3-2032-b2b8"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Divide and Conquer" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="c76d-ab1c-ca2b-96ae">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Standard Engagement</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">4</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">8</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">2 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Activated.
Split the battlefield into four Quarters as shown on the Deployment Card.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the First Round:
Calculate the Total Current Supply in each battlefield Quarter.
Gain 1 VP for each Quarter where your Total Current Supply is higher than the Opponent&#x27;s.
Only Units Wholly Within a Quarter contribute their Supply to this check.
If a Unit controls a Mission Marker, that Unit is worth 1 extra Supply for controlling Quarters.
Gain 2 VP for Controlling Mission Marker 5.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Special Winning Conditions: The game ends immediately if a Player leads by 10+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="9a83-02ce-500a-c332" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Divide and Conquer" hidden="false" id="4bb0-33b7-8631-a7d6">
      <comment>Skirmish Level Mission Card | Website ID: mission_divide_and_conquer__skirmish_ | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="3a7a-2cb4-2327-fe1c"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="1f86-b0e8-e12f-3f38">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="ea9e-c1eb-63f6-98ed"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Divide and Conquer" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="571f-e41c-de1a-7c01">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Skirmish Level</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">4</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">4</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">1 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Activated.
Split the battlefield into four Quarters as shown on the Deployment Card.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the First Round:
Calculate the Total Current Supply in each battlefield Quarter.
Gain 1 VP for each Quarter where your Total Current Supply is higher than the Opponent&#x27;s.
Only Units Wholly Within a Quarter contribute their Supply to this check.
If a Unit controls a Mission Marker, that Unit is worth 1 extra Supply for controlling Quarters.
Gain 2 VP for Controlling Mission Marker 5.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Special Winning Conditions: The game ends immediately if a Player leads by 8+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="6252-6c13-5ad1-d9c7" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Frontlines" hidden="false" id="0bea-4ed7-720a-e4c3">
      <comment>Standard Engagement Mission Card | Website ID: mission_frontlines | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="46b5-7ab4-d357-5fdf"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="60fd-7937-08ef-ac78">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="d2de-8be5-d177-cb24"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Frontlines" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="d15f-ba86-4218-bf5d">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Standard Engagement</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">5</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">6</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">2 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Activated.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the Second Round:
Gain 1 VP for each Controlled Mission Marker.
Gain an additional 2 VPs for a Marker if you gained Control of it from the Opponent this Round.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Special Winning Conditions: The game ends immediately if a Player leads by 10+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="7f7e-1572-eb0d-6045" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Frontlines" hidden="false" id="ed0b-9c9c-e1d7-af7e">
      <comment>Skirmish Level Mission Card | Website ID: mission_frontlines__skirmish_ | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b2d7-f643-1426-cbf7"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="0495-3a9a-5ea1-90ca">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="4951-ca7e-e4d3-7c16"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Frontlines" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="3e1a-1ca7-f91d-b67c">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Skirmish Level</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">5</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">3</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">1 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Activated.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the Second Round:
Gain 1 VP for each Controlled Mission Marker.
Gain an additional 2 VPs for a Marker if you gained Control of it from the Opponent this Round.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Special Winning Conditions: The game ends immediately if a Player leads by 8+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="a796-57bb-1e02-d40e" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Gather the Resources" hidden="false" id="9448-133e-5048-c69c">
      <comment>Standard Engagement Mission Card | Website ID: mission_gather_the_resources | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="5dda-2f55-7377-6411"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="91a4-f7ba-4f27-72dd">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="31e0-2193-d6c8-3204"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Gather the Resources" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="94d6-8e1f-dc85-6d13">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Standard Engagement</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">5</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">6</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">2 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Activated.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the Second Round:
Gain 2 VPs for each Controlled Mission Marker associated with the Opponent colour.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Assault Phase: If an Unengaged Unit is Within 3&quot; of a Controlled Neutral Mission Marker or associated with the Opponent, this unit may perform the Gather Action instead of a standard action.
Gather Action:
Gain 1 VP.
Special Winning Conditions: The game ends immediately if a Player leads by 10+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="2477-d327-21e1-c7f8" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Gather the Resources" hidden="false" id="9462-75bd-3874-4107">
      <comment>Skirmish Level Mission Card | Website ID: mission_gather_the_resources__skirmish_ | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="2332-68f3-e298-7953"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="cfc4-14d3-c044-05a2">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="f75a-b50f-7fd9-537d"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Gather the Resources" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="8f6e-a27f-c7c9-afe8">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Skirmish Level</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">5</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">3</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">1 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Activated.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the Second Round:
Gain 2 VPs for each Controlled Mission Marker associated with the Opponent colour.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Assault Phase: If an Unengaged Unit is Within 3&quot; of a Controlled Neutral Mission Marker or associated with the Opponent, this unit may perform the Gather Action instead of a standard action.
Gather Action:
Gain 1 VP.
Special Winning Conditions: The game ends immediately if a Player leads by 10+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="83c5-5423-ada4-9757" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Hold Position" hidden="false" id="8d8b-9f4b-1186-51b7">
      <comment>Standard Engagement Mission Card | Website ID: mission_hold_position | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7db9-8531-9e88-c73c"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="1529-7c6b-1d05-4306">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="5d50-aab4-313e-3ed4"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Hold Position" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="720a-48bc-6693-278f">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Standard Engagement</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">5</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">6</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">2 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Activated.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the Second Round:
Gain 1 VP for each Controlled Mission Marker that is Neutral or associated with your colour.
Gain 2 VPs for each Controlled Mission Marker associated with the Opponent colour.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Special Winning Conditions: The game ends immediately if a Player leads by 10+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="f4ca-b325-eaf5-9529" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Hold Position" hidden="false" id="782c-42a3-2e29-105b">
      <comment>Skirmish Level Mission Card | Website ID: mission_hold_position__skirmish_ | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="f30b-269f-53b5-01c0"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="6823-40af-673a-e770">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="2365-3e14-aa21-5efe"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Hold Position" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="6f70-6bc1-b435-d751">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Skirmish Level</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">5</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">3</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">1 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Activated.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the Second Round:
Gain 1 VP for each Controlled Mission Marker that is Neutral or associated with your colour.
Gain 2 VPs for each Controlled Mission Marker associated with the Opponent colour.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Special Winning Conditions: The game ends immediately if a Player leads by 8+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="0135-054b-37d6-e1b5" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Supply Drop" hidden="false" id="c0bd-6ca6-4efb-5f19">
      <comment>Standard Engagement Mission Card | Website ID: mission_supply_drop | Visible when the roster Minerals limit is greater than 1000.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7c35-798f-2ad3-ca5c"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="aee4-36c0-6021-e03b">
          <conditions>
            <condition type="lessThan" value="1001" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="eb4f-bc97-052e-b1e6"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Supply Drop" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="b00f-29b6-7003-198b">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Standard Engagement</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">5</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">6</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">2 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Deactivated.
Start of the Round (1-4): Randomly determine one Deactivated Mission Marker (1-4) and flip it to its Activated side.
Start of Round 5: Mission Marker 5 is automatically Activated.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the first Round: For each activated Controlled Mission Marker, gain VPs equal to the Game Round number in which that Mission Marker was Activated and remove it.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Special Winning Conditions: The game ends immediately if a Player leads by 12+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="e176-1f7b-de57-37ac" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Supply Drop" hidden="false" id="6f6a-bca3-b232-6236">
      <comment>Skirmish Level Mission Card | Website ID: mission_supply_drop__skirmish_ | Visible when the roster Minerals limit is 1000 or less.</comment>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="bbe1-c997-9386-710a"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden" id="e510-81c6-0055-3cdd">
          <conditions>
            <condition type="greaterThan" value="1000" field="limit::5bcf-897a-a5c9-d0e8" scope="roster" shared="true" includeChildSelections="false" includeChildForces="false" childId="any" id="fd57-4aaf-5d1c-e2d4"/>
          </conditions>
        </modifier>
      </modifiers>
      <profiles>
        <profile name="Supply Drop" typeId="fa2f-c1b9-95af-1670" typeName="Mission Card" hidden="false" id="898d-6496-3964-8c5f">

          <characteristics>

            <characteristic name="Format" typeId="e8de-be79-f9d9-5576">Skirmish Level</characteristic>

            <characteristic name="Game Length" typeId="4640-3d7a-8dae-f311">4</characteristic>

            <characteristic name="Supply" typeId="7ed0-b17e-2d84-faec">4</characteristic>

            <characteristic name="Per Round" typeId="9637-410b-3cce-2016">1 per round</characteristic>
              <characteristic name="Parameters" typeId="bbb3-41fd-6c95-e9b2">All Mission Markers are Deactivated.
Start of the Round (2-4): Randomly determine one Deactivated Mission Marker (1,2,5) and flip it to its Activated side.</characteristic>
              <characteristic name="Scoring Conditions" typeId="42ab-2780-c1e3-28e5">Score VPs equal to Enemy Supply destroyed this Round.
From the Start of the Second Round: For each activated Controlled Mission Marker, gain VPs equal to the Game Round number in which that Mission Marker was Activated and remove it.</characteristic>
              <characteristic name="Additional Conditions" typeId="ec8b-1bf0-f2bf-fbbb">Special Winning Conditions: The game ends immediately if a Player leads by 8+ VPs.</characteristic>
            </characteristics>

        </profile>
      </profiles>
      <categoryLinks>
        <categoryLink targetId="81f8-9a71-68ed-7dc6" id="7076-23e9-4556-41be" primary="true" name="Mission Cards"/>
      </categoryLinks>
    </selectionEntry>
  </sharedSelectionEntries>
  <categoryEntries>
    <categoryEntry name="Deployment Maps" id="d90f-1f84-6e45-9b27" hidden="false">
      <constraints>
        <constraint type="min" value="2" field="selections" scope="parent" shared="true" id="106f-4c2b-c3da-df01"/>
        <constraint type="max" value="2" field="selections" scope="parent" shared="true" id="625b-713d-d4aa-8f66"/>
      </constraints>
    </categoryEntry>
    <categoryEntry name="Mission Cards" id="81f8-9a71-68ed-7dc6" hidden="false">
      <constraints>
        <constraint type="min" value="2" field="selections" scope="parent" shared="true" id="270d-4ab3-61bd-1d55"/>
        <constraint type="max" value="2" field="selections" scope="parent" shared="true" id="346a-c141-4077-e1c8"/>
      </constraints>
    </categoryEntry>
    <categoryEntry name="Armoured" id="03d5-bf1b-74fa-ae6a" hidden="false"/>
    <categoryEntry name="Light" id="8312-ca6b-fa38-deef" hidden="false"/>
    <categoryEntry name="Ground" id="b947-4784-f388-d6a2" hidden="false"/>
    <categoryEntry name="Biological" id="8b0f-c3cd-9487-5030" hidden="false"/>
    <categoryEntry name="Unique" id="5adb-d04b-d3a5-9c7b" hidden="false"/>
    <categoryEntry name=" Mechanical" id="e9d0-aa9f-8c5e-a2c3" hidden="false"/>
    <categoryEntry name="Flying" id="46e8-c643-c323-b4c1" hidden="false"/>
    <categoryEntry name="Psionic" id="b915-b8d0-e25e-d12c" hidden="false"/>
  </categoryEntries>
  <sharedProfiles>
    <profile name="Squadron" typeId="a305-fb8b-8be3-f0fe" typeName="Rules (Any Phase)" hidden="false" id="fc8c-6bff-6d80-b316">
      <characteristics>
        <characteristic name="Effect" typeId="616e-c7be-abff-a2bf">This Unit’s Horizontal Coherency is 4&quot;.</characteristic>
        <characteristic name="Cost" typeId="1696-5ea7-559b-bb8b">Passive</characteristic>
      </characteristics>
    </profile>
    <profile name="Commander" typeId="a305-fb8b-8be3-f0fe" typeName="Rules (Any Phase)" hidden="false" id="c429-c517-b5d9-8e78">
      <characteristics>
        <characteristic name="Effect" typeId="616e-c7be-abff-a2bf">Treat this Unit’s Supply characteristic as increased by 1 for Controlling and Contesting Mission Markers, completing objectives, and resolving Disengage checks.</characteristic>
        <characteristic name="Cost" typeId="1696-5ea7-559b-bb8b">Passive</characteristic>
      </characteristics>
    </profile>
    <profile name="Structure" typeId="a305-fb8b-8be3-f0fe" typeName="Rules (Any Phase)" hidden="false" id="d3a4-0dbc-a379-e0fa">
      <characteristics>
        <characteristic name="Effect" typeId="616e-c7be-abff-a2bf">This Unit cannot be Activated in any Phase and cannot perform actions. Additionally, its Current Supply Value is treated as 0, and it can never Control or Contest Mission Markers, ignoring the standard Zero Supply Exception. This Unit cannot be a target of an ability, unless stated otherwise.</characteristic>
        <characteristic name="Cost" typeId="1696-5ea7-559b-bb8b">Passive</characteristic>
      </characteristics>
    </profile>
  </sharedProfiles>
</gameSystem>
