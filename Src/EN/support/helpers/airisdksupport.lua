AIRI_PLATFORM_FACEBOOK = "facebook"
AIRI_PLATFORM_TWITTER = "twitter"
AIRI_PLATFORM_YOSTAR = "yostar"

function AiriInit()
	pg.UIMgr:GetInstance():LoadingOn()
	AiriSdkMgr.inst:InitSdk()
	print("AiriSdk Version:" .. AiriSdkMgr.AiriSdkDataInst.AiriSDK_VERSION)
	print("CSharpVersion:" .. tostring(CSharpVersion))
end

function AiriLogin()
	AiriSdkMgr.inst:Login()
end

function LoginWithSocial(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		AiriSdkMgr.inst:LoginWithFB()
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		AiriSdkMgr.inst:LoginWithTW()
	end
end

function LoginWithTranscode(slot0, slot1)
	AiriSdkMgr.inst:LoginWithTranscode(slot0, slot1)
end

function TranscodeRequest()
	AiriSdkMgr.inst:TranscodeRequest()
end

function AiriBuy(slot0, slot1, slot2)
	if slot1 == "audit" then
		AiriSdkMgr.inst:NewBuy(slot0, Airisdk.BuyServerTag.audit, slot2)
	elseif slot1 == "preAudit" then
		AiriSdkMgr.inst:NewBuy(slot0, Airisdk.BuyServerTag.preAudit, slot2)
	elseif slot1 == "production" then
		AiriSdkMgr.inst:NewBuy(slot0, Airisdk.BuyServerTag.production, slot2)
	end
end

function LinkSocial(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		AiriSdkMgr.inst:LinkSocial(Airisdk.LoginPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		AiriSdkMgr.inst:LinkSocial(Airisdk.LoginPlatform.TWITTER)
	end
end

function UnlinkSocial(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		AiriSdkMgr.inst:UnlinkSocial(Airisdk.LoginPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		AiriSdkMgr.inst:UnlinkSocial(Airisdk.LoginPlatform.TWITTER)
	end
end

function IsSocialLink(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		return AiriSdkMgr.inst:CheckPlatformLink(Airisdk.LoginPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		return AiriSdkMgr.inst:CheckPlatformLink(Airisdk.LoginPlatform.TWITTER)
	elseif slot0 == AIRI_PLATFORM_YOSTAR then
		return AiriSdkMgr.inst:CheckPlatformLink(Airisdk.LoginPlatform.YOSTAR)
	end

	return false
end

function GetSocialName(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		return AiriSdkMgr.inst.loginRet.FACEBOOK_NAME
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		return AiriSdkMgr.inst.loginRet.TWITTER_NAME
	elseif slot0 == AIRI_PLATFORM_YOSTAR then
		return AiriSdkMgr.inst.loginRet.SDK_NAME
	end

	return ""
end

function ClearAccountCache()
	AiriSdkMgr.inst:ClearAccountCache()
end

function GameShare(slot0, slot1)
	AiriSdkMgr.inst:SystemShare(slot0, slot1)
end

function AiriInitResult(slot0)
	if AiriJPResultCodeHandler(slot0.R_CODE) then
		pg.UIMgr:GetInstance():LoadingOff()
		AiriGoLogin()
	end
end

function AiriGoLogin(slot0)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN, {
		loginPlatform = slot0
	})
	gcAll()
end

function AiriJPLogin(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0.R_CODE) then
		function ()
			pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
				user = User.New({
					type = 1,
					arg1 = PLATFORM_AIRIUS,
					arg2 = slot0.UID,
					arg3 = slot0.ACCESS_TOKEN
				})
			})
		end()
	else
		print("AiriLogin failed")
	end
end

function AiriTranscodeResult(slot0)
	if AiriJPResultCodeHandler(slot0.R_CODE) then
		pg.m02:sendNotification(GAME.ON_GET_TRANSCODE, {
			transcode = slot0.TRANSCODE
		})
	end
end

function AiriBuyResult(slot0)
	if AiriJPResultCodeHandler(slot0.R_CODE) then
		getProxy(ShopsProxy):removeWaitTimer()
		pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {
			payId = slot0.EXTRADATA,
			bsId = slot0.ORDERID
		})
	else
		getProxy(ShopsProxy):removeWaitTimer()
		pg.m02:sendNotification(GAME.CHARGE_FAILED, {
			payId = slot0.EXTRADATA
		})
	end
end

function SetBirthResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0.R_CODE) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("set_birth_success"))
	end
end

function LinkSocialResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0.R_CODE) then
		pg.m02:sendNotification(GAME.ON_SOCIAL_LINKED)
	end
end

function UnlinkSocialResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0.R_CODE) then
		pg.m02:sendNotification(GAME.ON_SOCIAL_UNLINKED)
	end
end

function AiriJPResultCodeHandler(slot0)
	slot2 = ":" .. slot0:ToInt()

	if slot0.ToInt() == 0 then
		return true
	elseif slot1 == 100200 then
		pg.m02:sendNotification(GAME.SERVER_USER_LOGIN_INVALIDCERT)
	else
		print("SDK Error Code:" .. slot1)

		if string.find(i18n("airi_error_code_" .. slot1), "UndefinedLanguage") then
			pg.TipsMgr:GetInstance():ShowTips(i18n("airi_error_code_other") .. slot2)
		else
			pg.TipsMgr:GetInstance():ShowTips(slot3 .. slot2)
		end
	end

	return false
end

function getDeviceId()
	return AiriSdkMgr.AiriSDKInst:GetDeviceID()
end

return