slot0 = class("ShipDetailPanel")
slot1 = {
	durability = AttributeType.Durability,
	armor = AttributeType.Armor,
	cannon = AttributeType.Cannon,
	torpedo = AttributeType.Torpedo,
	antiaircraft = AttributeType.AntiAircraft,
	air = AttributeType.Air,
	reload = AttributeType.Reload,
	luck = AttributeType.Expend,
	motion = AttributeType.Dodge,
	antisub = AttributeType.AntiSub,
	oxy_max = AttributeType.OxyMax,
	ammo = AttributeType.Ammo,
	hunting_range = AttributeType.HuntingRange
}
slot2 = 0.5
slot3 = Vector3(1, 1, 1)
slot4 = Vector3(1.3, 1.3, 1.3)

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0.tf = slot1
	slot0.go = go(slot1)
	slot0.viewComponent = slot2
	slot0.powerTxt = findTF(slot0.tf, "power/value")
	slot0.skillContainer = findTF(slot0.tf, "skill_list/viewport/content")
	slot0.skillContainerHz = slot0.skillContainer:GetComponent(typeof(HorizontalLayoutGroup))
	slot0.skillTpl = findTF(slot0.tf, "skill_tpl")
	slot0.levelTxt = findTF(slot0.tf, "level_bg/level_label/Text")
	slot0.levelSlider = findTF(slot0.tf, "level_bg/exp")
	slot0.expInfo = findTF(slot0.tf, "level_bg/exp_info")
	slot0.outline = findTF(slot0.tf, "level_bg/outline")
	slot0.levelTip = findTF(slot0.tf, "level_bg/tip")
	slot0.levelBg = findTF(slot0.tf, "level_bg")
	slot0.armorNameTxt = slot0.tf:Find("icons"):GetChild(1):Find("name")
end

function slot0.enableEvent(slot0, slot1)
	slot0.viewComponent.mainCanvasGroup.blocksRaycasts = slot1
	slot0.viewComponent.commonCanvasGroup.blocksRaycasts = slot1
end

function slot0.flush(slot0, slot1)
	slot0.shipDataTemplate = pg.ship_data_template[slot1.configId]
	slot0.shipVO = slot1

	slot0:updateShipAttrs()
	slot0:updateSKills()
	slot0:updateLevelInfo()
end

function slot0.updateShipAttrs(slot0)
	slot2 = table.contains(TeamType.SubShipType, slot0.shipVO.getShipType(slot1))
	slot3 = intProperties(slot0.shipVO.getShipProperties(slot1))
	slot7, slot7 = slot0.shipVO.getEquipmentProperties(slot1)
	slot4 = intProperties(slot4)
	slot5 = intProperties(slot5)

	setText(slot0.powerTxt, tostring(slot6))

	for slot10, slot11 in pairs(slot0) do
		slot13 = findTF(slot0.tf, "icons/" .. slot10)

		setText(findTF(slot12, "value"), slot3[slot11] or 0)
		setText(findTF(slot12, "add"), "+" .. math.floor(((slot4[slot11] or 0) + (slot3[slot11] or 0)) * (slot5[slot11] or 1)) - (slot3[slot11] or 0))
		setActive(findTF(slot12, "add"), math.floor((setActive + (slot3[slot11] or 0)) * (slot5[slot11] or 1)) - (slot3[slot11] or 0) ~= 0)

		if slot11 == AttributeType.Armor then
			setActive(slot14, false)
			setActive(slot15, false)
			setText(slot0.armorNameTxt, slot1:getShipArmorName())
		elseif slot11 == AttributeType.Expend then
			setText(findTF(slot12, "value"), slot1:getBattleTotalExpend())
			setActive(slot15, false)
		elseif slot11 == AttributeType.HuntingRange then
			setActive(slot13, slot2)
			setActive(slot12, slot2)

			if slot2 then
				setActive(slot14, false)
				setActive(slot15, false)
			end
		elseif slot11 == AttributeType.AntiSub then
			setActive(slot13, not slot2)
			setActive(slot12, not slot2)
		elseif slot11 == AttributeType.OxyMax or slot11 == AttributeType.Ammo then
			setActive(slot13, slot2)
			setActive(slot12, slot2)

			if slot11 == AttributeType.Ammo then
				setText(slot14, slot1:getShipAmmo())
			end
		end
	end
end

