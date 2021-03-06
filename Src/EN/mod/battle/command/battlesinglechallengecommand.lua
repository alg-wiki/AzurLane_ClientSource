ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = ys.Battle.BattleDataFunction
slot4 = class("BattleSingleChallengeCommand", ys.Battle.BattleSingleDungeonCommand)
ys.Battle.BattleSingleChallengeCommand = slot4
slot4.__name = "BattleSingleChallengeCommand"

function slot4.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot4.ConfigBattleData(slot0, slot1)
	slot0._challengeInfo = slot1.ChallengeInfo
end

function slot4.initWaveModule(slot0)
	slot0._waveUpdater = slot0.Battle.BattleWaveUpdater.New(function (slot0, slot1, slot2)
		slot0._dataProxy:SpawnMonster(slot0, slot1, slot2, slot1.Battle.BattleConfig.FOE_CODE)
	end, function (slot0)
		slot0._dataProxy:SpawnAirFighter(slot0)
	end, function ()
		if slot0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = slot0._vertifyFail
			})

			return
		end

		slot0._dataProxy:CalcChallengeScore(true)
		slot0._dataProxy.CalcChallengeScore._state:BattleEnd()
	end, function (slot0, slot1, slot2, slot3, slot4)
		slot0._dataProxy:SpawnCubeArea(slot1.Battle.BattleConst.AOEField.SURFACE, -1, slot0, slot1, slot2, slot3, slot4)
	end)
end

function slot4.DoPrologue(slot0)
	pg.UIMgr:GetInstance():Marching()
	slot0._uiMediator:SeaSurfaceShift(45, 0, nil, function ()
		slot0._uiMediator:OpeningEffect(function ()
			slot0 = getProxy(PlayerProxy)

			slot0._uiMediator:ShowAutoBtn()
			slot0._state:ChangeState(slot1.Battle.BattleState.BATTLE_STATE_FIGHT)
			slot0._waveUpdater:Start()
		end)

		slot0 = slot0._uiMediator.OpeningEffect._dataProxy:GetFleetByIFF(slot1.Battle.BattleConfig.FRIENDLY_CODE)

		slot0:FleetWarcry()
		slot0._dataProxy:TirggerBattleStartBuffs()
		slot0._dataProxy:InitAllFleetUnitsWeaponCD()

		for slot5, slot6 in ipairs(slot1) do
			slot6:AddBuff(slot1.Battle.BattleBuffUnit.New(slot1.Battle.BattleConfig.CHALLENGE_INVINCIBLE_BUFF))
		end

		slot0._challengeStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	end)
end

function slot4.onPlayerShutDown(slot0, slot1)
	if slot0._state:GetState() ~= slot0._state.BATTLE_STATE_FIGHT then
		return
	end

	if #slot0._userFleet:GetScoutList() == 0 then
		slot0._dataProxy:CalcChallengeScore(false)
		slot0._state:BattleEnd()
	end
end

function slot4.onUpdateCountDown(slot0, slot1)
	return
end

function slot4.onInitBattle(slot0)
	slot0.super.onInitBattle(slot0)
	slot0._dataProxy:SetDungeonLevel(slot1)
	slot0._dataProxy:SetRepressReduce(slot1.Battle.BattleDataFunction.GetRateTemplate(slot0._challengeInfo:getDamageRateID()).content)
end

return
