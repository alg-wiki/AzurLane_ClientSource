slot0 = class("ShopsLayer", import("..base.BaseUI"))
slot0.TYPE_ACTIVITY = "activity"
slot0.TYPE_SHOP_STREET = "shopstreet"
slot0.TYPE_MILITARY_SHOP = "supplies"
slot0.TYPE_GUILD = "guild"
slot0.TYPE_SHAM_SHOP = "sham"
slot0.TYPE_ESCORT_SHOP = "escort"

function slot0.getUIName(slot0)
	return "shopsUI"
end

function slot0.init(slot0)
	slot0.bgs = {}
	slot0.top = slot0:findTF("frame/top")
	slot0.backBtn = slot0:findTF("frame/top/left_top/btnBack")
	slot0.goodTF = slot0:getTpl("frame/item_tpl")
	slot0.goodActivityTF = slot0:getTpl("frame/item_activity_tpl")
	slot0.bottomPanel = slot0:findTF("frame/bottom")
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel:setParent(slot0:findTF("frame/top/res_oil"), false)

	slot0.switchBtn = slot0:findTF("frame/switch_btn")
	slot0.bgImg = slot0._tf:GetComponent(typeof(Image))
	slot0.paintingTF = slot0:findTF("frame/painting")
	slot0.cards = {}
end

function slot0.setMilitaryShop(slot0, slot1)
	slot0.militaryShop = slot1

	slot0:updateMilitaryShop()
end

function slot0.setGuildShop(slot0, slot1)
	slot0.guildShop = slot1
	slot0.guildShopRefreshTime = slot1.nextRefreshTime
end

function slot0.setShamShop(slot0, slot1)
	slot0.shamShop = slot1
end

function slot0.setEscortShop(slot0, slot1)
	slot0.escortShop = slot1
end

function slot0.updatePlayer(slot0, slot1)
	slot0.player = slot1
	slot0.exploit = slot1.exploit

	slot0:updateExploit()
	slot0.resPanel:setResources(slot1)
	slot0:updateActivityRes()
	slot0:updateGuildRes()
end

function slot0.uiStartAnimating(slot0)
	setAnchoredPosition(slot0.top, {
		y = slot0.top.transform.rect.height
	})
	shiftPanel(slot0.top, nil, 0, slot2, slot1, true, true)

	slot0.tweens = topAnimation(slot0:findTF("left_top/left", slot0.top), slot0:findTF("left_top/right", slot0.top), slot0:findTF("left_top/title", slot0.top), slot0:findTF("left_top/activity", slot0.top), nil, function ()
		slot0.tweens = nil
	end)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.top, nil, slot0.top.transform.rect.height, 0.3, 0, true, true)
end

