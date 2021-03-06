pg = pg or {}
pg.GuideMgr = singletonClass("GuideMgr")
slot1 = 1
slot2 = 2
pg.GuideMgr.ENABLE_GUIDE = true
pg.GuideMgr.MANAGER_STATE = {
	LOADING = 0,
	STOP = 3,
	IDLE = 1,
	BUSY = 2
}
slot3 = 1
slot4 = 2
slot5 = {
	MODE2 = 2,
	MODE1 = 1
}
slot6 = require("GameCfg.guide.style")

function pg.GuideMgr.Init(slot0, slot1)
	print("initializing guide manager...")

	slot0.managerState = slot0.MANAGER_STATE.LOADING
	slot0._go = GameObject.Find("/OverlayCamera/Overlay/UIOverlay/GuideUI(Clone)")

	slot0._go:SetActive(false)

	slot0.UIOverlay = tf(GameObject.Find("Overlay/UIOverlay"))

	slot0._go.transform:SetParent(slot0.UIOverlay, false)

	slot0.guiderTF = findTF(slot0._go, "Guider")
	slot0.styleTF1 = findTF(slot0.guiderTF, "mode1")
	slot0.styleTF2 = findTF(slot0.guiderTF, "mode2")

	SetActive(slot0.guiderTF, false)

	slot0._bg = findTF(slot0._go, "BG")
	slot0.bgAlpha = slot0._bg:GetComponent(typeof(CanvasGroup))
	slot0._closeBtn = slot0._bg:Find("close_btn")
	slot0.uiLongPress = GetOrAddComponent(slot0._closeBtn, typeof(UILongPressTrigger))
	slot0.uiLongPress.longPressThreshold = 10
	slot0.fingerTF = findTF(slot0._go, "finger")

	SetActive(slot0.fingerTF, false)

	slot0.fingerSprites = {}

	eachChild(findTF(slot0._go, "resources"), function (slot0)
		table.insert(slot0.fingerSprites, slot0:GetComponent(typeof(Image)).sprite)
	end)

	slot0.managerState = slot0.MANAGER_STATE.IDLE

	slot1()
end

function pg.GuideMgr.canPlay(slot0, slot1)
	if pg.GuideMgr2.ENABLE_GUIDE then
		return false, 1
	end

	if pg.MsgboxMgr.GetInstance()._go.activeSelf then
		return false, 2
	end

	if pg.StoryMgr.GetInstance():isActive() then
		return false, 3
	end

	if slot0:isPlayed(slot1) then
		return false, 4
	end

	if slot0.managerState == slot0.MANAGER_STATE.BUSY then
		return false, 5
	end

	return true
end

function pg.GuideMgr.play(slot0, slot1, slot2, slot3)
	slot4, slot5 = slot0:canPlay(slot1)

	if slot4 then
		slot6 = {}
		slot0.currentGuide = pg.StoryMgr:GetInstance():GetStoryByName("newGuild." .. slot1)
		slot7 = Clone(slot0.currentGuide.events)

		if slot2 then
			slot0.curEvents = _.select(slot7, function (slot0)
				if not slot0.code then
					return true
				else
					return table.contains(slot0, slot0.code)
				end
			end)
		else
			slot0.curEvents = slot7
		end

		slot0:prepareGuider(slot1, slot3)

		slot8 = ipairs
		slot9 = slot0.curEvents or {}

		for slot11, slot12 in slot8(slot9) do
			table.insert(slot6, function (slot0)
				slot0:doCurrEvent(slot0.doCurrEvent, slot0)
			end)
		end

		seriesAsync(slot6, function ()
			slot0:endGuider(slot0)
		end)
	elseif slot3 then
		slot3()
	end
end

function pg.GuideMgr.isPlayed(slot0, slot1)
	if getProxy(PlayerProxy) then
		return slot2:getData():IsPlayed(slot1)
	end

	return false
end

function pg.GuideMgr.prepareGuider(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0.managerState = slot0.MANAGER_STATE.BUSY

	pg.m02:sendNotification(GAME.START_GUIDE)
	slot0._go.transform:SetAsLastSibling()
	slot0._go:SetActive(true)
	SetActive(slot0.fingerTF, false)

	slot0.bgAlpha.alpha = 0.2

	if (slot0.currentGuide.type or slot1) == slot1 then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = slot1
		})
	end

	slot0.uiLongPress.onLongPressed:AddListener(function ()
		slot0:endGuider(slot0)
	end)
end

