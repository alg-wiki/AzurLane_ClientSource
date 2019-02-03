ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = ys.Battle.BattleFormulas
slot4 = ys.Battle.BattleConst
slot6 = ys.Battle.BattleDataFunction
slot7 = class("BattleFleetVO")
ys.Battle.BattleFleetVO = slot7
slot7.__name = "BattleFleetVO"
slot7.SIGHT_A = ys.Battle.BattleConfig.ChargeWeaponConfig.SIGHT_A
slot7.SIGHT_B = ys.Battle.BattleConfig.ChargeWeaponConfig.SIGHT_B
slot7.SIGHT_C = ys.Battle.BattleConfig.ChargeWeaponConfig.SIGHT_C

function slot7.Ctor(slot0, slot1)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._IFF = slot1
	slot0._lastDist = 0

	slot0:init()
end

function slot7.UpdateMotion(slot0)
	if slot0._motionReferenceUnit then
		slot0._motionVO:UpdatePos(slot0._motionReferenceUnit)
		slot0._motionVO:UpdateVelocityAndDirection(slot0:GetFleetVelocity(), slot0._motionSourceFunc())
	end

	if math.max(slot0._motionVO:GetPos().x - slot0._rightBound, 0) >= 0 and slot1 ~= slot0._lastDist then
		slot0._lastDist = slot1

		slot0:DispatchEvent(slot0.Event.New(slot1.SHOW_BUFFER, {
			dist = slot1
		}))
	end
end

function slot7.UpdateAutoComponent(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._scoutList) do
		slot6:UpdateWeapon(slot1)
	end

	for slot5, slot6 in ipairs(slot0._mainList) do
		slot6:UpdateWeapon(slot1)
		slot6:UpdateAirAssist()
	end

	for slot5, slot6 in ipairs(slot0._subList) do
		slot6:UpdateWeapon(slot1)
		slot6:UpdateOxygen(slot1)
		slot6:UpdatePhaseSwitcher()
	end
end

function slot7.UpdateWeaponVO(slot0, slot1)
	slot0._chargeWeaponVO:Update(slot1)
	slot0._torpedoWeaponVO:Update(slot1)
	slot0._airAssistVO:Update(slot1)
	slot0._fleetAntiAir:Update(slot1)
	slot0._fleetSonar:Update(slot1)

	for slot5, slot6 in pairs(slot0._indieSonarList) do
		slot5:Update(slot1)
	end
end

function slot7.UpdateFleetDamage(slot0, slot1)
	slot0._currentDMGRatio = slot0._currentDMGRatio + slot0.CalculateFleetDamage(slot1)

	slot0:DispatchFleetDamageChange()
end

function slot7.UpdateFleetOverDamage(slot0, slot1)
	slot0._currentDMGRatio = slot0._currentDMGRatio - slot0:CalculateFleetOverDamage(slot1)

	slot0:DispatchFleetDamageChange()
end

function slot7.DispatchFleetDamageChange(slot0)
	slot0:DispatchEvent(slot0.Event.New(slot1.FLEET_DMG_CHANGE, {}))
end

function slot7.DispatchSonarScan(slot0, slot1)
	slot0:DispatchEvent(slot0.Event.New(slot1.SONAR_SCAN, {
		indieSonar = slot1
	}))
end

function slot7.FreeMainUnit(slot0, slot1)
	if slot0._mainUnitFree then
		return
	end

	slot0._mainUnitFree = true

	for slot5, slot6 in ipairs(slot0._mainList) do
		slot6:AddBuff(slot7)
		slot6:SetMainUnitStatic(false)
	end
end

function slot7.SetMotionSource(slot0, slot1)
	if slot1 == nil then
		function slot0._motionSourceFunc()
			return pg.UIMgr:GetInstance().hrz, pg.UIMgr.GetInstance().vtc
		end
	else
		slot0._motionSourceFunc = slot1
	end
end

