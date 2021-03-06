slot0 = class("CollectionShipCard")
slot0.TypeCard = 1
slot0.TypeTrans = 2
slot1 = pg.ship_data_group

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tr = slot1.transform
	slot0.btn = slot1:GetComponent("Button")
	slot0.content = findTF(slot0.tr, "content").gameObject
	slot0.imageBg = findTF(slot0.tr, "content/bg"):GetComponent("Image")
	slot0.imageFrame = findTF(slot0.tr, "content/frame"):GetComponent("Image")
	slot0.iconType = findTF(slot0.tr, "content/frame/info/type"):GetComponent("Image")
	slot0.labelName = ScrollTxt.New(findTF(slot0.tr, "content/frame/info/name_mask"), findTF(slot0.tr, "content/frame/info/name_mask/name"))
	slot0.iconShip = findTF(slot0.tr, "content/ship_icon"):GetComponent("Image")
	slot0.stars = findTF(slot0.tr, "content/frame/info/stars")
	slot0.star = findTF(slot0.tr, "content/frame/info/stars/star_tpl")
	slot0.heart = findTF(slot0.tr, "content/frame/heart")
	slot0.labelHeart = findTF(slot0.tr, "content/frame/heart/heart"):GetComponent("Text")
	slot0.labelHeartIcon = findTF(slot0.tr, "content/frame/heart/icon"):GetComponent("Image")
	slot0.labelHeartPlus = findTF(slot0.tr, "content/frame/heart/heart+"):GetComponent("Text")
	slot0.imageUnknown = findTF(slot0.tr, "unknown"):GetComponent("Image")
	slot0.labelNumber = findTF(slot0.tr, "number/Text"):GetComponent("Text")
	slot0.ringTF = findTF(slot0.tr, "ring")
	slot0.maskTF = findTF(slot0.tr, "mask")
end

function slot0.update(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = ShipGroup.getState(slot5, slot2, slot3)

	if slot0.code ~= slot1 or slot0.shipGroup ~= slot2 or slot0.showTrans ~= slot3 or slot0.propose ~= slot4 or slot0.state ~= slot6 then
		slot0.code = slot1
		slot0.shipGroup = slot2
		slot0.showTrans = slot3
		slot0.propose = slot4
		slot0.state = slot6
		slot0.config = slot0[slot5]

		slot0:flush()
	end
end

function slot0.flush(slot0)
	slot1 = slot0.shipGroup

	setActive(slot0.heart, slot0.state == ShipGroup.STATE_UNLOCK)

	if slot0.state == ShipGroup.STATE_UNLOCK then
		slot0.labelHeart.text = (slot1.hearts > 999 and "999") or tostring(slot1.hearts)

		setActive(slot0.labelHeartPlus, slot1.hearts > 999)

		slot0.labelHeart.color = (slot1.iheart and Color.New(1, 0.6, 0.6)) or Color.New(1, 1, 1)
		slot0.labelHeartIcon.color = (slot1.iheart and Color.New(1, 0.6, 0.6)) or Color.New(1, 1, 1)
		slot0.labelHeartPlus.color = (slot1.iheart and Color.New(1, 0.6, 0.6)) or Color.New(1, 1, 1)

		slot0:loadImage(slot0.shipGroup)
	elseif slot0.state == ShipGroup.STATE_NOTGET then
		slot0.shipGroup = ShipGroup.New({
			id = slot0.config.group_type
		})

		slot0:loadImage(slot0.shipGroup)
	elseif slot0.state == ShipGroup.STATE_LOCK then
		GetSpriteFromAtlasAsync("shipframe", "unknown", function (slot0)
			if not IsNil(slot0.imageUnknown) then
				slot0.imageUnknown.sprite = slot0
			end
		end)
	end

	setActive(slot0.content, slot0.state == ShipGroup.STATE_NOTGET or slot0.state == ShipGroup.STATE_UNLOCK)
	setActive(slot0.imageUnknown, slot0.state == ShipGroup.STATE_LOCK)
	setActive(slot0.maskTF, slot0.state == ShipGroup.STATE_NOTGET)

	slot0.labelNumber.text = string.format("%03u", slot0.code)

	setActive(slot0.ringTF, slot0.propose)
end

function slot0.loadImage(slot0, slot1)
	slot0.iconType.sprite = GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType(slot0.showTrans)))

	slot0.labelName:setText(slot1:getName(slot0.showTrans))

	slot3 = slot1:getPainting(slot0.showTrans)

	GetSpriteFromAtlasAsync("shipframe", ((slot1:isBluePrintGroup() and "1") or "") .. shipRarity2bgPrint(slot2), function (slot0)
		if not IsNil(slot0.imageFrame) then
			slot0.imageFrame.sprite = slot0
		end
	end)

	slot0.imageBg.sprite = GetSpriteFromAtlas("bg/star_level_card_" .. ((slot1:isBluePrintGroup() and "1") or "") .. shipRarity2bgPrint(slot2), "")
	slot0.iconShip.sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")

	if slot0.bufferTimer then
		slot0.bufferTimer:Stop()
	end

	slot0.bufferTimer = Timer.New(function ()
		LoadSpriteAsync("shipYardIcon/" .. slot0, function (slot0)
			if slot0.go then
				slot0.iconShip.sprite = slot0

				slot0.iconShip:SetNativeSize()
			end
		end)
	end, 0.1, 1)

	slot0.bufferTimer:Start()
end

function slot0.clear(slot0)
	if slot0.bufferTimer then
		slot0.bufferTimer:Stop()

		slot0.bufferTimer = nil
	end

	slot0.labelName:clear()

	slot0.shipGroup = nil
	slot0.showTrans = nil
	slot0.propose = nil
	slot0.code = nil
end

return slot0