function slot0.didEnter(slot0)
	slot0:uiStartAnimating()

	slot0.millitaryShopCfg = pg.arena_data_shop[1]

	onButton(slot0, slot0.backBtn, function ()
		slot0:uiExitAnimating()

		if getProxy(ContextProxy):getCurrentContext() and slot1.scene == SCENE.SHOP then
			slot0:emit(slot1.ON_BACK, nil, 0.3)
		else
			slot0:emit(slot1.ON_CLOSE, 0.3)
		end
	end, SFX_CANCEL)
	setActive(slot0:findTF("stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(slot0, slot0:findTF("stamp"), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(4)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.switchBtn, function ()
		slot0:emit(ShopsMediator.GO_MALL)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("frame/military_shop/refresh_btn"), function ()
		if slot0.militaryShop.refreshCount - 1 >= #slot0.millitaryShopCfg.refresh_price then
			pg.TipsMgr:GetInstance():ShowTips(i18n("shopStreet_refresh_max_count"))

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("refresh_shopStreet_question", i18n("word_gem_icon"), slot0.millitaryShopCfg.refresh_price[slot0.militaryShop.refreshCount] or slot0.millitaryShopCfg.refresh_price[#slot0.millitaryShopCfg.refresh_price], slot0.millitaryShopCfg.refresh_price[slot0.militaryShop.refreshCount] or slot0.millitaryShopCfg.refresh_price[#slot0.millitaryShopCfg.refresh_price].militaryShop.refreshCount - 1),
			onYes = function ()
				if slot0.player:getTotalGem() < slot0.player then
					pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_resource"))

					return
				else
					slot0:emit(ShopsMediator.REFRESH_MILITARY_SHOP)
				end
			end
		})
	end, SFX_PANEL)

	slot0.chat = slot0:findTF("frame/chat")
	slot0.chatTxt = slot0:findTF("content_bg/Text", slot0.chat)
	slot0.buzhihuo = slot0:findTF("frame/bg/buzhihuo")

	setActive(slot0.chat, false)
	onButton(slot0, slot0.buzhihuo, function ()
		slot0:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_touch, false, "touch")
	end, SFX_PANEL)

	slot0.toggles = {}
	slot2 = slot0:getTpl("activity", slot0.bottomPanel:Find("toggle_list"))
	slot0.curPage = nil
	slot4 = slot0.activityShops or {}

	table.sort(_.values, function (slot0, slot1)
		return slot0:getStartTime() < slot1:getStartTime()
	end)

	for slot7, slot8 in ipairs(slot3) do
		if not slot8:isEnd() then
			onToggle(slot0, cloneTplTo(slot2, slot1, slot8.activityId), function (slot0)
				if slot0 then
					slot0.curPage = slot1.TYPE_ACTIVITY

					slot0:intActivityShop(slot2.activityId)
				end
			end, SFX_PANEL)
		end
	end

	eachChild(slot1, function (slot0)
		slot0.toggles[slot0.name] = slot0
	end)
	onToggle(slot0, slot0.toggles[slot0.TYPE_GUILD], function (slot0)
		if slot0 then
			if slot0.curPage == slot1.TYPE_GUILD then
				return
			end

			if slot0.guildShop then
				slot0:initGuildShop()
			else
				slot0:emit(ShopsMediator.GET_GUILD_SHOP)
			end

			if slot0.curPage == nil or slot0.curPage == slot1.TYPE_ACTIVITY then
				slot0:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_enter, true, "enter")
			end

			slot0.curPage = slot1.TYPE_GUILD
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.toggles[slot0.TYPE_MILITARY_SHOP], function (slot0)
		if slot0 then
			if slot0.curPage == slot1.TYPE_MILITARY_SHOP then
				return
			end

			if not slot0.player then
				return
			end

			slot1, slot2 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "MilitaryExerciseMediator")

			if not slot1 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("military_shop_no_open_tip"))

				if slot0:getCurrPage() then
					triggerToggle(slot0.toggles[slot3], true)
				end

				return
			end

			if slot0.curPage == nil or slot0.curPage == slot1.TYPE_ACTIVITY then
				slot0:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_enter, true, "enter")
			end

			slot0.curPage = slot1.TYPE_MILITARY_SHOP
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.toggles[slot0.TYPE_SHOP_STREET], function (slot0)
		if slot0 then
			if slot0.curPage == slot1.TYPE_SHOP_STREET then
				return
			end

			if slot0.curPage == nil or slot0.curPage == slot1.TYPE_ACTIVITY then
				slot0:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_enter, true, "enter")
			end

			slot0.curPage = slot1.TYPE_SHOP_STREET
		end
	end, SFX_PANEL)
	setActive(slot0.toggles[slot0.TYPE_SHAM_SHOP], slot4)
	onToggle(slot0, slot0.toggles[slot0.TYPE_SHAM_SHOP], function (slot0)
		if slot0 then
			slot1, slot2 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "ShamShop")

			if not slot1 then
				pg.TipsMgr:GetInstance():ShowTips(slot2)

				if slot0:getCurrPage() then
					triggerToggle(slot0.toggles[slot3], true)
				end

				return
			end

			if slot0.curPage == slot1.TYPE_SHAM_SHOP then
				return
			end

			if slot0.curPage == nil or slot0.curPage == slot1.TYPE_ACTIVITY then
				slot0:showRandomShipWord(pg.navalacademy_shoppingstreet_template[1].words_enter, true, "enter")
			end

			slot0.curPage = slot1.TYPE_SHAM_SHOP

			slot0:updateShamShop()
			slot0:updateShamRes()
		end
	end, SFX_PANEL)

	slot0.warp = slot0.contextData.warp

	if slot0.warp == slot0.TYPE_SHAM_SHOP then
		slot5, slot6 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "ShamShop")

		if not slot5 then
			slot0.warp = nil

			pg.TipsMgr:GetInstance():ShowTips(slot6)
		end

		if not slot4 then
			slot0.warp = nil

			pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_not_start"))
		end
	end

	if (not slot0.warp or slot0.warp == slot0.TYPE_ACTIVITY) and #slot3 > 0 then
		if slot0.contextData.actId and slot0.toggles[tostring(slot0.contextData.actId)] then
			triggerToggle(slot0.toggles[tostring(slot0.contextData.actId)], true)
		else
			triggerToggle(slot0.toggles[tostring(slot3[#slot3].activityId)], true)
		end
	else
		slot0.warp = slot0.warp or slot0.TYPE_SHOP_STREET

		triggerToggle(slot0.toggles[slot0.warp], true)
	end

	onButton(slot0, findTF(slot0._tf, "frame/shop_street/refresh_btn"), function ()
		if not ShoppingStreet.getRiseShopId(ShopArgs.ShoppingStreetUpgrade, slot0.shopStreet.flashCount) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("shopStreet_refresh_max_count"))

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_confirm",
			hideNo = false,
			noText = "text_cancel",
			content = i18n("refresh_shopStreet_question", i18n("word_" .. id2res(pg.shop_template[slot0].resource_type) .. "_icon"), pg.shop_template[slot0].resource_num, slot0.shopStreet.flashCount),
			onYes = function ()
				slot0:emit(ShopsMediator.REFRESH_SHOP_STREET, slot0)
			end
		})
	end, SFX_PANEL)
end

function slot0.getCurrPage(slot0)
	if slot0.curPage == slot0.TYPE_ACTIVITY then
		return tostring(slot0.currActivityShop.activityId)
	else
		return slot0.curPage
	end
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if not IsNil(slot0.singleBoxTF) and isActive(slot0.singleBoxTF) then
		triggerButton(slot0.singleBoxTF)

		return
	end

	if not IsNil(slot0.msgBoxTF) and isActive(slot0.msgBoxTF) then
		triggerButton(slot0.msgBoxTF)

		return
	end

	triggerButton(slot0.backBtn)
end

function slot0.randomShipWord(slot0, slot1)
	return string.split(slot1, "|")[math.random(#string.split(slot1, "|"))], math.random(#string.split(slot1, "|"))
end

function slot0.clearShipWord(slot0)
	if slot0.wordTweenId then
		LeanTween.cancel(slot0.wordTweenId)

		slot0.wordTweenId = nil
	end

	slot0.chatFlag = nil

	setActive(slot0.chat, false)
end

function slot0.showRandomShipWord(slot0, slot1, slot2, slot3)
	if not slot0.chatFlag or slot2 then
		slot0.chatFlag = true

		if slot0.wordTweenId then
			LeanTween.cancel(slot0.wordTweenId)

			slot0.wordTweenId = nil
		end

		slot4 = 0.3
		slot5 = 3

		setActive(slot0.chat, true)

		slot1, index = slot0:randomShipWord(slot1)

		setText(slot0.chatTxt, slot6)

		if slot3 then
			slot0:playCV(slot3 .. "_" .. index)
		end

		slot0.wordTweenId = LeanTween.scale(slot0.chat.gameObject, Vector3.New(1, 1, 1), slot4):setFrom(Vector3.New(0, 0, 0)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()
			if IsNil(slot0.chat) then
				return
			end

			slot0.wordTweenId = LeanTween.scale(slot0.chat.gameObject, Vector3.New(0, 0, 1), LeanTween.scale):setFrom(Vector3.New(1, 1, 1)):setEase(LeanTweenType.easeInBack):setDelay(LeanTween.scale(slot0.chat.gameObject, Vector3.New(0, 0, 1), LeanTween.scale).setFrom(Vector3.New(1, 1, 1)).setEase(LeanTweenType.easeInBack)):setOnComplete(System.Action(function ()
				if IsNil(slot0.chat) then
					return
				end

				slot0:clearShipWord()
			end)).uniqueId
		end)).uniqueId
	end
end

function slot0.playCV(slot0, slot1)
	if "event:/cv/shop/" .. slot1 then
		function slot3()
			slot0:stopCV()

			slot0.stopCV._currentVoice = playSoundEffect(playSoundEffect)
		end

		if slot0.loadedCVBankName then
			slot3()
		else
			pg.CriMgr:LoadCV("shop", function ()
				slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

				if pg.CriMgr.GetCVBankName.exited then
					pg.CriMgr.UnloadCVBank(slot0)
				else
					slot2()

					if slot2._currentVoice then
						slot1.loadedCVBankName = slot0
					end
				end
			end)
		end
	end
end

function slot0.updateExploit(slot0)
	setText(slot0:findTF("frame/top/res_exploit/bg/Text"), slot0.exploit)
end

function slot0.updateActivityRes(slot0)
	if slot0.currActivityShop then
		setText(slot0:findTF("frame/top/res_battery/Text"), slot0.player[id2res(slot0.currActivityShop:getResId())])
	end
end

function slot0.updateMilitaryShop(slot0)
	removeAllChildren(slot1)

	slot0.milGoodsTFs = {}
	slot2 = table.getCount(slot0.militaryShop.goods)

	for slot6, slot7 in pairs(slot0.militaryShop.goods) do
		slot0.milGoodsTFs[slot6] = GoodsCard.New(slot8)

		table.insert(slot0.cards, slot0.milGoodsTFs[slot6])
		slot0.milGoodsTFs[slot6]:update(slot7)
		onButton(slot0, slot0.milGoodsTFs[slot7.id].itemTF, function ()
			pg.MsgboxMgr.GetInstance():showSingleItemBox({
				showOwned = true,
				hideLine = true,
				yesText = "text_buy",
				drop = {
					id = slot0:getConfig("effect_args")[1],
					type = slot0:getConfig("type")
				},
				onYes = function ()
					if not slot0:canPurchase() then
						pg.TipsMgr:GetInstance():ShowTips(i18n("buy_countLimit"))

						return
					end

					slot1:emit(ShopsMediator.BUY_ITEM, slot0.id, 1)
				end
			})
		end, SFX_PANEL)
	end

	slot0:addRefreshTimer(slot0.militaryShop.nextTime + 1)
end

function slot0.stopCV(slot0)
	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil
end

function slot0.addRefreshTimer(slot0, slot1)
	slot2()

	slot3 = slot0:findTF("frame/military_shop/timer_bg/Text")
	slot0.refreshTimer = Timer.New(function ()
		if slot0 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
			slot1()
			slot2:emit(ShopsMediator.GET_MILITARY_SHOP)
		else
			setText(slot0, pg.TimeMgr.GetInstance():DescCDTime(slot0))
		end
	end, 1, -1)

	slot0.refreshTimer:Start()
	slot0.refreshTimer.func()
end

function slot0.setShopStreet(slot0, slot1)
	slot0.shopStreet = slot1
end

function slot0.updateShopStreet(slot0, slot1)
	slot2 = pg.navalacademy_shoppingstreet_template[slot1.level]

	slot0:displayShopSteet(1)
	setText(slot3, pg.TimeMgr:GetInstance():DescCDTime(slot1.nextFlashTime - pg.TimeMgr.GetInstance():GetServerTime()))
	setActive(slot0:findTF("frame/shop_street/tip_activity", slot0._merchatLayer), getProxy(ActivityProxy).getActivityByType(slot5, ActivityConst.ACTIVITY_TYPE_SHOP_STREET) and not slot6:isEnd())
	setText(slot7, i18n("shop_street_activity_tip"))

	if slot0.shopStreetTimer then
		slot0.shopStreetTimer:Stop()

		slot0.shopStreetTimer = nil
	end

	slot0.shopStreetTimer = Timer.New(function ()
		if slot0:isUpdateGoods() then
			slot1.shopStreetTimer:Stop()

			slot1.shopStreetTimer.shopStreetTimer = nil

			nil:emit(ShopsMediator.GET_SHOP_STREEET)
		else
			setText(setText, pg.TimeMgr:GetInstance():DescCDTime(slot0.nextFlashTime - pg.TimeMgr.GetInstance():GetServerTime()))
		end
	end, 1, -1)

	slot0.shopStreetTimer:Start()
end

slot1 = 2
slot2 = 5

function slot0.displayShopSteet(slot0, slot1)
	if math.floor(#slot0.shopStreet.goods / slot0) < #slot0.shopStreet.goods / slot0 then
		slot2 = math.floor(slot2) + 1
	end

	slot3 = math.max(slot1, slot2) * slot0

	removeAllChildren(slot4)

	slot0.shopStreetTFs = {}
	slot6 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SHOP_DISCOUNT) and not slot5:isEnd()

	for slot10 = 1, slot3, 1 do
		slot0.shopStreetTFs[slot0.shopStreet.goods[slot10].id] = GoodsCard.New(slot12)

		table.insert(slot0.cards, slot0.shopStreetTFs[slot0.shopStreet.goods[slot10].id])

		if slot0.shopStreet.goods[slot10] then
			slot11.activityDiscount = slot6

			slot0.shopStreetTFs[slot11.id]:update(slot11)
			onButton(slot0, slot0.shopStreetTFs[slot11.id].itemTF, function ()
				pg.MsgboxMgr.GetInstance():showSingleItemBox({
					showOwned = true,
					hideLine = true,
					yesText = "text_buy",
					drop = {
						id = slot0:getConfig("effect_args")[1],
						type = slot0:getConfig("type")
					},
					onYes = function ()
						if not slot0:canPurchase() then
							pg.TipsMgr:GetInstance():ShowTips(i18n("buy_countLimit"))

							return
						end

						if slot0:getConfig("resource_type") == 4 or slot0 == 14 then
							slot1 = slot1.player:getResById(slot0)

							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("charge_scene_buy_confirm", slot0:getConfig("resource_num") * slot0.discount / 100, Item.New({
									id = slot0:getConfig("effect_args")[1]
								}):getConfig("name")),
								onYes = function ()
									slot0:emit(ShopsMediator.BUY_ITEM, slot1.id, 1)
								end
							})
						else
							slot1:emit(ShopsMediator.BUY_ITEM, slot0.id, 1)
						end
					end
				})
			end, SFX_PANEL)
		else
			setActive(findTF(slot12, "item"), false)
			setActive(findTF(slot12, "empty"), true)
		end
	end