function slot7.SetSubAidData(slot0, slot1, slot2)
	slot0._submarineVO = slot0.Battle.BattleSubmarineAidVO.New()

	if slot2 == slot1.SubAidFlag.AID_EMPTY or slot2 == slot1.SubAidFlag.OIL_EMPTY then
		slot0._submarineVO:SetUseable(false)
	else
		slot0._submarineVO:SetCount(slot2)
		slot0._submarineVO:SetTotal(slot1)
		slot0._submarineVO:SetUseable(true)
	end
end

function slot7.SetBound(slot0, slot1, slot2, slot3, slot4)
	slot0._upperBound = slot1
	slot0._lowerBound = slot2
	slot0._leftBound = slot3
	slot0._rightBound = slot4
end

function slot7.SetTotalBound(slot0, slot1, slot2, slot3, slot4)
	slot0._totalUpperBound = slot1
	slot0._totalLowerBound = slot2
	slot0._totalLeftBound = slot3
	slot0._totalRightBound = slot4
end

function slot7.CalcSubmarineBaseLine(slot0, slot1)
	slot2 = (slot0._totalRightBound + slot0._totalLeftBound) * 0.5

	if slot0._IFF == slot0.FRIENDLY_CODE then
		if slot1 == SYSTEM_DUEL then
		elseif slot1 == SYSTEM_SHAM then
		else
			slot0._subAttackBaseLine = slot2
			slot0._subRetreatBaseLine = slot0._leftBound - 10
		end
	elseif slot0._IFF == slot0.FOE_CODE then
		if slot1 == SYSTEM_DUEL then
		elseif slot1 == SYSTEM_SHAM then
		end
	end
end

