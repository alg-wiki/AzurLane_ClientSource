slot0 = class("LoginScene", import("..base.BaseUI"))
slot1 = 1

function slot0.getUIName(slot0)
	return "LoginUI2"
end

function slot0.getBGM(slot0)
	return slot0:getSpecialDate(4) or "login"
end

function slot0.preload(slot0, slot1)
	slot0.iconSpries = {}

	ResourceMgr.Inst:loadAssetBundleAsync("ui/LoginUI2_atlas", function (slot0)
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_green", nil, true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_gray", nil, true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_red", nil, true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_org", nil, true, false))

		if table.insert then
			slot1()
		end
	end)
end

function slot0.init(slot0)
	slot0.version = slot0:findTF("version")
	slot0.version:GetComponent("Text").text = "ver " .. UpdateMgr.Inst.currentVersion:ToString()
	slot0.bgLay = slot0:findTF("bg_lay")
	slot0.accountBtn = slot0:findTF("bg_lay/buttons/account_button")
	slot0.pressToLogin = slot0:findTF("background/press_to_login")

	LeanTween.alpha(rtf(slot0.pressToLogin), 0.25, slot0):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

	slot0.currentServer = slot0:findTF("current_server")
	slot0.changeServerButton = slot0:findTF("change_button", slot0.currentServer)
	slot0.loginPanel = slot0:findTF("login_panel")
	slot0.loginUsername = slot0:findTF("username", slot0.loginPanel)
	slot0.loginPassword = slot0:findTF("password", slot0.loginPanel)
	slot0.loginButton = slot0:findTF("login_button", slot0.loginPanel)
	slot0.registerButton = slot0:findTF("register_button", slot0.loginPanel)
	slot0.forgetButton = slot0:findTF("forget_button", slot0.loginPanel)
	slot0.registerPanel = slot0:findTF("register_panel")
	slot0.registerUsername = slot0:findTF("username", slot0.registerPanel)
	slot0.registerPassword = slot0:findTF("password", slot0.registerPanel)
	slot0.registerPassword2 = slot0:findTF("password2", slot0.registerPanel)
	slot0.registerEmail = slot0:findTF("email", slot0.registerPanel)
	slot0.cancelButton = slot0:findTF("cancel_button", slot0.registerPanel)
	slot0.confirmButton = slot0:findTF("confirm_button", slot0.registerPanel)
	slot0.serversPanel = slot0:findTF("servers")
	slot0.servers = slot0:findTF("panel/servers/content/server_list", slot0.serversPanel)
	slot0.serverTpl = slot0:getTpl("server_tpl")
	slot0.recentTF = slot0:findTF("panel/servers/content/advice_panel/recent", slot0.serversPanel)
	slot0.adviceTF = slot0:findTF("panel/servers/content/advice_panel/advice", slot0.serversPanel)
	slot0.tencentPanel = slot0:findTF("tencent_login_panel")
	slot0.wxLoginBtn = slot0:findTF("wx_login", slot0.tencentPanel)
	slot0.qqLoginBtn = slot0:findTF("qq_login", slot0.tencentPanel)
	slot0.airijpPanel = slot0:findTF("airijp_login_panel")
	slot0.airiLoginBtn = slot0:findTF("airi_login", slot0.airijpPanel)
	slot0.clearTranscodeBtn = slot0:findTF("clear_transcode", slot0.airijpPanel)

	setActive(slot0.clearTranscodeBtn, not LOCK_CLEAR_ACCOUNT)

	slot0.twitterLoginBtn = slot0:findTF("twitter_login", slot0.airijpPanel)
	slot0.facebookLoginBtn = slot0:findTF("facebook_login", slot0.airijpPanel)
	slot0.yostarLoginBtn = slot0:findTF("yostar_login", slot0.airijpPanel)

	setActive(slot0.yostarLoginBtn, CSharpVersion > 24)

	slot0.airiUidTxt = slot0:findTF("airi_uid")
	slot0.transcodeAlert = slot0:findTF("transcode_alert")
	slot0.tcSureBtn = slot0:findTF("transcode_sure", slot0.transcodeAlert)
	slot0.uidTxt = slot0:findTF("uid_input_txt", slot0.transcodeAlert):GetComponent(typeof(InputField))
	slot0.transcodeTxt = slot0:findTF("transcode_input_txt", slot0.transcodeAlert):GetComponent(typeof(InputField))
	slot0.tcDesc = slot0:findTF("desc", slot0.transcodeAlert)

	setText(slot0.tcDesc, i18n("transcode_desc"))

	slot0.yostarAlert = slot0:findTF("yostar_alert")
	slot0.yostarEmailTxt = slot0:findTF("email_input_txt", slot0.yostarAlert)
	slot0.yostarCodeTxt = slot0:findTF("code_input_txt", slot0.yostarAlert)
	slot0.yostarGenCodeBtn = slot0:findTF("gen_code_btn", slot0.yostarAlert)
	slot0.yostarSureBtn = slot0:findTF("login_btn", slot0.yostarAlert)
	slot0.channelBtn = slot0:findTF("bg_lay/buttons/channel_button")
	slot0.serviceBtn = slot0:findTF("bg_lay/buttons/service_button")
	slot0.channelPanel = slot0:findTF("channel_panel")

	setActive(slot0.channelPanel, false)

	slot0.filingBtn = slot0:findTF("filingBtn")
	slot0._bg = slot0:findTF("background"):GetComponent(typeof(Image))
	slot0.userAgreenTF = slot0:findTF("UserAgreement")
	slot0.userAgreenMainTF = slot0:findTF("UserAgreement/main")
	slot0.closeUserAgreenTF = slot0.userAgreenTF:Find("main/top/btnBack")
	slot0.userAgreenConfirmTF = slot0:findTF("UserAgreement/main/accept_btn")

	setActive(slot0.userAgreenTF, false)
	slot0:switchToServer()

	slot1 = slot0:getSpecialDate(3)

	slot0:setBg()

	if CRI_BG_FLAG or slot1 then
		slot0:setCriBg()
	end
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.channelPanel) then
		slot0:closeChannelPanel()

		return
	end

	if isActive(slot0.serversPanel) then
		setActive(slot0.serversPanel, false)

		return
	end

	if isActive(slot0.userAgreenTF) then
		setActive(slot0.userAgreenTF, false)

		return
	end

	BilibiliSdkMgr.inst:onBackPressed()