end

function slot0.setActivityShops(slot0, slot1)
	slot0.activityShops = slot1
end

function slot0.updateActivityShop(slot0, slot1, slot2)
	slot0.activityShops[slot1] = slot2

	if slot0.currActivityShop and slot0.currActivityShop.id == slot2.id then
		slot0:intActivityShop(slot1)
	end
end

function slot0.intActivityShop(slot0, slot1)
	if not slot0.activityShops[slot1] or slot0.currActivityShop == slot2 then
		return
	end

	slot3 = slot2:getSortGoods()

	if slot0.activityCards and #slot0.activityCards > 0 then
		_.each(slot0.activityCards, function (slot0)
			slot0:dispose()
		end)
	end

	slot0.activityCards = {}

	if not slot0.uilist then
		slot0.uilist = UIItemList.New(slot0:findTF("frame/activity_shop/scrollView/view"), slot0.goodActivityTF)
	end

	slot0.uilist.make(slot4, function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = ActivityGoodsCard.New(slot2)

			slot4:update(slot3)
			table.insert(slot1.activityCards, slot4)
			onButton(slot1, slot4.tr, function ()
				slot0:showMsxBox(slot0)
			end, SFX_PANEL)
		end
	end)
	slot0.uilist.align(slot4, #slot3)

	slot0.currActivityShop = slot2

	setText(slot0:findTF("frame/activity_shop/Text"), i18n("activity_shop_lable", slot2:getOpenTime()))

	slot5 = slot2:getResId()

	setText(slot0:findTF("frame/top/res_battery/Text"), slot0.player:getResource(slot5))
	setText(slot0:findTF("frame/top/res_battery/label"), i18n("word_own") .. pg.item_data_statistics[id2ItemId(slot5)].name)

	slot0:findTF("frame/top/res_battery/icon"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas(pg.item_data_statistics[id2ItemId(slot5)].icon, "")
	slot8, slot9 = slot2:getBgPath()
	slot11 = nil

	if slot0.bgs[slot2.activityId] then
		slot11 = slot10
	else
		slot0.bgs[slot2.activityId] = GetSpriteFromAtlas(slot8, "")
	end

	setImageSprite(slot0:findTF("frame/activity_shop/bg"), slot11)
	eachChild(slot12, function (slot0)
		slot0:GetComponent(typeof(Image)).color = slot0
	end)

	slot0:findTF("frame/top/res_battery"):GetComponent(typeof(Image)).color = slot9
	slot0:findTF("frame/activity_shop/Scrollbar/Sliding Area/Handle"):GetComponent(typeof(Image)).color = slot9
end

function slot0.showMsxBox(slot0, slot1)
	if slot1:getConfig("num_limit") == 1 or slot1:getConfig("commodity_type") == 4 then
		slot0:openSingleBox(slot1)
	else
		slot0:initMsgBox(slot1)
	end
end

function slot0.openSingleBox(slot0, slot1)
	slot2 = {
		id = slot1:getConfig("commodity_id"),
		type = slot1:getConfig("commodity_type"),
		count = slot1:getConfig("num")
	}

	if not slot0.singleBoxTF then
		slot0.singleBoxTF = slot0:findTF("singlebox")
		slot0.singleNameTF = slot0:findTF("window/item/name", slot0.singleBoxTF):GetComponent(typeof(Text))
		slot0.singleDescTF = slot0:findTF("window/item/intro_view/Viewport/intro", slot0.singleBoxTF):GetComponent(typeof(Text))
		slot0.singleItemTF = slot0:findTF("window/item", slot0.singleBoxTF)
		slot0.singleItemOwnTF = slot0:findTF("icon_bg/own/Text", slot0.singleItemTF)
		slot0.singleItemOwnLabelTF = slot0:findTF("icon_bg/own/label", slot0.singleItemTF)

		onButton(slot0, slot0:findTF("window/button_container/cancel_btn", slot0.singleBoxTF), function ()
			slot0:closeSingleBox()
		end, SFX_CANCEL)
		onButton(slot0, slot0.singleBoxTF, function ()
			slot0:closeSingleBox()
		end, SFX_CANCEL)
		onButton(slot0, slot0:findTF("window/top/btnBack", slot0.singleBoxTF), function ()
			slot0:closeSingleBox()
		end, SFX_CANCEL)
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.singleBoxTF)
	onButton(slot0, slot0:findTF("window/button_container/confirm_btn", slot0.singleBoxTF), function ()
		slot0:purchase(slot0, 1)
		slot0.purchase:closeSingleBox()
	end, SFX_CANCEL)
	updateDrop(slot0.singleItemTF, slot2)

	slot7, slot7 = GetOwnedpropCount(slot2)

	setActive(slot0.singleItemOwnTF.parent, slot4)
	setText(slot0.singleItemOwnTF, slot3)
	setText(slot0.singleItemOwnLabelTF, i18n("word_own1"))

	slot0.singleDescTF.text = slot2.desc
	slot0.singleNameTF.text = slot2.cfg.name

	setActive(slot0.singleBoxTF, true)
end

function slot0.closeSingleBox(slot0)
	if slot0.singleBoxTF then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.singleBoxTF, slot0._tf)
		setActive(slot0.singleBoxTF, false)
	end
