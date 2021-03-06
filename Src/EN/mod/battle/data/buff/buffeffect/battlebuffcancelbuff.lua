ys = ys or {}
slot1 = class("BattleBuffCancelBuff", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffCancelBuff = slot1
slot1.__name = "BattleBuffCancelBuff"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._buff_id = slot0._tempData.arg_list.buff_id
	slot0._count = slot0._tempData.arg_list.count or 99999
	slot0._delay = slot0._tempData.arg_list.delay
	slot0._hpRatioList = slot0._tempData.arg_list.hpRatioList or {}
end

function slot1.onTrigger(slot0, slot1, slot2, slot3)
	slot0.super.onTrigger(slot0, slot1, slot2, attach)

	slot0._count = slot0._count - 1

	if slot0._count <= 0 then
		slot2:SetToCancel(slot0._delay)
	end
end

return