function slot7.AppendPlayerUnit(slot0, slot1)
	slot0._unitList[#slot0._unitList + 1] = slot1
	slot0._maxCount = slot0._maxCount + 1

	if slot1:IsMainFleetUnit() then
		slot0:appendMainUnit(slot1)
		slot1:SetMainUnitIndex(#slot0._mainList)
	else
		slot0:appendScoutUnit(slot1)
	end

	slot1:SetFleetVO(slot0)
	slot1:SetMotion(slot0._motionVO)
	slot1:RegisterEventListener(slot0, slot0.UPDATE_HP, slot0.onUnitUpdateHP)
end

function slot7.RemovePlayerUnit(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0._unitList) do
		if slot7 ~= slot1 then
			slot2[#slot2 + 1] = slot6
		else
			slot7:UnregisterEventListener(slot0, slot0.UPDATE_HP)
			slot7:DeactiveCldBox()

			for slot12, slot13 in ipairs(slot8) do
				if slot13:IsAttacking() then
					slot0._chargeWeaponVO:CancelFocus()
					slot0._chargeWeaponVO:ResetFocus()
					slot0:CancelChargeWeapon()
				end

				slot0._chargeWeaponVO:RemoveWeapon(slot13)
				slot13:Clear()
			end

			slot0._fleetAntiAir:RemoveCrewUnit(slot1)
			slot0._fleetSonar:RemoveCrewUnit(slot1)

			for slot13, slot14 in ipairs(slot9) do
				if slot14:IsAttacking() then
					slot0:CancelTorpedo()
				end

				slot0._torpedoWeaponVO:RemoveWeapon(slot14)
				slot14:Clear()
			end

			if slot7:GetAirAssistList() then
				for slot14, slot15 in ipairs(slot10) do
					slot0._airAssistVO:RemoveWeapon(slot15)
				end
			end
		end
	end

	for slot6, slot7 in ipairs(slot0._scoutList) do
		if slot7 == slot1 then
			if #slot0._scoutList == 1 then
				slot0:CancelChargeWeapon()
			end

			table.remove(slot0._scoutList, slot6)

			break
		end
	end

	for slot6, slot7 in ipairs(slot0._mainList) do
		if slot7 == slot1 then
			table.remove(slot0._mainList, slot6)

			break
		end
	end

	slot0:refreshFleetFormation(slot2)
end

function slot7.SnapShot(slot0)
	slot0._totalDMGRatio = slot0:GetFleetTotalHP()
	slot0._currentDMGRatio = slot0._totalDMGRatio
end

function slot7.GetIFF(slot0)
	return slot0._IFF
end

function slot7.GetMaxCount(slot0)
	return slot0._maxCount
end

function slot7.GetFlagShip(slot0)
	return slot0._flagShip
end

function slot7.GetUnitList(slot0)
	return slot0._unitList
end

function slot7.GetMainList(slot0)
	return slot0._mainList
end

function slot7.GetScoutList(slot0)
	return slot0._scoutList
end

function slot7.GetMotion(slot0)
	return slot0._motionVO
end

function slot7.GetChargeWeaponVO(slot0)
	return slot0._chargeWeaponVO
end

function slot7.GetTorpedoWeaponVO(slot0)
	return slot0._torpedoWeaponVO
end

function slot7.GetAirAssistVO(slot0)
	return slot0._airAssistVO
end

function slot7.GetSubAidVO(slot0)
	return slot0._submarineVO
end

function slot7.GetFleetAntiAirWeapon(slot0)
	return slot0._fleetAntiAir
end

function slot7.GetFleetVelocity(slot0)
	return slot0.GetFleetVelocity(slot0._scoutList)
end

function slot7.GetFleetBound(slot0)
	return slot0._upperBound, slot0._lowerBound, slot0._leftBound, slot0._rightBound
end

function slot7.GetLeaderPersonality(slot0)
	return slot0._motionReferenceUnit:GetAutoPilotPreference()
end

function slot7.GetDamageRatioResult(slot0)
	return string.format("%0.2f", slot0._currentDMGRatio / slot0._totalDMGRatio * 100), slot0._totalDMGRatio
end

function slot7.GetDamageRatio(slot0)
	return slot0._currentDMGRatio / slot0._totalDMGRatio
end

function slot7.GetSubmarineBaseLine(slot0)
	return slot0._subAttackBaseLine, slot0._subRetreatBaseLine
end

function slot7.GetFleetSonar(slot0)
	return slot0._fleetSonar
end

function slot7.Dispose(slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
	slot0.EventListener.DetachEventListener(slot0)

	slot0._leaderUnit = nil

	slot0._fleetAntiAir:Dispose()
	slot0._fleetSonar:Dispose()

	slot0._fleetSonar = nil
	slot0._indieSonarList = nil
end

function slot7.refreshFleetFormation(slot0, slot1)
	slot2 = slot0.GetFormationTmpDataFromID(slot1.FORMATION_ID).pos_offset
	slot0._unitList = slot0.SortFleetList(slot1, slot0._unitList)
	slot3 = slot1.BornOffset

	if not slot0._mainUnitFree then
		for slot7, slot8 in ipairs(slot0._unitList) do
			if not table.contains(slot0._subList, slot8) then
				slot8:UpdateFormationOffset(Vector3(slot2[slot7].x, slot2[slot7].y, slot2[slot7].z) + slot3 * (slot7 - 1))
			end
		end
	end

	if #slot0._scoutList > 0 then
		slot0._motionReferenceUnit = slot0._scoutList[1]
		slot0._leaderUnit = slot0._scoutList[1]

		slot0._leaderUnit:LeaderSetting()
		slot0._fleetAntiAir:SwitchHost(slot0._motionReferenceUnit)
		slot0._fleetSonar:SwitchHost(slot0._motionReferenceUnit)

		for slot7, slot8 in pairs(slot0._indieSonarList) do
			slot7:SwitchHost(slot0._motionReferenceUnit)
		end

		slot0._motionVO:UpdatePos(slot0._motionReferenceUnit)
	elseif slot0._fleetAntiAir:GetCurrentState() ~= slot0._fleetAntiAir.STATE_DISABLE then
		for slot8, slot9 in pairs(slot4) do
			slot0._motionReferenceUnit = slot8

			slot0._fleetAntiAir:SwitchHost(slot8)

			break
		end
	else
		slot0._motionReferenceUnit = slot0._mainList[1]
		slot0._leaderUnit = nil
	end
end

function slot7.init(slot0)
	slot0._chargeWeaponVO = slot0.Battle.BattleChargeWeaponVO.New()
	slot0._torpedoWeaponVO = slot0.Battle.BattleTorpedoWeaponVO.New()
	slot0._airAssistVO = slot0.Battle.BattleAllInStrikeVO.New()
	slot0._fleetAntiAir = slot0.Battle.BattleFleetAntiAirUnit.New()
	slot0._motionVO = slot0.Battle.BattleFleetMotionVO.New()
	slot0._fleetSonar = slot0.Battle.BattleFleetSonar.New(slot0)
	slot0._indieSonarList = {}
	slot0._scoutList = {}
	slot0._mainList = {}
	slot0._subList = {}
	slot0._unitList = {}
	slot0._maxCount = 0
	slot0._blockCast = false

	slot0:SetMotionSource()
end

function slot7.appendScoutUnit(slot0, slot1)
	slot0._scoutList[#slot0._scoutList + 1] = slot1

	for slot6, slot7 in ipairs(slot2) do
		slot0._torpedoWeaponVO:AppendWeapon(slot7)
	end

	slot0._fleetAntiAir:AppendCrewUnit(slot1)
	slot0._fleetSonar:AppendCrewUnit(slot1)

	slot3 = 1
	slot4 = #slot0._unitList
	slot5 = {}

	while slot3 < slot4 do
		table.insert(slot5, slot3)

		slot3 = slot3 + 1
	end

	table.insert(slot5, #slot0._scoutList, slot3)
	slot0:refreshFleetFormation(slot5)
end

function slot7.appendMainUnit(slot0, slot1)
	if #slot0._mainList == 0 then
		slot0._flagShip = slot1
	end

	slot0._mainList[#slot0._mainList + 1] = slot1

	for slot6, slot7 in ipairs(slot2) do
		slot0._chargeWeaponVO:AppendWeapon(slot7)
	end

	if #slot1:GetHiveList() > 0 then
		for slot8, slot9 in ipairs(slot4) do
			slot0._airAssistVO:AppendWeapon(slot9)
		end

		slot1:SetAirAssistList(slot4)
	end

	slot0._fleetAntiAir:AppendCrewUnit(slot1)

	slot4 = {}

	for slot8, slot9 in ipairs(slot0._unitList) do
		table.insert(slot4, slot8)
	end

	slot0:refreshFleetFormation(slot4)
end

function slot7.appendSubUnit(slot0, slot1)
	slot0._subList[#slot0._subList + 1] = slot1

	slot1:SetMainUnitIndex(#slot0._subList)
end

function slot7.FleetWarcry(slot0)
	slot1 = nil
	slot2 = math.random(0, 1)
	slot3 = slot0:GetScoutList()[1]

	if slot0:GetMainList()[1] == nil or slot2 == 0 then
		slot1 = slot3
	elseif slot2 == 1 then
		slot1 = slot4
	end

	slot1:DispatchVoice(slot5)
	slot1:DispatchChat(slot0.Battle.BattleDataFunction.GetWords(slot1:GetSkinID(), slot5, slot1:GetDefaultSkinID()), 2.5, "battle")
end

function slot7.SubWarcry(slot0)
	slot0:GetSubList()[1].DispatchVoice(slot1, slot2)
	slot0.GetSubList()[1]:DispatchChat(slot0.Battle.BattleDataFunction.GetWords(slot0.GetSubList()[1].GetSkinID(slot1), slot2, slot0.GetSubList()[1].GetDefaultSkinID(slot1)), 2.5, "battle")
end

function slot7.SetWeaponBlock(slot0, slot1)
	slot0._blockCast = slot1
end

function slot7.GetWeaponBlock(slot0)
	return slot0._blockCast
end

function slot7.CastChargeWeapon(slot0)
	if slot0._blockCast then
		return
	end

	if slot0._chargeWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_READY then
		slot1:Charge()
		slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.POINT_HIT_CHARGE, slot2))
	end
end

function slot7.CancelChargeWeapon(slot0)
	if slot0._chargeWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_PRECAST then
		slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.POINT_HIT_CANCEL, slot2))
		slot1:CancelCharge()
	end
end

function slot7.UnleashChrageWeapon(slot0)
	if slot0._blockCast then
		slot0:CancelChargeWeapon()

		return
	end

	if slot0._chargeWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_PRECAST then
		if slot1:IsStrikeMode() then
			slot0:fireChargeWeapon(slot1, true, Vector3.New(math.min(slot0._motionVO:GetPos().x + slot0.SIGHT_C, slot0._totalRightBound), 0, slot0._motionVO:GetPos().z))
		else
			slot1:CancelCharge()
		end

		slot0:DispatchEvent(slot1.Event.New(slot1.Battle.BattleUnitEvent.POINT_HIT_CANCEL, slot2))
	end
end

function slot7.QuickTagChrageWeapon(slot0, slot1)
	if slot0._blockCast then
		return
	end

	if slot0._chargeWeaponVO:GetCurrentWeapon() ~= nil and slot2:GetCurrentState() == slot2.STATE_READY then
		slot2:QuickTag()
		slot2:UpdateLockList()

		if #slot2:GetLockList() <= 0 then
			slot2:CancelQuickTag()
		else
			slot0:fireChargeWeapon(slot2, slot1)
		end
	end
end

function slot7.fireChargeWeapon(slot0, slot1, slot2, slot3)
	slot4 = slot1:GetHost()

	function slot5()
		slot0:DispatchBlink(function ()
			slot0:Fire(slot0)
		end)
	end

	if slot2 then
		if slot0._IFF == slot0.FRIENDLY_CODE then
			slot0._chargeWeaponVO:PlayCutIn(slot4, 1 / slot0.FOCUS_MAP_RATE)
		end

		slot0._chargeWeaponVO:PlayFocus(slot4, slot5)
	else
		if slot0._IFF == slot0.FRIENDLY_CODE then
			slot0._chargeWeaponVO:PlayCutIn(slot4, 1)
		end

		slot5()
	end
end

function slot7.switchCalibrationHost(slot0, slot1)
	return
end

function slot7.UnleashAllInStrike(slot0)
	if slot0._blockCast then
		return
	end

	if slot0._airAssistVO:GetCurrentWeapon() and slot1:GetCurrentState() == slot1.STATE_READY then
		slot2 = slot1:GetHost()

		if slot0._IFF == slot0.FRIENDLY_CODE then
			slot0._airAssistVO:PlayCutIn(slot2, 1)
		end

		slot1:CLSBullet()
		slot1:DispatchBlink()
		slot1:Fire()
	end
end

function slot7.CastTorpedo(slot0)
	if slot0._blockCast then
		return
	end

	if slot0._torpedoWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_READY then
		slot1:Prepar()
	end
end

function slot7.CancelTorpedo(slot0)
	if slot0._torpedoWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_PRECAST then
		slot1:Cancel()
	end
end

function slot7.UnleashTorpedo(slot0)
	if slot0._blockCast then
		slot0:CancelTorpedo()

		return
	end

	if slot0._torpedoWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_PRECAST then
		slot1:Fire()
	end
end

function slot7.QuickCastTorpedo(slot0)
	if slot0._blockCast then
		return
	end

	if slot0._torpedoWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_READY then
		slot1:Fire()
	end
end

function slot7.CoupleEncourage(slot0)
	slot1 = {}
	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot5 = {}
	slot6 = {}
	slot7 = {}

	for slot11, slot12 in ipairs(slot0._unitList) do
		slot1[slot0.GetPlayerShipModelFromID(slot13).group_type] = true
		slot2[slot14.type] = (slot2[slot12:GetTemplate().type] or 0) + 1
		slot3[slot12:GetRarity()] = (slot3[slot12.GetRarity()] or 0) + 1
		slot4[slot14.nationality] = (slot4[slot14.nationality] or 0) + 1
		slot5[slot20] = (slot5[slot1.Battle.BattleDataFunction.GetPlayerShipSkinDataFromID(slot12:GetSkinID()).illustrator] or 0) + 1

		if #slot0.GetWords(slot12:GetSkinID(), "couple_encourage", slot12:GetDefaultSkinID()) > 0 then
			slot6[slot12] = slot22
		end
	end

	slot8 = slot2.CPChatType

	for slot12, slot13 in pairs(slot6) do
		for slot17, slot18 in ipairs(slot13) do
			slot19 = slot18[1]
			slot20 = slot18[2]
			slot21 = slot18[4] or slot8.GROUP_ID
			slot22 = 0

			if slot21 == slot8.GROUP_ID then
				for slot26, slot27 in ipairs(slot19) do
					if slot1[slot27] then
						slot22 = slot22 + 1
					end
				end
			elseif slot21 == slot8.SHIP_TYPE then
				slot22 = slot2[slot19[1]]
			elseif slot21 == slot8.RARE then
				slot22 = slot3[slot19[1]]
			elseif slot21 == slot8.NATIONALITY then
				slot22 = slot4[slot19[1]]
			elseif slot21 == slot8.ILLUSTRATOR then
				slot22 = slot5[slot19[1]]
			end

			if slot22 and slot20 <= slot22 then
				slot7[#slot7 + 1] = {
					cp = slot12,
					content = slot18[3],
					linkIndex = slot17
				}
			end
		end
	end

	if #slot7 > 0 then
		slot7[math.random(#slot7)].cp:DispatchVoice(slot11)
		slot7[math.random(#slot7)].cp:DispatchChat(HXSet.hxLan(slot7[math.random(#slot7)].content), 3, "link" .. slot7[math.random(#slot7)].linkIndex)
	end
end

function slot7.onUnitUpdateHP(slot0, slot1)
	slot2 = slot1.Dispatcher
	slot3 = slot1.Data.dHP

	for slot7, slot8 in ipairs(slot0._unitList) do
		slot8:TriggerBuff(slot0.BuffEffectType.ON_FRIENDLY_HP_RATIO_UPDATE, {
			unit = slot2,
			dHP = slot3
		})

		if slot8 ~= slot2 then
			slot8:TriggerBuff(slot0.BuffEffectType.ON_TEAMMATE_HP_RATIO_UPDATE, {
				unit = slot2,
				dHP = slot3
			})
		end
	end
end

function slot7.SetSubUnitData(slot0, slot1)
	slot0._subUntiDataList = slot1
end

function slot7.GetSubUnitData(slot0)
	return slot0._subUntiDataList
end

function slot7.AddSubMarine(slot0, slot1)
	slot1:InitOxygen()
	slot0.Battle.BattleUnitPhaseSwitcher.New(slot1).SetTemplateData(slot3, slot1.GeneratePlayerSubmarinPhase(slot0._subAttackBaseLine, slot0._subRetreatBaseLine, slot1:GetAttrByName("raidDist"), function ()
		return slot0:GetRaidDuration()
	end, slot1:GetAttrByName("oxyAtkDuration")))

	slot0._unitList[#slot0._unitList + 1] = slot1
	slot0._subList[#slot0._subList + 1] = slot1

	slot1:SetFleetVO(slot0)
	slot1:RegisterEventListener(slot0, slot2.UPDATE_HP, slot0.onUnitUpdateHP)
end

function slot7.GetSubList(slot0)
	return slot0._subList
end

function slot7.AppendIndieSonar(slot0, slot1, slot2)
	slot3 = slot0.Battle.BattleIndieSonar.New(slot0, slot1, slot2)

	slot3:SwitchHost(slot0._motionReferenceUnit)

	slot0._indieSonarList[slot3] = true

	slot3:Detect()
end

function slot7.RemoveIndieSonar(slot0, slot1)
	for slot5, slot6 in pairs(slot0._indieSonarList) do
		if slot1 == slot5 then
			slot0._indieSonarList[slot5] = nil

			break
		end
	end
end

return