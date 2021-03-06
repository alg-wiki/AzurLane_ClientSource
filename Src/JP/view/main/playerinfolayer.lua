slot0 = class("PlayerInfoLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "AdmiralUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0:updatePlayerInfo(slot1)
end

function slot0.updatePlayerInfo(slot0, slot1)
	slot0.player = slot1
end

function slot0.setShipCount(slot0, slot1)
	slot0.shipCount = slot1 or 0
end

function slot0.setFlagShip(slot0, slot1)
	slot0.flagShip = slot1

	slot0:updatePainting(slot1)
end

function slot0.setCollectionRate(slot0, slot1)
	slot0.collectionRate = slot1
end

function slot0.setMilitaryExercise(slot0, slot1)
	slot0.seasonInfo = slot1
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("top/title/back")
	slot0.topPanel = slot0:findTF("top")
	slot0.rightPanel = slot0:findTF("right_panel")
	slot0.leftPanel = slot0:findTF("left_panel")
	slot0.paintContain = slot0:findTF("paint", slot0.leftPanel)
	slot0.replaceBtn = slot0:findTF("replace_btn", slot0.leftPanel)
	slot0.live2dBtn = slot0:findTF("L2D_btn", slot0.leftPanel)
	slot0.live2dToggle = slot0.live2dBtn:Find("toggle")
	slot0.live2dState = slot0.live2dBtn:Find("state")
	slot0.writeBtn = slot0:findTF("greet/write_btn", slot0.rightPanel)
	slot0.inputField = slot0:findTF("greet/InputField", slot0.rightPanel)
	slot0.shareBtn = slot0:findTF("btn_share", slot0.rightPanel)
	slot0.modifyNameBtn = slot0:findTF("right_panel/info_panel/title/name_bg/modify_btn")
	slot0.changeNamePanel = slot0:findTF("changeName_panel")
	slot0.changeNameTip = slot0:findTF("frame/tip", slot0.changeNamePanel):GetComponent(typeof(Text))
	slot0.changeNameConfirmBtn = slot0:findTF("frame/queren", slot0.changeNamePanel)
	slot0.changeNameCancelBtn = slot0:findTF("frame/cancel", slot0.changeNamePanel)
	slot0.changeNameInputField = slot0:findTF("frame/name_field", slot0.changeNamePanel)

	SetActive(slot0.changeNamePanel, false)
end

function slot0.didEnter(slot0)
	slot0:uiStartAnimating()
	onButton(slot0, slot0.backBtn, function ()
		slot0:uiExitAnimating()
		slot0.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.5)
	end, SFX_CANCEL)
	onButton(slot0, slot0.replaceBtn, function ()
		slot0:emit(PlayerInfoMediator.CHANGE_PAINT, slot0.player.character)
	end, SFX_PANEL)
	onButton(slot0, slot0.writeBtn, function ()
		activateInputField(slot0.inputField)
	end, SFX_PANEL)
	onButton(slot0, slot0.shareBtn, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeAdmira)
	end, SFX_PANEL)
	onInputEndEdit(slot0, slot0.inputField, function (slot0)
		if wordVer(slot0) > 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("playerinfo_mask_word"))
			activateInputField(slot0.inputField)

			return
		end

		if not slot0 or slot0.manifesto == slot0 then
			return
		end

		slot0.manifesto = slot0

		slot0:emit(PlayerInfoMediator.CHANGE_MANIFESTO, slot0)
	end)
	onButton(slot0, slot0.modifyNameBtn, function ()
		slot0, slot1 = slot0.player:canModifyName()

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		slot0:openChangePlayerNamePanel()
	end, SFX_PANEL)
	slot0:initPlayerInfo()
	slot0:updateManifesto()

	slot0.manifesto = slot0.player.manifesto
end