end

function slot0.purchase(slot0, slot1, slot2)
	if not slot1:canPurchase() then
		pg.TipsMgr:GetInstance():ShowTips(i18n("buy_countLimit"))

		return
	end

	slot3, slot4 = getPlayerOwn(slot1:getConfig("resource_category"), slot1:getConfig("resource_type"))

	if slot4 < slot1:getConfig("resource_num") * slot2 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_x", slot3))

		return
	end

	if slot0.curPage == slot0.TYPE_ACTIVITY then
		slot0:emit(ShopsMediator.ACTIVITY_OPERATION, slot0.currActivityShop.activityId, 1, slot1.id, slot2)
	elseif slot0.curPage == slot0.TYPE_SHAM_SHOP then
		slot0:emit(ShopsMediator.BUY_SHAM_ITEM, slot1.id, slot2)
	elseif slot0.curPage == slot0.TYPE_ESCORT_SHOP then
		slot0:emit(ShopsMediator.BUY_ESCORT_ITEM, slot1.id, slot2)
	end
end

function slot0.initMsgBox(slot0, slot1)
	slot2 = {
		id = slot1:getConfig("commodity_id"),
		type = slot1:getConfig("commodity_type"),
		count = slot1:getConfig("num")
	}
	slot3, slot4 = getPlayerOwn(slot1:getConfig("resource_category"), slot1:getConfig("resource_type"))
	slot5 = math.max(math.floor(slot4 / slot1:getConfig("resource_num")), 1)

	if slot1:getConfig("num_limit") ~= 0 then
		slot5 = math.min(slot5, slot1:getConfig("num_limit") - slot1.buyCount)
	end

	function slot6(slot0)
		math.min(math.max(slot0, 1), ).countTF.text = math.min(math.max(slot0, 1), )
		math.min(math.max(slot0, 1), ).countTF.curCount = math.min(math.max(slot0, 1), )
		math.min(math.max(slot0, 1), ).countTF.itemCountTF.text = math.min(math.max(slot0, 1), ) * math.max(slot0, 1):getConfig("num")
	end

	if not slot0.msgBoxTF then
		slot0.msgBoxTF = slot0:findTF("msgbox")
		slot0.topItem = slot0:findTF("equipment/info/equip", slot0.msgBoxTF)
		slot0.bottomItem = slot0:findTF("destroy/got/list/item", slot0.msgBoxTF)
		slot0.bottomNameTF = slot0:findTF("destroy/got/list/item/name", slot0.msgBoxTF):GetComponent(typeof(Text))
		slot0.maxBtn = slot0:findTF("destroy/max", slot0.msgBoxTF)
		slot0.leftBtn = slot0:findTF("destroy/left", slot0.msgBoxTF)
		slot0.rightBtn = slot0:findTF("destroy/right", slot0.msgBoxTF)
		slot0.nameTF = slot0:findTF("equipment/info/name", slot0.msgBoxTF):GetComponent(typeof(Text))
		slot0.descTF = slot0:findTF("equipment/info/desc", slot0.msgBoxTF):GetComponent(typeof(Text))
		slot0.itemCountTF = slot0:findTF("icon_bg/count", slot0.bottomItem):GetComponent(typeof(Text))
		slot0.countTF = slot0:findTF("destroy/value", slot0.msgBoxTF):GetComponent(typeof(Text))
		slot0.ownerTF = slot0:findTF("equipment/info/equip/icon_bg/own/Text", slot0.msgBoxTF)
		slot0.ownerLabelTF = slot0:findTF("equipment/info/equip/icon_bg/own/label", slot0.msgBoxTF)

		onButton(slot0, slot0:findTF("actions/cancel_button", slot0.msgBoxTF), function ()
			slot0:closeActivityMsg()
		end, SFX_PANEL)
		onButton(slot0, slot0.msgBoxTF, function ()
			slot0:closeActivityMsg()
		end, SFX_PANEL)
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.msgBoxTF)
	onButton(slot0, slot0:findTF("actions/destroy_button", slot0.msgBoxTF), function ()
		slot0:purchase(slot0, slot0.curCount)
		slot0.purchase:closeActivityMsg()
	end, SFX_PANEL)
	pressPersistTrigger(slot0.leftBtn, slot7, function ()
		slot0(slot1.curCount - 1)
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(slot0.rightBtn, slot7, function ()
		slot0(slot1.curCount + 1)
	end, nil, true, true, 0.1, SFX_PANEL)
	onButton(slot0, slot0.maxBtn, function ()
		slot0(slot1)
	end)
	slot6(1)
	setActive(slot0.msgBoxTF, true)
	updateDrop(slot0.topItem, slot2)
	updateDrop(slot0.bottomItem, slot2)

	slot12, slot12 = GetOwnedpropCount(slot2)

	setActive(slot0.ownerTF.parent, slot9)
	setText(slot0.ownerTF, slot8)
	setText(slot0.ownerLabelTF, i18n("word_own1"))

	slot0.bottomNameTF.text = slot2.cfg.name
	slot0.nameTF.text = slot2.cfg.name
	slot0.descTF.text = slot2.desc
end

function slot0.closeActivityMsg(slot0)
	if slot0.msgBoxTF then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.msgBoxTF, slot0._tf)
		setActive(slot0.msgBoxTF, false)
	end