function slot0.updateSKills(slot0)
	slot1 = slot0.shipVO

	for slot6 = #Clone(slot0.shipDataTemplate.buff_list_display) + 1, 3, 1 do
		table.insert(slot2, false)
	end

	slot0.skillContainerHz.spacing = (#slot2 > 3 and -11) or -6

	setActive(slot0.skillTpl, false)

	slot3 = UIItemList.New(slot0.skillContainer, slot0.skillTpl)

	slot3:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			if slot0[slot1 + 1] then
				slot4 = getSkillConfig(slot3)

				if slot1.skills[slot3] and slot5.id == 11720 and not slot1.transforms[3612] then
					slot5 = nil
				end

				updateSkill(slot2, slot4, slot5)
				onButton(slot2, slot2, function ()
					slot0.viewComponent:emit(ShipInfoMediator.ON_SKILL, slot1.id, , slot3 + 1)
				end, SFX_PANEL)

				return
			end

			updateSkill(slot2)
			RemoveComponent(slot2, "Button")
		end
	end)
	slot3:align(#slot2)
end

function slot0.updateLevelInfo(slot0)
	setText(slot0.levelTxt, slot0.shipVO.level)

	slot2 = slot0.shipVO.getLevelExpConfig(slot1)

	if slot0.shipVO.level ~= slot0.shipVO:getMaxLevel() then
		setSlider(slot0.levelSlider, 0, slot2.exp_interval, slot1.exp)
		setText(slot0.expInfo, slot1.exp .. "/" .. slot2.exp_interval)
	else
		setSlider(slot0.levelSlider, 0, 1, 1)
		setText(slot0.expInfo, slot1.exp .. "/Max")
	end

	slot0:updateMaxLevel(slot1)
end

function slot0.updateMaxLevel(slot0, slot1)
	if slot1:isReachNextMaxLevel() then
		SetActive(slot0.outline, true)
		setActive(slot0.levelTip, true)
		blinkAni(slot0.outline, 1.5, -1, 0.1):setFrom(1)
		blinkAni(slot0.levelTip, 1.5, -1, 0.1):setFrom(1)

		slot3 = slot1:getNextMaxLevelConsume()
		slot4 = slot1:getMaxLevel()
		slot5 = slot1:getNextMaxLevel()

		onButton(slot0, slot0.levelBg, function ()
			if slot0:isActivityNpc() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("npc_upgrade_max_level"))

				return
			end

			slot1.viewComponent:showCustomMsgBox({
				content = i18n("upgrade_to_next_maxlevel_tip"),
				content1 = slot2 .. "->" .. slot2,
				items = slot4,
				onYes = function ()
					slot0, slot1 = slot0:canUpgradeMaxLevel()

					if slot0 then
						slot1.viewComponent:hideCustomMsgBox()
						slot1.viewComponent:emit(ShipInfoMediator.ON_UPGRADE_MAX_LEVEL, slot0.id)
					else
						pg.TipsMgr:GetInstance():ShowTips(slot1)
					end
				end
			})
		end, SFX_PANEL)

		return
	end

	slot0:removeLevelUpTip()
end

function slot0.removeLevelUpTip(slot0)
	SetActive(slot0.outline, false)
	setActive(slot0.levelTip, false)

	if LeanTween.isTweening(go(slot0.outline)) then
		LeanTween.cancel(go(slot0.outline))
	end

	if LeanTween.isTweening(go(slot0.levelTip)) then
		LeanTween.cancel(go(slot0.levelTip))
	end

	removeOnButton(slot0.levelBg)
end

function slot0.doLeveUpAnim(slot0, slot1, slot2, slot3)
	slot0:removeLevelUpTip()
	slot0:enableEvent(false)

	slot4 = {}

	if slot1.level < slot2.level then
		slot6 = slot1:getLevelExpConfig()

		for slot10 = 1, slot2.level - slot1.level, 1 do
			table.insert(slot4, function (slot0)
				TweenValue(slot0.levelSlider, 0, slot1.exp_interval, , 0, function (slot0)
					setSlider(slot0.levelSlider, 0, slot1.exp_interval, slot0)
					setText(slot0.expInfo, math.floor(slot0) .. "/" .. slot1.exp_interval)
				end, function ()
					slot0 = Clone(Clone)
					slot0.level = slot0.level + 1
					slot1 = slot0:getLevelExpConfig()

					slot0:scaleAnim(slot2.levelTxt, , , slot5 / 2, function ()
						if slot0.level == slot1.level then
							slot2:doAttrAnim(slot3, slot2, function ()
								TweenValue(slot0.levelSlider, 0, slot1.exp, , 0, function (slot0)
									setSlider(slot0.levelSlider, 0, slot1.exp_interval, slot0)
									setText(slot0.expInfo, math.floor(slot0) .. "/" .. slot1.exp_interval)
								end, )
							end)
						else
							slot2:doAttrAnim(slot3, slot2.doAttrAnim, slot6)
						end
					end, function ()
						setText(slot0.levelTxt, slot1.level)
					end)
				end)
			end)
		end
	else
		slot5 = slot2:getLevelExpConfig()

		if slot1.exp < slot2.exp then
			table.insert(slot4, function (slot0)
				TweenValue(slot0.levelSlider, slot1.exp, slot2.exp, , 0, function (slot0)
					setSlider(slot0.levelSlider, 0, slot1.exp_interval, slot0)
					setText(slot0.expInfo, math.floor(slot0) .. "/" .. slot1.exp_interval)
				end, slot0)
			end)
		end
	end

	seriesAsync(slot4, function ()
		if slot0 then
			slot0()
		end

		slot1:enableEvent(true)
	end)
