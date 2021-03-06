ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleSkillUnit = class("BattleSkillUnit")
ys.Battle.BattleSkillUnit.__name = "BattleSkillUnit"

function ys.Battle.BattleSkillUnit.Ctor(slot0, slot1, slot2)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._id = slot1
	slot0._level = slot2
	slot0._tempData = slot0.Battle.BattleDataFunction.GetSkillTemplate(slot1, slot2)
	slot0._cd = slot0._tempData.cd
	slot0._effectList = {}
	slot0._lastEffectTarget = {}

	for slot6, slot7 in ipairs(slot0._tempData.effect_list) do
		slot0._effectList[slot6] = slot0.Battle[slot7.type].New(slot7, slot2)
	end

	slot0._dataProxy = slot0.Battle.BattleDataProxy:GetInstance()
end

function ys.Battle.BattleSkillUnit.GenerateSpell(slot0, slot1, slot2, slot3)
	slot0.Battle.BattleSkillUnit.New(slot0, slot1)._attachData = slot3

	return slot0.Battle.BattleSkillUnit.New(slot0, slot1)
end

function ys.Battle.BattleSkillUnit.GetSkillEffectList(slot0)
	return slot0._effectList
end

function ys.Battle.BattleSkillUnit.Cast(slot0, slot1, slot2)
	slot4 = slot0.Battle.BattleState:GetInstance().GetUIMediator(slot3)

	if slot0._tempData.focus_duration then
		slot4:ShowSkillPainting(slot1, slot0._tempData)
	end

	if slot0._tempData.painting == 1 then
		if slot2 then
			slot4:ShowSkillFloat(slot1, slot2:getSkills()[1]:getConfig("name"), slot2:getPainting())
		else
			slot4:ShowSkillFloat(slot1, slot0._tempData.name)
		end
	end

	if slot0._tempData.castCV then
		slot1:DispatchVoice(slot0._tempData.castCV)
	end

	slot5 = slot0._attachData

	for slot9, slot10 in ipairs(slot0._effectList) do
		slot0._lastEffectTarget = slot10:GetTarget(slot1, slot0)

		slot10:SetCommander(slot2)
		slot10:Effect(slot1, slot10.GetTarget(slot1, slot0), slot5)
	end

	if slot0._tempData.aniEffect and slot6 ~= "" then
		slot1:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.ADD_EFFECT, {
			effect = slot6.effect,
			time = slot6.time,
			offset = slot6.offset,
			posFun = slot6.posFun
		}))
	end

	slot0._dataProxy:DispatchEvent(slot0.Event.New(slot0.Battle.BattleEvent.CAST_SKILL, {
		skillID = slot0._id,
		caster = slot1
	}))
end

function ys.Battle.BattleSkillUnit.SetTarget(slot0, slot1)
	slot0._lastEffectTarget = slot1
end

function ys.Battle.BattleSkillUnit.Clear(slot0)
	for slot4, slot5 in ipairs(slot0._effectList) do
		slot5:Clear()
	end
end

function ys.Battle.BattleSkillUnit.Dispose(slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

return
