slot0 = class("AutoBotCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().isActiveBot
	slot4 = slot1.getBody().toggle

	if getProxy(ChapterProxy) and slot5:getChapterById(AUTO_ENABLE_CHAPTER):isClear() then
		BattleScene.autoBotIsAcitve = not slot3

		slot0.activeBotHelp(not slot3)
	elseif not slot3 then
		if slot4 then
			GetComponent(slot4, typeof(Toggle)).isOn = false
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_limit_tip"))
	end
end

function slot0.activeBotHelp(slot0)
	slot1 = getProxy(PlayerProxy)

	if not slot0 then
		if slot0.autoBotHelp then
			pg.MsgboxMgr.GetInstance():hide()
		end

		return
	end

	if slot1.botHelp then
		return
	end

	slot0.autoBotHelp = true

	if getProxy(SettingsProxy):isTipAutoBattle() then
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			showStopRamind = true,
			helps = i18n("help_battle_auto"),
			custom = {
				{
					text = "text_iknow",
					sound = SFX_CANCEL,
					onCallback = function ()
						if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
							getProxy(SettingsProxy):setAoutBattleTip()
						end
					end
				}
			},
			onClose = function ()
				slot0.autoBotHelp = false

				if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
					getProxy(SettingsProxy):setAoutBattleTip()
				end
			end,
			showStopRamindPos = Vector3(193, 71, 0)
		})
	end

	slot1.botHelp = true
end

return slot0