function pg.GuideMgr.doCurrEvent(slot0, slot1, slot2)
	onButton(slot0, slot0._go, function ()
		slot0:finishCurrEvent(slot0, )
	end, SFX_PANEL)
	setButtonEnabled(slot0._go, not slot1.action.ui)

	if slot1.action.say then
		slot0:updateContent(slot1.action.say, slot1.text)
	end

	SetActive(slot0.guiderTF, slot1.action.say and slot1.action.say.text)

	if slot1.action.ui then
		slot0:updateUI(slot1, slot2)
	end
end

function pg.GuideMgr.finishCurrEvent(slot0, slot1, slot2)
	slot0.bgAlpha.alpha = 0.2

	removeOnButton(slot0._go)
	SetParent(slot0.fingerTF, tf(slot0._go), false)
	SetActive(slot0.fingerTF, false)
	SetActive(slot0.guiderTF, false)

	if slot0.cloneTarget then
		SetActive(slot0.cloneTarget, false)
		Destroy(slot0.cloneTarget)

		slot0.cloneTarget = nil
	end

	if slot0.targetTimer then
		slot0.targetTimer:Stop()

		slot0.targetTimer = nil
	end

	if slot0.findUITimer then
		slot0.findUITimer:Stop()

		slot0.findUITimer = nil
	end

	if (slot0.currentGuide.type or slot0) == slot1 and slot1.finish then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = slot0.currentGuide.id
		})
	end

	if slot2 then
		slot2()
	end
end

function pg.GuideMgr.updateContent(slot0, slot1, slot2)
	slot3 = {}

	if slot1.style then
		slot3 = slot1.style
	elseif slot1.commonStyle then
		slot3 = slot0[slot1.commonStyle]
	end

	slot4 = slot3.dir or 1
	slot6 = slot3.posX or 0
	slot7 = slot3.posY or 0
	slot8 = slot3.alpha or 0.8

	SetActive(slot0.styleTF1, (slot3.mode or 1) == slot1.MODE1)
	SetActive(slot0.styleTF2, (slot3.mode or 1) == slot1.MODE2)

	slot9 = nil

	if slot5 == slot1.MODE1 then
		slot9 = slot0.styleTF1
	elseif slot5 == slot1.MODE2 then
		slot9 = slot0.styleTF2
	end

	slot0.bgAlpha.alpha = slot8
	slot9.localScale = (slot4 == 1 and Vector3(1, 1, 1)) or Vector3(-1, 1, 1)
	slot9:Find("content").localScale = (slot4 == 1 and Vector3(1, 1, 1)) or Vector3(-1, 1, 1)
	slot13 = (slot2 and slot2) or slot1.text or ""

	setText(slot11, HXSet.hxLan)
	setAnchoredPosition(slot0.guiderTF, Vector3(slot6, slot7, 0))
end

function pg.GuideMgr.updateUI(slot0, slot1, slot2)
	slot4 = slot1.action.ui.path

	function slot5(slot0)
		if slot0.findUITimer then
			slot0.findUITimer:Stop()

			slot0.findUITimer = nil
		end

		slot0.cloneTarget = slot0:cloneGO(slot0.gameObject, slot0.UIOverlay, slot0)

		slot0:addTargetListener(slot0, slot0, )
		slot0:setFinger(slot0, slot0.setFinger)
	end

	function slot6()
		if slot0.findUITimer then
			slot0.findUITimer:Stop()

			slot0.findUITimer.Stop.findUITimer = nil
		end

		slot0:endGuider()
		print("can not find ui >> path:" .. )
	end

	slot7 = 20
	slot0.findUITimer = Timer.New(function ()
		if not IsNil(GameObject.Find(GameObject.Find)) and slot0.activeInHierarchy then
			if slot1.pathIndex then
				if not IsNil(tf(slot0):GetChild(slot1.pathIndex)) then
					slot2(tf(slot1))
				end
			else
				slot2(tf(slot0))
			end
		end

		if slot3 - 1 == 0 then
			slot4()
		end
	end, 0.5, -1)

	slot0.findUITimer:Start()
	slot0.findUITimer.func()
end

