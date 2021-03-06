ys = ys or {}
slot1 = class("ApproachState", ys.Battle.IPilotState)
ys.Battle.ApproachState = slot1
slot1.__name = "ApproachState"

function slot1.Ctor(slot0, slot1)
	slot0._stateName = slot0.Battle.IPilotState.STATE_APPROACH

	slot1.super.Ctor(slot0, slot1)
end

function slot1.WhenEnter(slot0)
	slot0.super.WhenEnter(slot0)
end

function slot1.CalculateDirection(slot0, slot1)
	slot2 = nil

	if ((slot0._referenceTarget == nil or slot0._referenceTarget:GetPosition()) and (slot0._referencePoint == nil or slot0._referencePoint) and slot1) - slot1.magnitude < 0.2 then
		slot3 = Vector3.zero
	else
		slot0:FixAxis(slot3)
	end

	return slot3.normalized
end

return
