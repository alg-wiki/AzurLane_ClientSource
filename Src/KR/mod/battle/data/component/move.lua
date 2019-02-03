ys = ys or {}
slot0 = ys.Battle.BattleVariable
slot1 = class("MoveComponent")
ys.Battle.MoveComponent = slot1
slot2 = ys.Battle.BattleConst
slot3 = ys.Battle.BattleFormulas
slot1._pos = Vector3.zero
slot1._isForceMove = false
slot1._staticState = false
slot1._speed = Vector3.zero
slot1._corpsLimitSpeed = 0
slot1._leftCorpsBound = 0
slot1._rightCorpsBound = 0
slot1._immuneAreaLimit = false
slot1._immuneMaxAreaLimit = false
slot1._leftBorder = 0
slot1._rightBorder = 0
slot1._upBorder = 0
slot1._downBorder = 0
slot1._IFF = 0

function slot1.Ctor(slot0)
	return
end

function slot1.GetPos(slot0)
	return slot0._pos
end

function slot1.SetPos(slot0, slot1)
	slot0._pos = slot1
end

function slot1.Update(slot0)
	slot0._speed = slot0:GetFinalSpeed()
end

function slot1.FixSpeed(slot0, slot1)
	slot1:FixSpeed(slot0._speed)
end

function slot1.Move(slot0, slot1)
	slot0._pos.x = slot0._pos.x + slot0._speed.x * (slot1 or 1)
	slot0._pos.y = slot0._pos.y + slot0._speed.y * (slot1 or 1)
	slot0._pos.z = slot0._pos.z + slot0._speed.z * (slot1 or 1)
end

function slot1.GetSpeed(slot0)
	return slot0._speed
end

function slot1.SetCorpsArea(slot0, slot1, slot2)
	slot0._leftCorpsBound = slot1
	slot0._rightCorpsBound = slot2
end

function slot1.SetBorder(slot0, slot1, slot2, slot3, slot4)
	slot0._leftBorder = slot1
	slot0._rightBorder = slot2
	slot0._upBorder = slot3
	slot0._downBorder = slot4
end

function slot1.GetFinalSpeed(slot0)
	return slot0:BorderLimit(slot0:getInitialSpeed())
end

function slot1.CorpsAreaLimit(slot0, slot1)
	if slot0._immuneAreaLimit then
		return slot1
	end

	slot3 = slot0._corpsLimitSpeed

	if slot0._pos.x < slot0._leftCorpsBound then
		slot3 = math.max(slot3, 0.1)

		if slot1.x < 0 then
			slot3 = math.min(10, slot3 * 1.04)
		end
	elseif slot0._rightCorpsBound < slot2 then
		slot3 = math.min(slot3, -0.1)

		if slot1.x > 0 then
			slot3 = math.max(-10, slot3 * 1.04)
		end
	else
		slot0._corpsLimitSpeed = (slot3 < 0.1 and slot3 > -0.1 and 0) or slot3 * 0.8
		slot1.x = slot1.x + slot0._corpsLimitSpeed

		return slot1
	end
end

function slot1.BorderLimit(slot0, slot1)
	if slot0._immuneMaxAreaLimit then
		return slot1
	end

	slot2 = slot0._pos

	if (slot1.x < 0 and slot2.x <= slot0._leftBorder) or (slot1.x > 0 and slot0._rightBorder <= slot2.x) then
		slot1.x = 0
	end

	if (slot1.z < 0 and slot2.z <= slot0._downBorder) or (slot1.z > 0 and slot0._upBorder <= slot2.z) then
		slot1.z = 0
	end

	return slot1
end

function slot1.ImmuneAreaLimit(slot0, slot1)
	slot0._immuneAreaLimit = slot1
end

function slot1.ImmuneMaxAreaLimit(slot0, slot1)
	slot0._immuneMaxAreaLimit = slot1
end

function slot1.getInitialSpeed(slot0)
	if slot0._isForceMove then
		slot0:UpdateForceMove()

		return slot0._forceSpeed
	end

	if slot0._moveProcess then
		return slot0._moveProcess()
	end

	if slot0._staticState then
		return Vector3.zero
	end

	if slot0._manuallyMove then
		return slot0:CorpsAreaLimit(slot0._manuallyMove())
	end

	return slot0._autoMoveAi()
end

function slot1.SetForceMove(slot0, slot1, slot2, slot3, slot4)
	slot0._isForceMove = true
	slot0._forceSpeed = slot1.normalized * slot2
	slot0._forceReduce = slot1.normalized * slot3
	slot0._forceLastTime = slot4
end

function slot1.UpdateForceMove(slot0)
	if slot0._forceLastTime <= 0 then
		slot0:ClearForceMove()

		return
	end

	slot0._forceLastTime = slot1 - 1

	slot0._forceSpeed:Sub(slot0._forceReduce)
end

function slot1.ClearForceMove(slot0)
	slot0._isForceMove = false
	slot0._forceSpeed = nil
	slot0._forceReduce = nil
	slot0._forceLastTime = nil
end

function slot1.SetMoveProcess(slot0, slot1)
	slot0._moveProcess = slot1
end

function slot1.SetStaticState(slot0, slot1)
	slot0._staticState = slot1
end

function slot1.SetAutoMoveAI(slot0, slot1, slot2)
	function slot0._autoMoveAi()
		return slot0:GetDirection() * slot0:GetAttrByName("velocity")
	end
end

function slot1.SetFormationCtrlInfo(slot0, slot1)
	function slot0._manuallyMove()
		return slot0:UpdateFleetInfo(slot0)
	end
end

function slot1.CancelFormationCtrl(slot0)
	slot0._manuallyMove = nil
end

function slot1.SetMotionVO(slot0, slot1)
	slot0._fleetMotionVO = slot1
end

function slot1.UpdateFleetInfo(slot0, slot1)
	slot3 = slot0._fleetMotionVO.GetPos(slot2)
	slot4 = slot0._fleetMotionVO.GetSpeed(slot2)

	if slot1 == Vector3.zero then
		return slot4
	end

	return slot2:GetDirAngle() * slot1.Add(slot5, slot3):Sub(slot0._pos):Div(25):Add(slot4)
end

return