function slot0.openChangePlayerNamePanel(slot0)
	slot0.isOpenChangeNamePanel = true

	SetActive(slot0.changeNamePanel, true)

	if not slot0.isInitChangeNamePanel then
		slot0.isInitChangeNamePanel = true

		onButton(slot0, slot0.changeNameConfirmBtn, function ()
			slot0 = getInputText(slot0.changeNameInputField)

			slot0:emit(PlayerInfoMediator.ON_CHANGE_PLAYER_NAME, slot0)
			setInputText(slot0.changeNameInputField, "")
		end, SFX_PANEL)
		onButton(slot0, slot0.changeNameCancelBtn, function ()
			slot0:closeChangePlayerNamePanel()
		end, SFX_PANEL)
		onButton(slot0, slot0.changeNamePanel, function ()
			slot0:closeChangePlayerNamePanel()
		end, SFX_PANEL)
	end

	slot2 = nil
	slot3 = 0

	if slot0.player:getModifyNameComsume()[1] == DROP_TYPE_RESOURCE then
		slot2 = Item.New({
			id = id2ItemId(slot1[2]),
			type = DROP_TYPE_ITEM,
			count = slot1[3]
		})
		slot3 = slot0.player:getResById(slot1[2])
	elseif slot1[1] == DROP_TYPE_ITEM then
		slot2 = Item.New({
			id = slot1[2],
			type = DROP_TYPE_ITEM,
			count = slot1[3]
		})
		slot3 = getProxy(BagProxy):getItemCountById(slot1[2])
	end

	slot0.changeNameTip.text = i18n("player_name_change_windows_tip", slot2:getConfig("name"), slot3 .. "/" .. slot1[3])
end

function slot0.closeChangePlayerNamePanel(slot0)
	slot0.isOpenChangeNamePanel = nil

	SetActive(slot0.changeNamePanel, false)
end

function slot0.onBackPressed(slot0)
	if slot0.isOpenChangeNamePanel then
		slot0:closeChangePlayerNamePanel()
	else
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0.backBtn)
	end
end

function slot0.uiStartAnimating(slot0)
	setAnchoredPosition(slot0.topPanel, {
		y = 100
	})
	setAnchoredPosition(slot0.leftPanel, {
		x = -1280
	})
	setAnchoredPosition(slot0.rightPanel, {
		x = 1280
	})
	shiftPanel(slot0.topPanel, nil, 0, nil, 0.1, true, true)

	slot0.tweens = topAnimation(slot1, slot2, slot3, slot4, nil, function ()
		slot0.tweens = nil
	end)

	shiftPanel(slot0.leftPanel, 0, nil, nil, 0.1, true, true)
	shiftPanel(slot0.rightPanel, 0, nil, nil, 0.1, true, true)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.leftPanel, 20, nil, 0.1, 0, true, true):setOnComplete(System.Action(function ()
		shiftPanel(slot0.leftPanel, -1280, nil, 0.4, 0.08, true, true)
	end))
	shiftPanel(slot0.rightPanel, -20, nil, 0.1, 0, true, true):setOnComplete(System.Action(function ()
		shiftPanel(slot0.rightPanel, 1280, nil, 0.4, 0.08, true, true)
	end))
	shiftPanel(slot0.topPanel, nil, 100, 0.2, 0.2, true, true)
end

function slot0.updateManifesto(slot0)
	setInputText(slot0.inputField, slot0.player.manifesto)
end

function slot0.updatePainting(slot0, slot1)
	setPaintingPrefabAsync(slot0.paintContain, slot1:getPainting(), "kanban")
	slot0:updateLive2DState()
end

function slot0.updateLive2DState(slot0)
	slot1 = "live2d/" .. string.lower(slot0.flagShip:getPainting())
	slot3 = getProxy(SettingsProxy).IsLive2dEnable(slot2)

	if Live2DUpdateMgr.Inst.state == DownloadState.None or slot5 == DownloadState.CheckFailure then
		slot4:CheckD()
	end

	if slot4:CheckF(slot1) == DownloadState.CheckToUpdate or slot6 == DownloadState.UpdateFailure then
		setActive(slot0.live2dBtn, true)
		setActive(slot0.live2dState, false)
		setActive(slot0.live2dToggle, true)
		setActive(slot0.live2dToggle:Find("on"), false)
		setActive(slot0.live2dToggle:Find("off"), true)
		onButton(slot0, slot0.live2dBtn, function ()
			slot0:UpdateF(slot0, true)
		end, SFX_PANEL)
	elseif slot6 == DownloadState.Updating then
		setActive(slot0.live2dBtn, true)
		setActive(slot0.live2dToggle, false)
		setActive(slot0.live2dState, true)
		removeOnButton(slot0.live2dBtn)
	else
		setActive(slot0.live2dBtn, PathMgr.FileExists(PathMgr.getAssetBundle(slot1)))

		if PathMgr.FileExists(PathMgr.getAssetBundle(slot1)) then
			setActive(slot0.live2dState, false)
			setActive(slot0.live2dToggle, true)
			setActive(slot0.live2dToggle:Find("on"), slot8)
			setActive(slot0.live2dToggle:Find("off"), not slot3)
			onButton(slot0, slot0.live2dBtn, function ()
				slot0:SetLive2dEnable(not slot1)
				slot2:updateLive2DState()
			end, SFX_PANEL)
		end
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	if slot6 == DownloadState.CheckToUpdate or slot6 == DownloadState.UpdateFailure or slot6 == DownloadState.Updating then
		slot0.live2dTimer = Timer.New(function ()
			slot0:updateLive2DState()
		end, 0.5, 1)

		slot0.live2dTimer:Start()
	end