end

function slot0.showUserAgreement(slot0, slot1)
	slot2 = nil

	setActive(slot0.userAgreenTF, true)
	setActive(slot0.currentServer, false)
	setActive(slot0.airijpPanel, true)
	setText(slot0.userAgreenTF:Find("main/container/scrollrect/content/Text"), require("ShareCfg.UserAgreement").content)
	onButton(slot0, slot0.userAgreenConfirmTF, function ()
		setActive(slot0.userAgreenTF, false)

		if slot0.userAgreenTF then
			slot1()

			if isAiriUS() then
				AiriLogin()
				pg.UIMgr.GetInstance():LoadingOn()
			end
		end
	end)
end

function slot0.getSpecialDate(slot0, slot1)
	slot2 = pg.TimeMgr.GetInstance():ServerTimeDesc("%Y%m%d")

	for slot6, slot7 in ipairs(SPECIAL_DATE) do
		if slot7[1] == slot2 then
			return slot7[slot1 or 2]
		end
	end

	return nil
end

function slot0.setBg(slot0)
	slot1 = "login"

	if slot0:getSpecialDate() then
		slot1 = slot2
	end

	setImageSprite(slot0._bg, LoadSprite("loadingbg/" .. slot1), false)
end

function slot0.setCriBg(slot0)
	slot1 = "loginbg"

	if slot0:getSpecialDate(3) then
		slot1 = slot2
	end

	PoolMgr.GetInstance():GetPrefab("effect/" .. slot1, slot1, true, function (slot0)
		if slot0 and not slot0.exited then
			slot0._paintingFX = {
				name = paintingFX,
				obj = slot0
			}

			slot0.transform.SetParent(slot1, slot0._bg.transform, true)
			slot0.transform.SetAsFirstSibling(slot1)

			slot0.transform.localScale = Vector3.one
			slot0.transform.localPosition = Vector3.New(640, 360, 0)
		end
	end)