end

function slot0.updateGuildRes(slot0)
	if not IsNil(slot0.guildResTxt) then
		slot0.guildResTxt.text = slot0.player.guildCoin
	end
end

function slot0.initGuildShop(slot0)
	if not slot0.guildShop or slot0.isInitGuildShop then
		return
	end

	slot0.isInitGuildShop = true
	slot0.guildGoodsContain = slot0:findTF("frame/guild_shop/scrollView/view")
	slot0.guildTimerTxt = slot0:findTF("frame/guild_shop/timer_bg/Text"):GetComponent(typeof(Text))
	slot0.guildResTxt = slot0:findTF("frame/top/res_guild/bg/Text"):GetComponent(typeof(Text))

	slot0:resetGuildCards()
	slot0:updateGuildRes()
	onButton(slot0, slot0:findTF("frame/guild_shop/refresh_btn"), function ()
		if not ShoppingStreet.getRiseShopId(ShopArgs.guildShopFlash, slot0.guildShop.refreshCount) then
			return
		end

		slot0:emit(ShopsMediator.BUY_ITEM, slot0, 1)
	end, SFX_PANEL)
end

function slot0.addGuidTimer(slot0)
	if not slot0.isInitGuildShop then
		return
	end

	if slot0.guildTimer then
		slot0.guildTimer:Stop()

		slot0.guildTimer = nil
	end

	slot0.guildTimer = Timer.New(function ()
		if slot0.guildShop.nextRefreshTime - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
			slot0.guildTimerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
		else
			slot0.guildTimerTxt.text = ""

			slot0.guildTimer:Stop()

			slot0.guildTimer = nil
		end
	end, 1, -1)

	slot0.guildTimer:Start()
	slot0.guildTimer.func()