end

function slot0.doAttrAnim(slot0, slot1, slot2, slot3)
	slot4 = intProperties(slot1:getShipProperties())
	slot11, slot11 = slot1:getEquipmentProperties()
	slot7 = intProperties(slot2:getShipProperties())
	slot11, slot11 = slot2:getEquipmentProperties()
	slot5 = intProperties(slot5)
	slot6 = intProperties(slot6)
	slot8 = intProperties(slot8)
	slot9 = intProperties(slot9)
	slot10 = {}

	if math.floor(slot1:getShipCombatPower()) ~= math.floor(slot2:getShipCombatPower()) then
		table.insert(slot10, function (slot0)
			TweenValue(slot0.powerTxt, TweenValue, , , 0, function (slot0)
				setText(slot0.powerTxt, math.floor(slot0))
			end, slot0)
		end)
	end

	for slot16, slot17 in pairs(slot1) do
		slot18 = findTF(slot0.tf, "icons/" .. slot16)
		slot20 = findTF(slot19, "value")
		slot21 = findTF(slot19, "add")
		slot24 = math.floor(((slot5[slot17] or 0) + (slot4[slot17] or 0)) * (slot6[slot17] or 1)) - (slot4[slot17] or 0)
		slot27 = math.floor(((slot8[slot17] or 0) + (slot7[slot17] or 0)) * (slot9[slot17] or 1)) - (slot7[slot17] or 0)

		if slot22 ~= slot25 then
			table.insert(slot10, function (slot0)
				TweenValue(slot0, TweenValue, , , 0, function (slot0)
					setText(slot0, math.floor(slot0))
				end, slot0)
				slot4:scaleAnim(slot0, TweenValue, 0, slot3 / 2)
			end)
		end

		if slot27 ~= 0 then
			table.insert(slot10, function (slot0)
				TweenValue(slot0, TweenValue, , , 0, function (slot0)
					setText(slot0, "+" .. math.floor(slot0))
				end, slot0)
				slot4:scaleAnim(slot0, TweenValue, 0, slot3 / 2)
			end)
		end

		setActive(slot21, slot27 ~= 0)

		if slot17 == AttributeType.Armor then
			setActive(slot20, false)
			setActive(slot21, false)
			setText(slot0.armorNameTxt, slot2:getShipArmorName())
		elseif slot17 == AttributeType.Expend then
			slot30 = findTF(slot19, "value")

			if slot1:getBattleTotalExpend() ~= slot2:getBattleTotalExpend() then
				table.insert(slot10, function (slot0)
					TweenValue(slot0, TweenValue, , , 0, function (slot0)
						setText(slot0, math.floor(slot0))
					end, slot0)
					slot4:scaleAnim(slot0, TweenValue, 0, slot3 / 2)
				end)
			end

			setActive(slot21, false)
		elseif slot17 == AttributeType.OxyMax or slot17 == AttributeType.Tactics then
			slot28 = table.contains(TeamType.SubShipType, slot2:getShipType())

			setActive(slot18, slot28)
			setActive(slot19, slot28)

			if slot28 and slot17 == AttributeType.Tactics then
				slot29, slot34 = slot2:getTactics()

				setActive(slot20, false)
				setActive(slot21, true)
				setText(slot21, i18n(slot30))
			end
		end
	end

	parallelAsync(slot10, function ()
		if slot0 then
			slot0()
		end
	end)
end

function slot0.scaleAnim(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	LeanTween.scale(go(slot1), slot3, slot4):setFrom(slot2):setOnComplete(System.Action(function ()
		if slot0 then
			slot0()
		end

		LeanTween.scale(go(go), go, slot3):setFrom(slot4):setOnComplete(System.Action(slot5))
	end))
end

function slot0.clear(slot0)
	pg.DelegateInfo.Dispose(slot0)

	if LeanTween.isTweening(go(slot0.levelSlider)) then
		LeanTween.cancel(go(slot0.levelSlider))
	end

	if LeanTween.isTweening(go(slot0.powerTxt)) then
		LeanTween.cancel(go(slot0.powerTxt))
	end

	if LeanTween.isTweening(go(slot0.expInfo)) then
		LeanTween.cancel(go(slot0.expInfo))
	end

	slot0:removeLevelUpTip()
end

return slot0