end

function slot0.setUserData(slot0, slot1)
	setActive(slot0.airiUidTxt, true)
	setText(slot0.airiUidTxt, "uid: " .. slot1.arg2)
end

function slot0.setLastLogin(slot0, slot1)
	slot0.lastLoginUser = slot1
end

function slot0.setAutoLogin(slot0)
	slot0.autoLoginEnabled = true
end

function slot0.setLastLoginServer(slot0, slot1)
	if not slot1 then
		return
	end

	setText(findTF(slot0.changeServerButton, "server_name"), slot1.name)

	slot0.lastLoginServer = slot1
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.closeUserAgreenTF, function ()
		setActive(slot0.userAgreenTF, false)
	end, SFX_CANCEL)
	onButton(slot0, slot0.loginButton, function ()
		if slot0.autoLoginEnabled and slot0.lastLoginUser then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot0.lastLoginUser)

			return
		end

		if getInputText(slot0.loginUsername) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noUserName"))
			ActivateInputField(slot0.loginUsername)

			return
		end

		if getInputText(slot0.loginPassword) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noPassword"))
			ActivateInputField(slot0.loginPassword)

			return
		end

		if User.New({
			type = 2,
			arg1 = slot0,
			arg2 = slot1
		}) then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot2)
		end
	end, SFX_CONFIRM)
	onButton(slot0, findTF(slot0.channelPanel, "frame/bg/cancel_btn"), function ()
		slot0:closeChannelPanel()
	end, SFX_PANEL)
	onButton(slot0, findTF(slot0.channelPanel, "frame/top/btnBack"), function ()
		slot0:closeChannelPanel()
	end, SFX_CANCEL)
	onButton(slot0, findTF(slot0.channelPanel, "frame/bg/confirm_btn/selected"), function ()
		DOMAIN_LOGIN = slot0.channel

		slot0.channel:closeChannelPanel()
	end, SFX_CONFIRM)

	slot1 = slot0:findTF("frame/bg/channels/content/", slot0.channelPanel)
	slot0.channel = nil

	for slot5 = 1, 4, 1 do
		onToggle(slot0, slot1:Find("channel_" .. slot5), function (slot0)
			if slot0 then
				slot0.channel = _G["DOMAIN_LOGIN_" .. slot0]
			end
		end, SFX_PANEL)
	end

	triggerToggle(slot1:Find("channel_3"), true)
	onButton(slot0, slot0.forgetButton, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("word_systemClose"))
	end, SFX_MAIN)
	onButton(slot0, slot0.registerButton, function ()
		setInputText(slot0.registerPassword, "")
		setInputText(slot0.registerPassword2, "")
		setInputText:switchToRegister()
	end, SFX_MAIN)
	onButton(slot0, slot0.confirmButton, function ()
		if getInputText(slot0.registerUsername) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noUserName"))
			ActivateInputField(slot0.registerUsername)

			return
		end

		if getInputText(slot0.registerPassword) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noPassword"))
			ActivateInputField(slot0.registerPassword)

			return
		end

		if getInputText(slot0.registerPassword2) ~= slot1 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_diffPassword"))
			ActivateInputField(slot0.registerPassword2)

			return
		end

		if getInputText(slot0.registerEmail) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noMailBox"))
			ActivateInputField(slot0.registerEmail)

			return
		end

		if User.New({
			type = 2,
			arg1 = slot0,
			arg2 = slot1,
			arg3 = slot3
		}) then
			slot0.event:emit(LoginMediator.ON_REGISTER, slot4)
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0.channelBtn, function ()
		slot0:openChannelPanel()
	end, SFX_MAIN)
	onButton(slot0, slot0.serviceBtn, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("word_systemClose"))
	end, SFX_MAIN)
	onButton(slot0, slot0.cancelButton, function ()
		slot0:switchToLogin()
	end, SFX_CANCEL)
	onButton(slot0, slot0.accountBtn, function ()
		slot0:switchToLogin()
	end, SFX_MAIN)

	function slot2()
		if isPlatform() then
			if not isTencent() then
				if isAiriUS() then
					AiriLogin()
				else
					BilibiliSdkMgr.inst:login(0)
				end
			else
				slot0:switchToTencentLogin()
			end
		else
			slot0:switchToLogin()
		end
	end

	onButton(slot0, slot0.filingBtn, function ()
		Application.OpenURL("http://sq.ccm.gov.cn:80/ccnt/sczr/service/business/emark/gameNetTag/4028c08b58bd467b0158bd8bd80d062a")
	end, SFX_PANEL)
	onButton(slot0, slot0.changeServerButton, function ()
		if slot0(slot0.serverList or {}) == 0 then
			slot1()
		else
			setActive(slot0.serversPanel, true)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.serversPanel, function ()
		setActive(slot0.serversPanel, false)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("background"), function ()
		if go(slot0.pressToLogin).activeSelf then
			if slot0(slot0.serverList or {}) == 0 then
				slot1()

				return
			end

			if not slot0.lastLoginServer then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_choiseServer"))

				return
			end

			if slot0.lastLoginServer.status == Server.STATUS.VINDICATE or slot0.lastLoginServer.status == Server.STATUS.FULL then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_server_disabled"))

				return
			end

			slot0.event:emit(LoginMediator.ON_SERVER, slot0.lastLoginServer)
			playSoundEffect(SFX_CONFIRM)
		end
	end)
	onInputChanged(slot0, slot0.loginUsername, function ()
		slot0.autoLoginEnabled = false
	end)
	onInputChanged(slot0, slot0.loginPassword, function ()
		slot0.autoLoginEnabled = false
	end)
	onButton(slot0, slot0.qqLoginBtn, function ()
		BilibiliSdkMgr.inst:login(1)
	end)
	onButton(slot0, slot0.wxLoginBtn, function ()
		BilibiliSdkMgr.inst:login(2)
	end)
	onButton(slot0, slot0.airiLoginBtn, function ()
		playSoundEffect(SFX_CONFIRM)

		if not getProxy(SettingsProxy):getUserAgreement() then
			slot0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
		else
			AiriLogin()
			pg.UIMgr.GetInstance():LoadingOn()
		end
	end)
	onButton(slot0, slot0.clearTranscodeBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("clear_transcode_cache_confirm"),
			onYes = function ()
				ClearAccountCache()

				slot0 = getProxy(SettingsProxy)

				slot0:deleteUserAreement()
				slot0:clearAllReadHelp()
				slot0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
				pg.TipsMgr:GetInstance():ShowTips(i18n("clear_transcode_cache_success"))
			end,
			onNo = function ()
				return
			end
		})
	end)
	onButton(slot0, slot0.twitterLoginBtn, function ()
		LoginWithSocial(AIRI_PLATFORM_TWITTER)
	end)
	onButton(slot0, slot0.facebookLoginBtn, function ()
		LoginWithSocial(AIRI_PLATFORM_FACEBOOK)
	end)
	onButton(slot0, slot0.tcSureBtn, function ()
		slot1 = slot0.transcodeTxt.text

		if slot0.uidTxt.text == "" or slot1 == "" then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("transcode_empty_tip")
			})
		else
			LoginWithTranscode(slot0, slot1)
			pg.UIMgr:GetInstance():LoadingOn()
		end
	end)
	onButton(slot0, slot0.transcodeAlert, function ()
		setActive(slot0.transcodeAlert, false)
	end)
	onButton(slot0, slot0.yostarLoginBtn, function ()
		setActive(slot0.yostarAlert, true)
	end)
	onButton(slot0, slot0.yostarAlert, function ()
		setActive(slot0.yostarAlert, false)
	end)
	onButton(slot0, slot0.yostarGenCodeBtn, function ()
		if getInputText(slot0.yostarEmailTxt) ~= "" then
			VerificationCodeReq(slot0)
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("verification_code_req_tip1"))
		end
	end)
	onButton(slot0, slot0.yostarSureBtn, function ()
		LoginWithSocial(AIRI_PLATFORM_YOSTAR, getInputText(slot0.yostarEmailTxt), getInputText(slot0.yostarCodeTxt))
	end)
	slot0:playExtraVoice()
	slot0:checkVersion()
