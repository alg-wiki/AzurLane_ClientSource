slot0 = ys or {}
ys = ys or 
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleConfig
slot3 = pg.ship_data_statistics
slot4 = pg.ship_data_template
slot5 = pg.ship_skin_template
slot6 = pg.enemy_data_statistics
slot7 = pg.weapon_property
slot8 = pg.formation_template
slot9 = pg.auto_pilot_template
slot10 = pg.aircraft_template
slot11 = pg.ship_skin_words
slot12 = pg.equip_data_statistics
slot13 = pg.equip_data_template
slot14 = pg.enemy_data_skill
slot15 = pg.ship_data_personality
slot16 = pg.enemy_data_by_type
slot17 = pg.ship_data_by_type
slot18 = pg.ship_level
slot19 = pg.skill_data_template
slot20 = pg.ship_data_trans
slot21 = pg.challenge_rate_template
slot22 = pg.equip_skin_template
slot23 = pg.activity_template
slot24 = pg.activity_event_worldboss
slot25 = pg.map_data
ys.Battle.BattleDataFunction = ys.Battle.BattleDataFunction or {}

ys or .Battle.BattleDataFunction.CreateBattleUnitData = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)
	slot13, slot14 = nil

	if slot1 == slot0.UnitType.PLAYER_UNIT then
		slot1.Battle.BattlePlayerUnit.New(slot0, slot2).SetSkinId(slot13, slot4)
		slot1.Battle.BattlePlayerUnit.New(slot0, slot2).SetRepressReduce(slot13, slot9)
		slot1.Battle.BattlePlayerUnit.New(slot0, slot2):SetWeaponInfo(slot11, slot12)

		slot14 = Ship.WEAPON_COUNT
	else
		if slot1 == slot0.UnitType.ENEMY_UNIT then
			slot1.Battle.BattleEnemyUnit.New(slot0, slot2):SetRepress(slot8)
		else
			if slot1 == slot0.UnitType.BOSS_UNIT then
				slot1.Battle.BattleBossUnit.New(slot0, slot2):SetRepress(slot8)
			else
				if slot1 == slot0.UnitType.NPC_UNIT then
					slot13 = slot1.Battle.BattleNPCUnit.New(slot0, slot2)
				end
			end
		end
	end

	slot13:SetTemplate(slot3, slot6)

	if slot1 == slot0.UnitType.ENEMY_UNIT or slot1 == slot0.UnitType.BOSS_UNIT then
		slot13:SetCurrentHP(slot13:GetMaxHP() * slot10)
	end

	slot15 = {}

	if slot1 == slot0.UnitType.ENEMY_UNIT or slot1 == slot0.UnitType.BOSS_UNIT then
		for slot19, slot20 in ipairs(slot5) do
			slot15[#slot15 + 1] = {
				equipment = {
					weapon_id = {
						slot20.id
					}
				}
			}
		end
	else
		for slot19, slot20 in ipairs(slot5) do
			if not slot20.id then
				slot15[#slot15 + 1] = {
					equipment = false,
					skin = slot20.skin
				}
			else
				if not slot14 or slot19 <= slot14 or #slot2.GetWeaponDataFromID(slot20.id).weapon_id then
					slot15[#slot15 + 1] = {
						equipment = slot2.GetWeaponDataFromID(slot20.id),
						skin = slot20.skin
					}
				else
					slot15[#slot15 + 1] = {
						equipment = false,
						skin = slot20.skin
					}
				end
			end
		end
	end

	slot13:SetProficiencyList(slot7)
	slot13:SetEquipment(slot15)

	return slot13
end

ys or .Battle.BattleDataFunction.InitUnitSkill = function (slot0, slot1)
	if not slot0.skills then
		slot2 = {}
	end

	slot3 = slot0.Battle.BattleState.GetInstance():GetBattleType()

	for slot7, slot8 in pairs(slot2) do
		slot10 = false

		if slot0.Battle.BattleDataFunction.GetBuffTemplate(slot8.id, slot8.level).limit then
			for slot14, slot15 in ipairs(slot9) do
				if slot3 == slot15 then
					slot10 = true

					break
				end
			end
		end

		if not slot10 then
			slot1:AddBuff(slot0.Battle.BattleBuffUnit.New(slot8.id, slot8.level))
		end
	end

	return
end

