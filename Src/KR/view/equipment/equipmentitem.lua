slot0 = class("EquipmentItem")
slot1 = 0.5

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.bg = findTF(slot1, "bg")
	slot0.mask = findTF(slot1, "bg/mask")
	slot0.newTF = findTF(slot1, "bg/icon_bg/new")
	slot0.countTF = findTF(slot1, "bg/icon_bg/count"):GetComponent(typeof(Text))
	slot0.nameTF = findTF(slot1, "bg/name"):GetComponent(typeof(Text))
	slot0.bgTF = findTF(slot1, "bg/icon_bg"):GetComponent(typeof(Image))
	slot0.frameTF = findTF(slot1, "bg/icon_bg/frame"):GetComponent(typeof(Image))
	slot0.iconTF = findTF(slot1, "bg/icon_bg/icon"):GetComponent(typeof(Image))
	slot0.starsTF = findTF(slot1, "bg/icon_bg/stars")
	slot0.starTpl = findTF(slot1, "bg/icon_bg/startpl")
	slot0.slvTF = findTF(slot1, "bg/icon_bg/slv")
	slot0.slvTextTF = findTF(slot0.slvTF, "Text"):GetComponent(typeof(Text))
	slot0.unloadBtn = findTF(slot1, "unload")
	slot0.reduceBtn = findTF(slot1, "selected/reduce")
	slot0.selectCount = findTF(slot1, "selected/count/Text")
	slot0.tr = slot1.transform
	slot0.selectedGo = findTF(slot0.tr, "selected").gameObject

	slot0.selectedGo:SetActive(false)

	slot0.equiped = findTF(slot0.tr, "equip_flag")

	setActive(slot0.equiped, false)
end

function slot0.update(slot0, slot1)
	setActive(slot0.equiped, false)
	setActive(slot0.unloadBtn, not slot1)
	setActive(slot0.bg, slot1)

	if not slot1 then
		return
	end

	slot0.equipmentVO = slot1

	if slot1.isSkin then
		slot0:updateSkin()
	else
		slot0:updateEquipment()

		if not IsNil(slot0.mask) then
			setActive(slot0.mask, slot1.mask)
		end
	end
end

function slot0.updateSkin(slot0)
	slot0.bgTF.sprite = nil
	slot0.frameTF.sprite = nil
	slot0.iconTF.sprite = nil

	setActive(slot0.equiped, slot0.equipmentVO.shipId)
	updateDrop(slot0.bg, {
		id = slot0.equipmentVO.id,
		type = DROP_TYPE_EQUIPMENT_SKIN,
		count = slot0.equipmentVO.count
	})
end

function slot0.updateEquipment(slot0)
	slot0.bgTF.sprite = GetSpriteFromAtlas("weaponframes", "bg" .. slot2)
	slot0.frameTF.sprite = GetSpriteFromAtlas("weaponframes", "frame" .. slot2)
	slot0.iconTF.sprite = GetSpriteFromAtlas("equips/" .. slot0.equipmentVO.config.icon, "")

	for slot7 = slot0.starsTF.childCount, slot0.equipmentVO.config.rarity - 1, 1 do
		cloneTplTo(slot0.starTpl, slot0.starsTF)
	end

	for slot7 = 1, slot0.starsTF.childCount, 1 do
		setActive(slot0.starsTF:GetChild(slot7 - 1), slot7 <= slot3)
	end

	setActive(slot0.slvTF, slot1.config.level - 1 > 0)

	slot0.slvTextTF.text = slot4
	slot0.countTF.text = (slot1.count > 0 and slot1.count) or ""

	setActive(slot0.newTF, slot1.new ~= 0 or slot1.isSkin)

	slot0.nameTF.text = shortenString(slot1.config.name, 5)

	setActive(slot0.equiped, slot1.shipId)

	slot6 = findTF(slot0.go, "bg/icon_bg/IconColorful(Clone)")

	if slot1.config.rarity == 6 then
		if not slot6 then
			PoolMgr.GetInstance():GetUI("IconColorful", true, function (slot0)
				setParent(slot0, findTF(slot0.go, "bg/icon_bg"))
				setActive(slot0, true)
			end)
		else
			setActive(slot6, true)
		end
	elseif slot6 then
		setActive(slot6, false)
	end
end

function slot0.dispose(slot0)
	return
end

function slot0.updateSelected(slot0, slot1, slot2)
	setText(slot0.selectCount, slot2)

	slot0.selected = slot1

	slot0.selectedGo:SetActive(slot0.selected)

	if slot0.selected then
		if not slot0.selectedTwId then
			slot0.selectedTwId = LeanTween.alpha(slot0.selectedGo.transform, 1, slot0):setFrom(0):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId
		end
	elseif slot0.selectedTwId then
		LeanTween.cancel(slot0.selectedTwId)

		slot0.selectedTwId = nil
	end
end

return slot0