end

function slot0.checkVersion(slot0)
	if PathMgr.FileExists(PathMgr.getStreamAssetsPath() .. "/" .. "version.txt") and PathMgr.FileExists(PathMgr.getStreamAssetsPath() .. "/" .. "hashes.csv") and System.Version.New(PathMgr.ReadAllText(PathMgr.getStreamingAsset("version.txt"))).CompareTo(slot1, UpdateMgr.Inst.serverVersion) < 0 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = "当前游戏不是最新版本，请重启游戏进行更新",
			onYes = function ()
				Application.Quit()
			end
		})
	end
end

function slot0.playExtraVoice(slot0)
	if pg.gameset.login_extra_voice.description and #slot1 > 0 then
		pg.CriMgr.GetInstance():LoadCueSheet("cv-" .. slot3, function ()
			if slot0.exited then
				slot1:UnloadCueSheet(slot2)

				return
			end

			slot0.loginCueSheet = slot2

			slot2:PlayCV(slot2, "extra")
		end)
	end
end

function slot0.unloadExtraVoice(slot0)
	if slot0.loginCueSheet then
		pg.CriMgr.GetInstance():UnloadCueSheet(slot0.loginCueSheet)

		slot0.loginCueSheet = nil
	end
end

function slot0.autoLogin(slot0)
	if slot0.lastLoginUser then
		if slot0.autoLoginEnabled then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot0.lastLoginUser)
		end

		if slot0.lastLoginUser.type == 1 then
			setInputText(slot0.loginUsername, slot0.lastLoginUser.arg2)
			setInputText(slot0.loginPassword, slot0.lastLoginUser.arg3)
		elseif slot0.lastLoginUser.type == 2 then
			setInputText(slot0.loginUsername, slot0.lastLoginUser.arg1)
			setInputText(slot0.loginPassword, slot0.lastLoginUser.arg2)
		end
	end