ys or .Battle.BattleDataFunction.InitEquipSkill = function (slot0, slot1, slot2)
	slot3 = slot0.Battle.BattleState.GetInstance():GetBattleType()

	for slot7, slot8 in ipairs(slot0) do
		if slot8.id then
			slot10 = {}

			if slot2 and slot2 < slot7 then
				if slot1.GetWeaponDataFromID(slot9) ~= nil then
					slot10 = slot11.skill_id
				end
			else
				slot10 = slot1.GetWeaponDataFromID(slot9).skill_id
			end

			for slot14, slot15 in ipairs(slot10) do
				slot17 = false

				if slot0.Battle.BattleDataFunction.GetBuffTemplate(slot15, 1).limit then
					for slot21, slot22 in ipairs(slot16) do
						if slot3 == slot22 then
							slot17 = true

							break
						end
					end
				end

				if not slot17 then
					slot1:AddBuff(slot0.Battle.BattleBuffUnit.New(slot15))
				end
			end
		end
	end

	return
end

ys or .Battle.BattleDataFunction.InitCommanderSkill = function (slot0, slot1)
	if not slot0 then
		slot0 = {}
	end

	slot2 = slot0.Battle.BattleState.GetInstance():GetBattleType()

	for slot6, slot7 in pairs(slot0) do
		slot9 = false

		if slot0.Battle.BattleDataFunction.GetBuffTemplate(slot7.id, slot7.level).limit then
			for slot13, slot14 in ipairs(slot8) do
				if slot2 == slot14 then
					slot9 = true

					break
				end
			end
		end

		if not slot9 then
			slot10 = slot0.Battle.BattleBuffUnit.New(slot7.id, slot7.level)

			slot10:SetCommander(slot7.commander)
			slot1:AddBuff(slot10)
		end
	end

	return
end

ys or .Battle.BattleDataFunction.CreateWeaponUnit = function (slot0, slot1, slot2, slot3)
	if not slot3 then
		slot3 = -1
	end

	slot4 = slot1:GetUnitType()
	slot5 = nil

	if slot0:GetWeaponPropertyDataFromID().type == slot1.EquipmentType.MAIN_CANNON then
		slot5 = slot2.Battle.BattleWeaponUnit.New()
	else
		if slot6.type == slot1.EquipmentType.SUB_CANNON then
			slot5 = slot2.Battle.BattleWeaponUnit.New()
		else
			if slot6.type == slot1.EquipmentType.TORPEDO then
				slot5 = slot2.Battle.BattleTorpedoUnit.New()
			else
				if slot6.type == slot1.EquipmentType.MANUAL_TORPEDO then
					slot5 = slot2.Battle.BattleManualTorpedoUnit.New()
				else
					if slot6.type == slot1.EquipmentType.ANTI_AIR then
						slot5 = slot2.Battle.BattleAntiAirUnit.New()
					else
						if slot6.type == slot1.EquipmentType.FLEET_ANTI_AIR then
							slot5 = slot2.Battle.BattleWeaponUnit.New()
						else
							if slot6.type == slot1.EquipmentType.SCOUT or slot6.type == slot1.EquipmentType.PASSIVE_SCOUT then
								slot5 = slot2.Battle.BattleHiveUnit.New()
							else
								if slot6.type == slot1.EquipmentType.SPECIAL then
									slot5 = slot2.Battle.BattleSpecialWeapon.New()
								else
									if slot6.type == slot1.EquipmentType.ANTI_SEA then
										slot5 = slot2.Battle.BattleDirectHitWeaponUnit.New()
									else
										if slot6.type == slot1.EquipmentType.HAMMER_HEAD then
											slot5 = slot2.Battle.BattleHammerHeadWeaponUnit.New()
										else
											if slot6.type == slot1.EquipmentType.BOMBER_PRE_CAST_ALERT then
												slot5 = slot2.Battle.BattleBombWeaponUnit.New()
											else
												if slot6.type == slot1.EquipmentType.POINT_HIT_AND_LOCK then
													slot5 = slot2.Battle.BattlePointHitWeaponUnit.New()
												else
													if slot6.type == slot1.EquipmentType.BEAM then
														slot5 = slot2.Battle.BattleLaserUnit.New()
													else
														if slot6.type == slot1.EquipmentType.DEPTH_CHARGE then
															slot5 = slot2.Battle.BattleDepthChargeUnit.New()
														else
															if slot6.type == slot1.EquipmentType.REPEATER_ANTI_AIR then
																slot5 = slot2.Battle.BattleRepeaterAntiAirUnit.New()
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot5:SetPotentialFactor(slot2)
	slot5:SetEquipmentIndex(slot3)
	slot5:SetTemplateData(slot6)
	slot5:SetHostData(slot1)

	if slot4 == slot1.UnitType.PLAYER_UNIT then
		slot5:OverrideGCD(slot3.PLAYER_WEAPON_GLOBAL_COOL_DOWN_DURATION)
	else
		if slot4 == slot1.UnitType.ENEMY_UNIT or slot1.UnitType.BOSS_UNIT then
			slot5:HostOnEnemy()
		end
	end

	if slot6.type == slot1.EquipmentType.SCOUT or slot6.type == slot1.EquipmentType.PASSIVE_SCOUT then
		slot5:EnterCoolDown()
	end

	return slot5
