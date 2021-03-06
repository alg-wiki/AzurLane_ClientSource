slot0 = class("ShipBreakResultLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "ShipBreakResultUI"
end

function slot0.init(slot0)
	slot0.frame = slot0:findTF("frame")
	slot0.attrPanel = slot0:findTF("frame/attr_panel")
	slot0.rarePanel = slot0:findTF("frame/rare_panel")
	slot0.paintContain = slot0:findTF("paint")
	slot0.qCharaContain = slot0:findTF("frame/q_chara")
	slot0._chat = slot0:findTF("chat", slot0.paintContain)
	slot0.OverlayUIMain = pg.UIMgr:GetInstance().OverlayMain
	slot0.UIMain = pg.UIMgr:GetInstance().UIMain

	setParent(slot0._tf, slot0.OverlayUIMain)
end

function slot0.didEnter(slot0)
	slot0.inAnimating = true

	onButton(slot0, slot0._tf, function ()
		if slot0.inAnimating then
			slot0:skipAnimation()
		else
			slot0:emit(slot1.ON_CLOSE)
		end
	end, SFX_CANCEL)
	slot0:uiStartAnimation()
end

slot1 = {
	"durability",
	"cannon",
	"torpedo",
	"antiaircraft",
	"air"
}

function slot0.updateStatistics(slot0)
	slot3 = intProperties(slot0.contextData.newShip.getShipProperties(slot1))
	slot4 = intProperties(slot0.contextData.oldShip.getShipProperties(slot2))
	slot5 = slot0.attrPanel:Find("content")

	for slot9, slot10 in ipairs(slot0) do
		slot11 = slot5:GetChild(slot9 - 1)

		setText(slot11:Find("pre_value"), slot4[slot10])
		setText(slot11:Find("value"), slot3[slot10])

		slot12 = slot11:Find("addtion")

		if slot3[slot10] - slot4[slot10] == 0 then
			setActive(slot12, false)
		else
			setText(slot12, "+" .. slot13)
		end
	end

	slot6 = slot5:GetChild(5)

	setText(slot6:Find("pre_value"), slot7)
	setText(slot6:Find("value"), slot8)

	slot9 = slot6:Find("addtion")

	if math.abs(slot1:getBattleTotalExpend() - slot2:getBattleTotalExpend()) == 0 then
		setActive(slot9, false)
	else
		setText(slot9, "+" .. slot10)
	end

	slot11 = slot1:getStar()
	slot13 = slot0.rarePanel:Find("pre_stars")
	slot14 = slot0.rarePanel:Find("stars")

	for slot18 = 1, slot2:getStar(), 1 do
		setActive(slot13:GetChild(slot18 - 1), true)
	end

	for slot18 = 1, slot11, 1 do
		setActive(slot14:GetChild(slot18 - 1), true)
	end

	setPaintingPrefabAsync(slot0.paintContain, slot1:getPainting(), "chuanwu")
	pg.UIMgr:GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetSpineChar(slot15, true, function (slot0)
		pg.UIMgr:GetInstance():LoadingOff()

		slot0.shipPrefab = slot0
		slot0.shipModel = slot0
		tf(slot0).localScale = Vector3(1, 1, 1)

		slot0:GetComponent("SpineAnimUI"):SetAction("stand", 0)
		setParent(slot0, slot0.qCharaContain)
	end)
	GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot1:rarity2bgPrintForGet(), "", function (slot0)
		setImageSprite(slot0._tf, slot0, false)
	end)

	slot20, slot17 = Ship.getWords(slot1.skinId, "upgrade")

	setWidgetText(slot0._chat, slot16)

	slot18.alignment = (CHAT_POP_STR_LEN < #slot0:findTF("Text", slot0._chat):GetComponent(typeof(Text)).text and TextAnchor.MiddleLeft) or TextAnchor.MiddleCenter
	slot0._chat.transform.localScale = Vector3(0, 0, 1)

	LeanTween.delayedCall(0.6, System.Action(function ()
		SetActive(slot0._chat, true)
		LeanTween.scale(rtf(slot0._chat), Vector3.New(1, 1, 1), 0.3):setEase(LeanTweenType.easeOutBack)
		LeanTween.scale(rtf(slot0._chat), Vector3.New(1, 1, 1), 0.3).setEase:voice(LeanTween.scale(rtf(slot0._chat), Vector3.New(1, 1, 1), 0.3).setEase)
	end))
end

function slot0.voice(slot0, slot1)
	if not slot1 then
		return
	end

	function slot2()
		if slot0._currentVoice then
			slot0._currentVoice:Stop(true)
		end

		slot0._currentVoice = playSoundEffect(playSoundEffect)
	end

	if slot0.loadedCVBankName then
		slot2()
	else
		pg.CriMgr:LoadCV(Ship.getCVKeyID(slot0.contextData.newShip.skinId), function ()
			slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

			if pg.CriMgr.GetCVBankName.exited then
				pg.CriMgr.UnloadCVBank(slot0)
			else
				slot1.loadedCVBankName = slot0

				slot2()
			end

			slot1.loadedCVBankName = slot0

			slot2()
		end)
	end
end

function slot0.recycleSpineChar(slot0)
	if slot0.shipPrefab and slot0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.shipPrefab, slot0.shipModel)

		slot0.shipPrefab = nil
		slot0.shipModel = nil
	end
end

function slot0.uiStartAnimation(slot0)
	slot0.inAnimating = true
	slot0.titleWords = slot0:findTF("title")
	slot0.titleWords.transform.localScale = Vector3(0, 0, 1)
	slot0.frameX = slot0.frame.transform.localPosition.x
	slot0.paintX = slot0.paintContain.transform.localPosition.x

	setAnchoredPosition(slot0.frame, {
		x = slot0.frameX + 1000
	})
	setAnchoredPosition(slot0.paintContain, {
		x = slot0.paintX - 1000
	})
	shiftPanel(slot0.frame, slot0.frameX, nil, nil, 0.3, true, true)
	shiftPanel(slot0.paintContain, slot0.paintX, nil, nil, 0.3, true, true):setOnComplete(System.Action(function ()
		LeanTween.scale(rtf(slot0.titleWords), Vector3.New(1, 1, 1), 0.15):setDelay(0.04):setOnComplete(System.Action(function ()
			slot0.inAnimating = false
		end))
	end))
end

function slot0.skipAnimation(slot0)
	if not slot0.inAnimating then
		return
	end

	LeanTween:cancelAll()
	setAnchoredPosition(slot0.frame, {
		x = slot0.frameX
	})
	setAnchoredPosition(slot0.paintContain, {
		x = slot0.paintX
	})

	slot0.titleWords.transform.localScale = Vector3(1, 1, 1)
	slot0.inAnimating = false
end

function slot0.willExit(slot0)
	slot0:recycleSpineChar()

	if slot0.inAnimating then
		LeanTween:cancelAll()
	end

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	setParent(slot0._tf, slot0.UIMain)
end

return slot0