end

function slot0.initPlayerInfo(slot0)
	if math.max(slot0.player.maxRank, 1) > 14 then
		slot2 = 14
	end

	slot6 = {
		slot1.shipCount,
		slot1.attackCount,
		string.format("%0.1f", slot1.winCount / math.max(slot1.attackCount, 1) * 100) .. "%",
		slot1.collect_attack_count,
		slot1.pvp_attack_count,
		string.format("%0.1f", slot1.pvp_win_count / math.max(slot1.pvp_attack_count, 1) * 100) .. "%"
	}
	slot7 = slot0:findTF("info_panel", slot0.rightPanel)
	slot8 = slot0:findTF("exp_panel", slot0.rightPanel)

	setText(findTF(slot7, "title/name_bg/Text"), slot1.name)
	setText(findTF(slot7, "title/name_bg/uid"), slot1.id)
	setText(findTF(slot7, "title/lv_bg/Text"), "LV." .. slot1.level)
	setText(findTF(slot7, "title/exp"), slot0.player.exp .. "/" .. slot9)

	slot10 = slot0:findTF("frame/info_list", slot7)

	for slot14, slot15 in ipairs(slot5) do
		setText(findTF(slot10:GetChild(slot14 - 1), "value"), slot15 or 0)
	end

	LoadImageSpriteAsync("emblem/" .. slot12, slot11)

	if SeasonInfo.getMilitaryRank(slot0.seasonInfo.score, slot0.seasonInfo.rank) then
		slot14 = slot0:findTF("frame/medal/Text", slot7)
	end

	for slot17, slot18 in ipairs(slot6) do
		setText(findTF(slot8:GetChild(slot17 - 1), "value"), slot18 or 0)
	end

	slot0:setLanguages()
end

function slot0.updatePlayerName(slot0)
	setText(findTF(slot1, "title/name_bg/Text"), slot0.player.name)
end

function slot0.setLanguages(slot0)
	slot1 = slot0:findTF("right_panel/frame")

	setText(slot0:findTF("right_panel/frame/bg1/title_name"), i18n("friend_resume_title"))
	setText(slot0:findTF("right_panel/frame/bg2/title_name"), i18n("friend_resume_data_title"))
	setText(slot0:findTF("right_panel/exp_panel/ship_count/name"), i18n("friend_resume_ship_count"))
	setText(slot0:findTF("right_panel/exp_panel/combat_count/name"), i18n("friend_resume_attack_count"))
	setText(slot0:findTF("right_panel/exp_panel/succeed_rate/name"), i18n("friend_resume_attack_win_rate"))
	setText(slot0:findTF("right_panel/exp_panel/action_count/name"), i18n("friend_event_count"))
	setText(slot0:findTF("right_panel/exp_panel/exercise_count/name"), i18n("friend_resume_manoeuvre_count"))
	setText(slot0:findTF("right_panel/exp_panel/exercise_rate/name"), i18n("friend_resume_manoeuvre_win_rate"))
	setText(slot0:findTF("right_panel/info_panel/frame/info_list/collection_rate/name"), i18n("friend_resume_collection_rate"))
	setText(slot0:findTF("right_panel/info_panel/frame/info_list/medal_rank/name"), i18n("friend_resume_title_metal"))
end

function slot0.willExit(slot0)
	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end
end

return slot0
