ys = ys or {}
slot1 = ys.Battle.BattleConfig
ys.Battle.BattleSkillView = class("BattleSkillView")
ys.Battle.BattleSkillView.__name = "BattleSkillView"

function ys.Battle.BattleSkillView.Ctor(slot0, slot1)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._mediator = slot1
	slot0._ui = slot1._ui

	slot0:InitBtns()
	slot0:EnableWeaponButton(false)
end

function ys.Battle.BattleSkillView.EnableWeaponButton(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._skillBtnList) do
		slot6:Enabled(slot1)
	end
end

function ys.Battle.BattleSkillView.DisableWeapnButton(slot0)
	for slot4, slot5 in ipairs(slot0._skillBtnList) do
		slot5:Disable()
	end
end

function ys.Battle.BattleSkillView.InitBtns(slot0)
	slot0._skillBtnList = {}
	slot0.chargeFalg = true
	slot0.torFlag = true
	slot0._fleetVO = slot0._mediator._dataProxy:GetFleetByIFF(slot0.Battle.BattleConfig.FRIENDLY_CODE)
	slot5 = slot0.Battle.BattleWeaponButton.New()
	slot0._skillBtnList[1] = slot5

	slot5:ConfigCallback(slot2, slot3, slot4, slot1)
	slot0:setSkillButtonPreferences(slot6, 1)
	slot5:ConfigSkin(slot6)
	slot5:SetTextActive(true)
	slot5:SetProgressInfo(slot7)

	slot11 = slot0.Battle.BattleWeaponButton.New()
	slot0._skillBtnList[2] = slot11

	slot11:ConfigCallback(slot8, slot9, slot10, slot1)
	slot0:setSkillButtonPreferences(slot12, 2)
	slot11:ConfigSkin(slot12)
	slot11:SetTextActive(true)
	slot11:SetProgressInfo(slot13)

	slot17 = slot0.Battle.BattleWeaponButton.New()
	slot0._skillBtnList[3] = slot17

	slot17:ConfigCallback(slot16, slot14, slot15, slot1)
	slot0:setSkillButtonPreferences(slot18, 3)
	slot17:ConfigSkin(slot18)
	slot17:SetTextActive(true)
	slot17:SetProgressInfo(slot19)

	slot20 = slot0._ui:findTF("Skill_4")

	if not slot0._fleetVO._submarineVO:GetUseable() or slot21:GetCount() <= 0 then
		SetActive(slot20, false)
	else
		slot25 = slot0.Battle.BattleSubmarineButton.New()
		slot0._skillBtnList[4] = slot25

		slot25:ConfigCallback(slot24, slot22, slot23, slot1)
		slot0:setSkillButtonPreferences(slot20, 4)
		slot25:ConfigSkin(slot20)
		slot25:SetTextActive(true)
		slot25:SetProgressInfo(slot21)

		slot26 = slot20:GetComponent(typeof(Animator))

		slot20:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
			slot0.enabled = false
		end)
	end
end

function ys.Battle.BattleSkillView.OnSkillCd(slot0, slot1)
	slot2 = slot1.Data.skillID

	if slot1.Data.coolDownTime < pg.TimeMgr.GetInstance():GetCombatTime() then
		return
	end

	slot0._skillCd[slot2] = slot3
end

function ys.Battle.BattleSkillView.Dispose(slot0)
	for slot4, slot5 in ipairs(slot0._skillBtnList) do
		slot5:Dispose()
	end

	slot0._ui = nil

	if _main_cannon_sound then
		slot0._main_cannon_sound:Stop(true)

		slot0._main_cannon_sound = nil
	end

	slot0.EventListener.DetachEventListener(slot0)
end

function ys.Battle.BattleSkillView.Update(slot0)
	for slot4, slot5 in ipairs(slot0._skillBtnList) do
		slot5:Update()
	end
end

function ys.Battle.BattleSkillView.setSkillButtonPreferences(slot0, slot1, slot2)
	slot1.transform.localScale = Vector3(slot4, slot4, 0)
	slot1.transform.anchorMin = Vector2(slot5, slot6)
	slot1.transform.anchorMax = Vector2(PlayerPrefs.GetFloat("skill_" .. slot2 .. "_anchorX", slot0.SKILL_BUTTON_DEFAULT_PREFERENCE[slot2].x), PlayerPrefs.GetFloat("skill_" .. slot2 .. "_anchorY", slot0.SKILL_BUTTON_DEFAULT_PREFERENCE[slot2].y))
end

return
