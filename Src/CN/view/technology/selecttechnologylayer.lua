slot0 = class("SelectTechnologyLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "SelectTechnologyUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1

	if slot0._resPanel then
		slot0._resPanel:setResources(slot1)
	end
end

function slot0.init(slot0)
	pg.UIMgr:GetInstance():OverlayPanel(slot0._tf)

	slot0.bg = slot0:findTF("frame/bg")
	slot0.topPanel = slot0:findTF("frame/top")
	slot0.bluePrintBtn = slot0:findTF("blueprint_btn", slot0.bg)
	slot0.bluePrintBtnTip = slot0.bluePrintBtn:Find("tip")
	slot0.technologyBtn = slot0:findTF("technology_btn", slot0.bg)
	slot0.technologyBtnTip = slot0.technologyBtn:Find("tip")
	slot0.helpBtn = slot0:findTF("help_btn")
	slot0._playerResOb = slot0:findTF("top/playerRes")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0.backBtn = slot0:findTF("top/back")

	onButton(slot0, slot0.helpBtn, function ()
		if pg.gametip.help_technolog then
			pg.MsgboxMgr.GetInstance():ShowHelpWindow({
				helps = pg.gametip.help_technolog.tip
			})
		end
	end, SFX_PANEL)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.bluePrintBtn, function ()
		slot0:emit(SelectTechnologyMediator.ON_BLUEPRINT)
	end, SFX_PANEL)
	onButton(slot0, slot0.technologyBtn, function ()
		slot0:emit(SelectTechnologyMediator.ON_TECHNOLOGY)
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)
end

function slot0.notifyTechnology(slot0, slot1)
	setActive(slot0.technologyBtnTip, slot1)
end

function slot0.notifyBlueprint(slot0, slot1)
	setActive(slot0.bluePrintBtnTip, slot1)
end

function slot0.willExit(slot0)
	if slot0._resPanel then
		slot0._resPanel:exit()

		slot0._resPanel = nil
	end
end

return slot0