end

slot2 = {
	i18n("word_serverLoadNormal"),
	i18n("word_serverLoadVindicate"),
	i18n("word_serverLoadFull"),
	i18n("word_registerFull")
}

function slot0.updateServerTF(slot0, slot1, slot2)
	setText(findTF(slot1, "name"), slot2.name)
	setImageSprite(findTF(slot1, "statu"), slot0.iconSpries[slot2.status + 1], true)
	setActive(findTF(slot1, "mark"), slot2.isLogined)
	setActive(slot0:findTF("tag_new", slot1), slot2.isNew)
	setActive(slot0:findTF("tag_hot", slot1), slot2.isHot)
	onButton(slot0, slot1, function ()
		if slot0.status == Server.STATUS.VINDICATE then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_server_vindicate"))

			return
		end

		if slot0.status == Server.STATUS.FULL then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_server_full"))

			return
		end

		slot1:setLastLoginServer(slot1.setLastLoginServer)
		setActive(slot1.serversPanel, false)
	end, SFX_CONFIRM)
end

function slot0.updateAdviceServer(slot0)
	if not slot0.recentTF or not slot0.adviceTF then
		return
	end

	setActive(slot0.recentTF, slot0.lastLoginServer)

	if slot0.lastLoginServer then
		slot0:updateServerTF(findTF(slot0.recentTF, "server"), slot0.lastLoginServer)
	end

	setActive(slot0.adviceTF, getProxy(ServerProxy).firstServer)

	if getProxy(ServerProxy).firstServer then
		slot0:updateServerTF(findTF(slot0.adviceTF, "server"), slot1)
	end