end

ys or .Battle.BattleDataFunction.CreateAircraftUnit = function (slot0, slot1, slot2, slot3)
	slot4 = nil

	if type(slot0.GetAircraftTmpDataFromID(slot1).funnel_behavior) == "table" then
		if slot5.funnel_behavior.hover_range then
			slot4 = slot1.Battle.BattelUAVUnit.New(slot0)
		else
			slot4 = slot1.Battle.BattleFunnelUnit.New(slot0)
		end
	else
		slot4 = slot1.Battle.BattleAircraftUnit.New(slot0)
	end

	slot4:SetMotherUnit(slot2)
	slot4:SetWeanponPotential(slot3)
	slot4:SetTemplate(slot5)

	return slot4
end

ys or .Battle.BattleDataFunction.CreateAllInStrike = function (slot0)
	slot3 = 0
	slot4 = {}

	for slot8, slot9 in ipairs(slot0.GetPlayerShipModelFromID(slot1).airassist_time) do
		slot10 = slot1.Battle.BattleAllInStrike.New(slot9)

		slot10:SetHost(slot0)

		slot4[slot8] = slot10
	end

	return slot4
end

ys or .Battle.BattleDataFunction.ExpandAllinStrike = function (slot0)
	if #slot0.GetPlayerShipModelFromID(slot1).airassist_time > 0 then
		slot5 = slot1.Battle.BattleAllInStrike.New(slot4)

		slot5:SetHost(slot0)
		slot0:GetFleetVO():GetAirAssistVO():AppendWeapon(slot5)
		slot5:OverHeat()
		slot0:GetAirAssistQueue():AppendWeapon(slot5)

		slot0:GetAirAssistList()[#slot0.GetAirAssistList() + 1] = slot5
	end

	return
end

ys or .Battle.BattleDataFunction.CreateAirFighterUnit = function (slot0, slot1)
	slot1.Battle.BattleAirFighterUnit.New(slot0).SetWeaponTemplateID(nil, slot1.weaponID)
	slot1.Battle.BattleAirFighterUnit.New(slot0):SetTemplate(slot0.GetAircraftTmpDataFromID(slot1.templateID))

	return slot1.Battle.BattleAirFighterUnit.New(slot0)
end

ys or .Battle.BattleDataFunction.GetPlayerShipTmpDataFromID = function (slot0)
	return Clone(slot0[slot0])
end

ys or .Battle.BattleDataFunction.GetPlayerShipModelFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetPlayerShipSkinDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetShipTypeTmp = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetMonsterTmpDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetAircraftTmpDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetWeaponDataFromID = function (slot0)
	if slot0 ~= Equipment.EQUIPMENT_STATE_EMPTY and slot0 ~= Equipment.EQUIPMENT_STATE_LOCK then
	end

	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetEquipDataTemplate = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetWeaponPropertyDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetFormationTmpDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetAITmpDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetShipPersonality = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetEnemyTypeDataByType = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetPlayerUnitDurabilityExtraAddition = function (slot0, slot1)
	if slot0 == SYSTEM_DUEL or slot0 == SYSTEM_SHAM then
		return slot0[slot1].arena_durability_ratio, slot0[slot1].arena_durability_add
	else
		return 1, 0
	end

	return
end

ys or .Battle.BattleDataFunction.GetSkillDataTemplate = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetShipTransformDataTemplate = function (slot0)
	return slot1[slot0:GetPlayerShipModelFromID().group_type]
end

ys or .Battle.BattleDataFunction.GetRateTemplate = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetEquipSkinDataFromID = function (slot0)
	return slot0[slot0]
end

ys or .Battle.BattleDataFunction.GetEquipSkin = function (slot0)
	return slot0[slot0].bullet_name, slot0[slot0].derivate_bullet, slot0[slot0].derivate_torpedo, slot0[slot0].derivate_boom
end

ys or .Battle.BattleDataFunction.GetSpecificEnemyList = function (slot0, slot1)
	slot5 = nil

	for slot9, slot10 in ipairs(slot4) do
		if slot10[1] == slot1 then
			slot5 = slot10[2]

			break
		end
	end

	return slot5
end

ys or .Battle.BattleDataFunction.IncreaseAttributes = function (slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot2) do
		if slot7[slot1] ~= nil and type(slot7[slot1]) == "number" then
			slot0 = slot0 + slot7[slot1]
		end
	end

	return
end

ys or .Battle.BattleDataFunction.CreateAirFighterWeaponUnit = function (slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot0:GetWeaponPropertyDataFromID().type == slot1.EquipmentType.MAIN_CANNON then
		slot4 = slot2.Battle.BattleWeaponUnit.New()
	else
		if slot5.type == slot1.EquipmentType.SUB_CANNON then
			slot4 = slot2.Battle.BattleWeaponUnit.New()
		else
			if slot5.type == slot1.EquipmentType.TORPEDO then
				slot4 = slot2.Battle.BattleTorpedoUnit.New()
			else
				if slot5.type == slot1.EquipmentType.ANTI_AIR then
					slot4 = slot2.Battle.BattleAntiAirUnit.New()
				else
					if slot5.type == slot1.EquipmentType.ANTI_SEA then
						slot4 = slot2.Battle.BattleDirectHitWeaponUnit.New()
					else
						if slot5.type == slot1.EquipmentType.HAMMER_HEAD then
							slot4 = slot2.Battle.BattleHammerHeadWeaponUnit.New()
						else
							if slot5.type == slot1.EquipmentType.BOMBER_PRE_CAST_ALERT then
								slot4 = slot2.Battle.BattleBombWeaponUnit.New()
							else
								if slot5.type == slot1.EquipmentType.DEPTH_CHARGE then
									slot4 = slot2.Battle.BattleDepthChargeUnit.New()
								end
							end
						end
					end
				end
			end
		end
	end

	slot4:SetPotentialFactor(slot3)

	Clone(slot5).spawn_bound = "weapon"

	slot4:SetTemplateData(slot6)
	slot4:SetHostData(slot1, slot2)

	return slot4
end

ys or .Battle.BattleDataFunction.GetWords = function (slot0, slot1, slot2)
	if (type(Ship.getShipWords(slot0)[slot1]) == "string" and slot3 == "") or (type(slot3) == "table" and #slot3 == 0) then
		return Ship.getShipWords(slot2)[slot1]
	else
		return Ship.getShipWords(slot0)[slot1]
	end

	return
end

ys or .Battle.BattleDataFunction.SkillTranform = function (slot0, slot1)
	if slot0.GetSkillDataTemplate(slot1).system_transform[slot0] == nil then
		return slot1
	else
		return slot3[slot0]
	end

	return
end

ys or .Battle.BattleDataFunction.GenerateHiddenBuff = function (slot0)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		slot2[slot7] = {
			level = 1,
			id = slot7
		}
	end

	return slot2
end

ys or .Battle.BattleDataFunction.GetDivingFilter = function (slot0)
	return slot0[slot0].diving_filter
end

ys or .Battle.BattleDataFunction.GeneratePlayerSubmarinPhase = function (slot0, slot1, slot2, slot3, slot4)
	return {
		{
			index = 0,
			switchType = 3,
			switchTo = 1,
			switchParam = slot0 - slot2
		},
		{
			index = 1,
			dive = "STATE_RAID",
			switchTo = 2,
			switchType = 1,
			switchParamFunc = slot3
		},
		{
			switchType = 1,
			dive = "STATE_FLOAT",
			switchTo = 3,
			index = 2,
			switchParam = slot4
		},
		{
			switchType = 4,
			dive = "STATE_RETREAT",
			switchTo = 4,
			index = 3,
			switchParam = slot1
		},
		{
			index = 4,
			retreat = true
		}
	}
end

return

slot0 = 
slot27 = 