end

function slot0.closeMsgBox(slot0)
	if pg.MsgboxMgr:GetInstance()._go.activeSelf then
		slot1:hide()
	end
end

function slot0.initGuildGoodsCards(slot0)
	if not slot0.isInitGuildShop then
		return
	end

	slot0.guildShopCards = {}

	for slot7 = slot0.guildGoodsContain.childCount + 1, #slot0.guildShop:getSortGoods(), 1 do
		cloneTplTo(slot0.goodTF, slot0.guildGoodsContain)
	end

	for slot7 = 1, slot0.guildGoodsContain.childCount, 1 do
		setActive(slot0.guildGoodsContain:GetChild(slot7 - 1), slot7 <= slot3)

		if slot7 <= slot3 then
			slot10 = GoodsCard.New(slot8)

			table.insert(slot0.cards, slot10)
			slot10:update(slot9)
			onButton(slot0, slot10.tr, function ()
				pg.MsgboxMgr.GetInstance():showSingleItemBox({
					showOwned = true,
					hideLine = true,
					yesText = "text_buy",
					drop = {
						id = slot0:getConfig("effect_args")[1],
						type = slot0:getConfig("type")
					},
					onYes = function ()
						if not slot0:canPurchase() then
							pg.TipsMgr:GetInstance():ShowTips(i18n("buy_countLimit"))

							return
						end

						slot1:emit(ShopsMediator.BUY_ITEM, slot0.id, 1)
					end
				})
			end, SFX_PANEL)

			slot0.guildShopCards[slot1[slot7].id] = slot10
		end
	end