end

function slot0.updateServerList(slot0, slot1)
	slot0.serverList = slot1

	removeAllChildren(slot0.servers)

	for slot6, slot7 in pairs(slot2) do
		slot0:updateServerTF(cloneTplTo(slot0.serverTpl, slot0.servers), slot7)
	end
end

function slot0.openChannelPanel(slot0)
	setActive(slot0.channelPanel, true)
end

function slot0.closeChannelPanel(slot0)
	setActive(slot0.channelPanel, false)
end

function slot0.switchToTencentLogin(slot0)
	setActive(slot0.tencentPanel, true)
	setActive(slot0.accountBtn, false)
	setActive(slot0.pressToLogin, false)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, false)
	setActive(slot0.serversPanel, false)
	setActive(slot0.airijpPanel, false)
	setActive(slot0.transcodeAlert, false)
end

function slot0.switchToAiriJPLogin(slot0)
	setActive(slot0.bgLay, false)
	setActive(slot0.airiUidTxt, false)
	setActive(slot0.airijpPanel, true)
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, false)
	setActive(slot0.pressToLogin, true)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, false)
	setActive(slot0.serversPanel, false)
	setActive(slot0.transcodeAlert, false)
end

function slot0.switchToLogin(slot0)
	setActive(slot0.bgLay, false)
	setActive(slot0.channelBtn, false)
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, false)
	setActive(slot0.pressToLogin, false)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, true)
	setActive(slot0.registerPanel, false)
	setActive(slot0.serversPanel, false)
	setActive(slot0.airijpPanel, false)
	setActive(slot0.transcodeAlert, false)
end

function slot0.switchToRegister(slot0)
	setActive(slot0.bgLay, false)
	setActive(slot0.channelBtn, false)
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, false)
	setActive(slot0.pressToLogin, false)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, true)
	setActive(slot0.serversPanel, false)
	setActive(slot0.airijpPanel, false)
	setActive(slot0.transcodeAlert, false)
end

function slot0.switchToServer(slot0)
	setActive(slot0.bgLay, true)
	setActive(slot0.channelBtn, false)
	slot0:updateAdviceServer()
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, not isPlatform())
	setActive(slot0.pressToLogin, true)
	setActive(slot0.currentServer, true)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, false)
	setActive(slot0.serversPanel, false)
	setActive(slot0.airijpPanel, false)
	setActive(slot0.transcodeAlert, false)
	setActive(slot0.yostarAlert, false)
end

function slot0.SwitchToWaitPanel(slot0, slot1)
	slot3 = slot0:findTF("window/content", slot2)
	slot0.waitTimer = nil
	slot4 = 0
	slot5 = slot1
	slot0.waitTimer = Timer.New(function ()
		setText(setText, i18n("login_wait_tip", setText))

		slot2 = slot2 - 1

		if math.random(0, 1) == 1 then
			slot1 = slot2
		end

		if slot2 <= 0 then
			triggerButton(slot3:findTF("background"))
			slot3.waitTimer:Stop()

			"background".waitTimer = nil
		end
	end, 1, -1)

	slot0.waitTimer:Start()
	slot0.waitTimer.func()
	setActive(slot0:findTF("Msgbox"), true)
end

function slot0.willExit(slot0)
	if slot0.waitTimer then
		slot0.waitTimer:Stop()

		slot0.waitTimer = nil
	end
end

return slot0