function pg.GuideMgr.cloneGO(slot0, slot1, slot2, slot3)
	slot4 = tf(Instantiate(slot1))

	SetActive(slot4, true)
	slot4:SetParent(slot2, false)

	if slot0.targetTimer then
		slot0.targetTimer:Stop()

		slot0.targetTimer = nil
	end

	slot0.targetTimer = Timer.New(function ()
		if not IsNil(IsNil) and not IsNil(slot1) then
			slot1.position = slot0.transform.position
			slot0.transform.position.localPosition = Vector3(slot1.localPosition.x, slot1.localPosition.y, 0)

			if not slot2.customSize then
				slot0.transform.localScale.localScale = Vector3(slot0.transform.localScale.x, slot0.transform.localScale.y, slot0.transform.localScale.z)
			end

			if slot2.image and type(slot2.image) == "table" then
				slot1 = tf(slot0):Find(slot2.image[1])

				if slot1:GetComponent(typeof(Image)).sprite.name ~= tf(slot1):Find(slot2.image[1]).GetComponent(slot3, typeof(Image)).sprite.name then
					setImageSprite(slot3, slot2)
				end
			end
		end
	end, 0.1, -1)

	slot0.targetTimer:Start()
	slot0.targetTimer.func()

	slot4.localScale = Vector3(slot3.scale or 1, , )

	if slot3.eulerAngles then
		slot4.eulerAngles = Vector3(slot3.eulerAngles[1], slot3.eulerAngles[2], slot3.eulerAngles[3])
	else
		slot4.eulerAngles = Vector3(0, 0, 0)
	end

	if not slot3.customSize then
		slot4.sizeDelta = Vector2(tf(slot1).sizeDelta.x, tf(slot1).sizeDelta.y)
	end

	return slot4
end

function pg.GuideMgr.setFinger(slot0, slot1, slot2)
	SetActive(slot0.fingerTF, true)

	slot3 = slot1.sizeDelta.x / 2
	slot4 = slot1.sizeDelta.y / 2
	slot0.fingerTF.localScale = Vector3((slot2.scale and 1 / slot2.scale) or 1, , 1)

	if LeanTween.isTweening(go(slot0.fingerTF)) then
		LeanTween.cancel(go(slot0.fingerTF))
	end

	slot6 = (slot2.fingerPos and Vector3(slot2.fingerPos.posX, slot2.fingerPos.posY, 0)) or Vector3(slot3, -slot4, 0)

	if slot0.cloneTarget then
		slot0.fingerTF:SetParent(slot0.cloneTarget, false)
	end

	setAnchoredPosition(slot0.fingerTF, slot6)
	LeanTween.play(slot0.fingerTF, slot0.fingerSprites):setLoopPingPong()
end

function pg.GuideMgr.addTargetListener(slot0, slot1, slot2, slot3)
	slot5 = slot1
	slot6 = (slot2.action.ui.triggerType and slot4.triggerType[1]) or slot0

	if slot6 == slot0 then
		onButton(slot0, slot0.cloneTarget, function ()
			if not IsNil(IsNil) then
				triggerButton(triggerButton)
				triggerButton:finishCurrEvent(slot2, slot3)
			end
		end, SFX_PANEL)
	elseif slot6 == slot1 then
		onToggle(slot0, slot0.cloneTarget, function (slot0)
			if slot0 and not IsNil(slot0) then
				slot1(slot0, slot1.triggerType[2] or true)
				slot0:finishCurrEvent(slot1.triggerType[2] or true, slot4)
			end
		end, SFX_PANEL)
	end
end

function pg.GuideMgr.Match(slot0, slot1, slot2, slot3)
	if slot1 == "=" then
		return slot2 == slot3
	elseif slot1 == "<" then
		return slot2 < slot3
	elseif slot1 == ">" then
		return slot3 < slot2
	elseif slot1 == "<=" then
		return slot2 <= slot3
	elseif slot1 == ">=" then
		return slot3 <= slot2
	elseif slot1 == "~=" then
		return slot2 ~= slot3
	else
		return false
	end
end

function slot7(slot0)
	if slot0.targetTimer then
		slot0.targetTimer:Stop()

		slot0.targetTimer = nil
	end

	if slot0.findUITimer then
		slot0.findUITimer:Stop()

		slot0.findUITimer = nil
	end

	if slot0.cloneTarget then
		SetParent(slot0.fingerTF, slot0._go)
		Destroy(slot0.cloneTarget)

		slot0.cloneTarget = nil
	end

	slot0._go:SetActive(false)
	removeOnButton(slot0._go)

	if slot0.curEvents then
		slot0.curEvents = nil
	end

	if slot0.currentGuide then
		slot0.currentGuide = nil
	end

	slot0.uiLongPress.onLongPressed:RemoveAllListeners()
end

function pg.GuideMgr.endGuider(slot0, slot1)
	slot0(slot0)
	pg.DelegateInfo.Dispose(slot0)

	slot0.managerState = slot1.MANAGER_STATE.IDLE

	pg.m02:sendNotification(GAME.END_GUIDE)

	if slot1 then
		slot1()
	end
end

return