end

function slot0.updateGuildCard(slot0)
	if not slot0.isInitGuildShop then
		return
	end

	for slot4, slot5 in pairs(slot0.guildShopCards) do
		if slot0.guildShop:getGoodsById(slot4) then
			slot5:update(slot6)
		end
	end
end

function slot0.resetGuildCards(slot0)
	slot0:initGuildGoodsCards()
	slot0:addGuidTimer()
end

function slot0.updateShamShop(slot0)
	if not slot0.shamItemList then
		slot0.shamItemList = UIItemList.New(slot0:findTF("frame/sham_shop/scrollView/view"), slot0.goodActivityTF)
	end

	slot0.shamItemList:make(function (slot0, slot1, slot2)
		slot3 = ActivityGoodsCard.New(slot2)

		slot3:update(slot4)
		onButton(slot1, slot3.tr, function ()
			if slot0:getConfig("num_limit") == 1 or slot0:getConfig("commodity_type") == 4 then
				slot1:openSingleBox(slot1.openSingleBox)
			else
				slot1:initMsgBox(slot1.initMsgBox)
			end
		end, SFX_PANEL)
	end)
	slot0.shamItemList:align(#slot0.shamShop:getSortGoods())
	setText(slot0:findTF("frame/sham_shop/time/day"), slot0.shamShop:getRestDays())
end

function slot0.updateShamRes(slot0)
	setText(slot0:findTF("frame/top/res_nano/bg/Text"), getProxy(BagProxy).getItemCountById(slot1, ChapterConst.ShamMoneyItem))
end

function slot0.updateEscortShop(slot0)
	if not slot0.escortItemList then
		slot0.escortItemList = UIItemList.New(slot0:findTF("frame/escort_shop/scrollView/view"), slot0.goodActivityTF)
	end

	slot0.escortItemList:make(function (slot0, slot1, slot2)
		slot3 = ActivityGoodsCard.New(slot2)

		slot3:update(slot4)
		onButton(slot1, slot3.tr, function ()
			if slot0:getConfig("num_limit") == 1 or slot0:getConfig("commodity_type") == 4 then
				slot1:openSingleBox(slot1.openSingleBox)
			else
				slot1:initMsgBox(slot1.initMsgBox)
			end
		end, SFX_PANEL)
	end)
	slot0.escortItemList:align(#slot0.escortShop:getSortGoods())
	setText(slot0:findTF("frame/escort_shop/time/day"), slot0.escortShop:getRestDays())
end

function slot0.updateEscortRes(slot0)
	setText(slot0:findTF("frame/top/res_nano/bg/Text"), getProxy(BagProxy).getItemCountById(slot1, ChapterConst.EscortMoneyItem))
end

function slot0.willExit(slot0)
	for slot4, slot5 in ipairs(slot0.cards) do
		slot5:dispose()
	end

	slot1 = ipairs
	slot2 = slot0.activityCards or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:dispose()
	end

	if slot0.refreshTimer then
		slot0.refreshTimer:Stop()

		slot0.refreshTimer = nil
	end

	if slot0.shopStreetTimer then
		slot0.shopStreetTimer:Stop()

		slot0.shopStreetTimer = nil
	end

	if slot0.guildTimer then
		slot0.guildTimer:Stop()

		slot0.guildTimer = nil
	end

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end

	if slot0.tweens then
		cancelTweens(slot0.tweens)

		slot0.tweens = nil
	end

	slot0:closeSingleBox()
	slot0:closeActivityMsg()
end

return slot0
