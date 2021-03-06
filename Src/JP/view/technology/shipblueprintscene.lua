slot0 = class
slot1 = "ShipBluePrintScene"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = pg
slot1 = slot1.ship_data_blueprint
slot2 = pg
slot2 = slot2.ship_data_template
slot3 = pg
slot3 = slot3.ship_data_breakout
slot4 = 3
slot5 = -10
slot6 = 2.3

function slot7(slot0)
	slot1 = "ShipBluePrintUI"

	return slot1
end

slot0.getUIName = slot7

function slot7(slot0, slot1)
	slot0.shipVOs = slot1
end

slot0.setShipVOs = slot7

function slot7(slot0, slot1)
	slot2 = slot0.shipVOs
	slot2 = slot2[slot1]

	return slot2
end

slot0.getShipById = slot7

function slot7(slot0, slot1)
	slot0.taskVOs = slot1
end

slot0.setTaskVOs = slot7

function slot7(slot0, slot1)
	slot0.itemVOs = slot1
end

slot0.setItemVOs = slot7

function slot7(slot0, slot1)
	slot2 = slot0.taskVOs
	slot2 = slot2[slot1]

	if not slot2 then
		slot2 = Task
		slot2 = slot2.New
		slot3 = {
			id = slot1
		}
		slot2 = slot2(slot3)
	end

	return slot2
end

slot0.getTaskById = slot7

function slot7(slot0, slot1)
	slot2 = nil
	slot3 = ipairs
	slot4 = slot0.itemVOs
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.id

		if slot8 == slot1 then
			slot8 = slot7.count
			slot9 = 0

			if slot8 > slot9 then
				slot2 = slot7

				break
			end
		end
	end

	if not slot2 then
		slot3 = Item
		slot3 = slot3.New
		slot4 = {
			count = 0,
			id = slot1
		}
		slot3 = slot3(slot4)
		slot2 = slot3
	end

	return slot2
end

slot0.getItemById = slot7

function slot7(slot0, slot1)
	slot0.bluePrintByIds = slot1
end

slot0.setShipBluePrints = slot7

function slot7(slot0, slot1)
	slot2 = slot0.bluePrintByIds
	slot3 = slot1.id
	slot2[slot3] = slot1
	slot3 = slot0
	slot2 = slot0.filterBlueprints

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.setTotalCount

	slot2(slot3)
end

slot0.updateShipBluePrintVO = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/top"
	slot1 = slot1(slot2, slot3)
	slot0.topPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/top/back"
	slot1 = slot1(slot2, slot3)
	slot0.backBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/center_panel"
	slot1 = slot1(slot2, slot3)
	slot0.centerPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/left_panel"
	slot1 = slot1(slot2, slot3)
	slot0.leftPanle = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/bottom_panel"
	slot1 = slot1(slot2, slot3)
	slot0.bottomPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/right_panel"
	slot1 = slot1(slot2, slot3)
	slot0.rightPanel = slot1
	slot1 = slot0.bottomPanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "ships"
	slot1 = slot1(slot2, slot3)
	slot0.shipContainer = slot1
	slot1 = slot0.shipContainer
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "LScrollRect"
	slot1 = slot1(slot2, slot3)
	slot0.shipScorll = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "eye"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.eyeTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/center_panel/painting"
	slot1 = slot1(slot2, slot3)
	slot0.painting = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "name"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.nameTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Text"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipName = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ship_type/type"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipType = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "english_name"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.englishName = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "star_tpl"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipInfoStarTpl = slot1
	slot1 = setActive
	slot2 = slot0.shipInfoStarTpl
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "stars"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.stars = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/btns/init_toggle"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.initBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/btns/attr_toggle"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.attrBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/top/move"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.propertyMoveTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/btns/attr_toggle/disable"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.attrDisableBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.initPanel = slot1
	slot1 = PropertyPanel
	slot1 = slot1.New
	slot2 = slot0.initPanel
	slot3 = 21.5
	slot1 = slot1(slot2, slot3)
	slot0.propertyPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel/skills_rect"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillRect = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel/skills_rect/skills"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "skilltpl"
	slot4 = slot0.skillPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel/arrow1"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillArrLeft = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel/arrow2"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillArrRight = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/attr_panel"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.attrPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/attr_panel"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modAdditionPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "scroll_rect/content"
	slot4 = slot0.modAdditionPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modAdditionContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "addition_tpl"
	slot4 = slot0.modAdditionContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modAdditionTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "pre_view"
	slot4 = slot0.attrPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.preViewBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.stateInfo = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/start_btn"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.startBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/lock"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.lockBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/finished_btn"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.finishedBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/progress"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.progressPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "content"
	slot4 = slot0.progressPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.progressContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "item"
	slot4 = slot0.progressContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.progressTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/open_condition/Text"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.openConditiontxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "task_list"
	slot4 = slot0.rightPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.taskListPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "task_list/scroll/content"
	slot4 = slot0.rightPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.taskContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "task_list/task_tpl"
	slot4 = slot0.rightPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.taskTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "mod_panel"
	slot4 = slot0.rightPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/atrrs"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.attrContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/slider"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Slider
	slot1 = slot1(slot2, slot3(slot4))
	slot0.levelSlider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/slider/Text"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.levelSliderTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/pre_sider"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Slider
	slot1 = slot1(slot2, slot3(slot4))
	slot0.preLevelSlider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/level_bg/Text"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.modLevel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/calc_panel/item_bg"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.itemInfo = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "name"
	slot4 = slot0.itemInfo
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.itemInfoName = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "icon"
	slot4 = slot0.itemInfo
	slot1 = slot1(slot2, slot3, slot4)
	slot0.itemInfoIcon = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "count"
	slot4 = slot0.itemInfo
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.itemInfoCount = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/Text"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.needLevelTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/calc_panel/confirm_btn"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/calc_panel"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.calcPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "min"
	slot4 = slot0.calcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.calcMinBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "max"
	slot4 = slot0.calcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.calcMaxBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "count/Text"
	slot4 = slot0.calcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.calcTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "preview"
	slot1 = slot1(slot2, slot3)
	slot0.preViewer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "preview/frame"
	slot1 = slot1(slot2, slot3)
	slot0.preViewerFrame = slot1
	slot1 = setActive
	slot2 = slot0.preViewer
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "sea"
	slot4 = slot0.preViewerFrame
	slot1 = slot1(slot2, slot3, slot4)
	slot0.sea = slot1
	slot1 = slot0.sea
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "RawImage"
	slot1 = slot1(slot2, slot3)
	slot0.rawImage = slot1
	slot1 = setActive
	slot2 = slot0.rawImage
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bg/loading"
	slot4 = slot0.preViewerFrame
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seaLoading = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "resources/heal"
	slot1 = slot1(slot2, slot3)
	slot0.healTF = slot1
	slot1 = slot0.healTF
	slot1 = slot1.transform
	slot2 = Vector3
	slot3 = -360
	slot4 = 50
	slot5 = 40
	slot2 = slot2(slot3, slot4, slot5)
	slot1.localPosition = slot2
	slot1 = setActive
	slot2 = slot0.healTF
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "stageScrollRect/stages"
	slot4 = slot0.preViewerFrame
	slot1 = slot1(slot2, slot3, slot4)
	slot0.stages = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "content/Text"
	slot4 = slot0.preViewerFrame
	slot1 = slot1(slot2, slot3, slot4)
	slot0.breakView = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "preview/attrs_panel/attr_panel"
	slot1 = slot1(slot2, slot3)
	slot0.previewAttrPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "content"
	slot4 = slot0.previewAttrPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.previewAttrContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "helpBtn"
	slot1 = slot1(slot2, slot3)
	slot0.helpBtn = slot1
	slot1 = slot0.leftPanle
	slot1 = slot1.rect
	slot1 = slot1.width
	slot0.leftWidth = slot1
	slot1 = slot0.rightPanel
	slot1 = slot1.rect
	slot1 = slot1.width
	slot0.rightWidth = slot1
	slot1 = slot0.bottomPanel
	slot1 = slot1.rect
	slot1 = slot1.height
	slot0.bottomWidth = slot1
	slot1 = slot0.topPanel
	slot1 = slot1.rect
	slot1 = slot1.height
	slot1 = slot1 * 2
	slot0.topWidth = slot1
	slot1 = {}
	slot0.nameTxts = slot1
	slot1 = {}
	slot0.taskTFs = slot1
	slot1 = {}
	slot0.leanTweens = slot1
end

slot0.init = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.initShips

	slot1(slot2)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.backBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipBluePrintMediator
		slot2 = slot2.ON_MAIN

		slot0(slot1, slot2)
	end

	slot5 = SOUND_BACK

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.startBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.shipBluePrintVO

		if not slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.shipBluePrintVO
		slot0 = slot0.id
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ShipBluePrintMediator
		slot3 = slot3.ON_START
		slot4 = slot0

		slot1(slot2, slot3, slot4)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.finishedBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.shipBluePrintVO

		if not slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.shipBluePrintVO
		slot0 = slot0.id
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ShipBluePrintMediator
		slot3 = slot3.ON_FINISHED
		slot4 = slot0

		slot1(slot2, slot3, slot4)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.preViewBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.openPreView

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.seaLoading

	function slot4()
		slot0 = slot0
		slot0 = slot0.previewer

		if not slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showBarrage

			slot0(slot1)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.preViewer

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.closePreview

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = false
	slot0.flag = slot1
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.eyeTF

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideUI

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = true
	slot0.flag = slot1
	slot2 = slot0
	slot1 = slot0.hideUI

	slot1(slot2)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.helpBtn

	function slot4()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowHelpWindow
		slot2 = {}
		slot3 = pg
		slot3 = slot3.gametip
		slot3 = slot3.help_shipblueprintui
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot3 = slot1
	slot2 = slot1.PreparePartialMask
	slot4 = slot0.rightPanel
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "task_list"

	slot2(slot3, slot4(slot5, slot6))

	slot3 = slot1
	slot2 = slot1.PreparePartialMask
	slot4 = slot0.rightPanel
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "mod_panel"

	slot2(slot3, slot4(slot5, slot6))

	slot3 = slot1
	slot2 = slot1.PartialBlur
	slot4 = slot0.leftPanle
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "property_panel/init_panel"
	slot4 = slot4(slot5, slot6)
	slot5 = true

	slot2(slot3, slot4, slot5)

	slot3 = slot1
	slot2 = slot1.PartialBlur
	slot4 = slot0.bottomPanel
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "ships/bg"
	slot4 = slot4(slot5, slot6)
	slot5 = true

	slot2(slot3, slot4, slot5)

	slot2 = SetParent
	slot3 = slot0.leftPanle
	slot4 = pg
	slot4 = slot4.UIMgr
	slot5 = slot4
	slot4 = slot4.GetInstance
	slot4 = slot4(slot5)
	slot4 = slot4.OverlayMain

	slot2(slot3, slot4)

	slot2 = SetParent
	slot3 = slot0.rightPanel
	slot4 = pg
	slot4 = slot4.UIMgr
	slot5 = slot4
	slot4 = slot4.GetInstance
	slot4 = slot4(slot5)
	slot4 = slot4.OverlayMain

	slot2(slot3, slot4)

	slot2 = SetParent
	slot3 = slot0.bottomPanel
	slot4 = pg
	slot4 = slot4.UIMgr
	slot5 = slot4
	slot4 = slot4.GetInstance
	slot4 = slot4(slot5)
	slot4 = slot4.OverlayMain

	slot2(slot3, slot4)

	slot2 = LeanTween
	slot2 = slot2.moveX
	slot3 = slot0.propertyMoveTF
	slot4 = -83
	slot5 = 0.01

	slot2(slot3, slot4, slot5)

	slot2 = onToggle
	slot3 = slot0
	slot4 = slot0.initBtn

	function slot5(slot0)
		LeanTween.cancel(go(slot0.propertyMoveTF))
		LeanTween.moveX(slot0.propertyMoveTF, (slot0 and -83) or 83, 0.2)
	end

	slot2(slot3, slot4, slot5)

	slot2 = LeanTween
	slot2 = slot2.alpha
	slot3 = rtf
	slot4 = slot0.skillArrLeft
	slot3 = slot3(slot4)
	slot4 = 0.25
	slot5 = 1
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = slot2
	slot2 = slot2.setEase
	slot4 = LeanTweenType
	slot4 = slot4.easeInOutSine
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.setLoopPingPong

	slot2(slot3)

	slot2 = LeanTween
	slot2 = slot2.alpha
	slot3 = rtf
	slot4 = slot0.skillArrRight
	slot3 = slot3(slot4)
	slot4 = 0.25
	slot5 = 1
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = slot2
	slot2 = slot2.setEase
	slot4 = LeanTweenType
	slot4 = slot4.easeInOutSine
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.setLoopPingPong

	slot2(slot3)
end

slot0.didEnter = slot7
slot7 = 0.5

function slot8(slot0)
	slot1 = LeanTween
	slot1 = slot1.isTweening
	slot2 = go
	slot3 = slot0.leftPanle
	slot1 = slot1(slot2(slot3))

	if not slot1 then
		slot1 = LeanTween
		slot1 = slot1.isTweening
		slot2 = go
		slot3 = slot0.rightPanel
		slot1 = slot1(slot2(slot3))

		if not slot1 then
			slot1 = LeanTween
			slot1 = slot1.isTweening
			slot2 = go
			slot3 = slot0.bottomPanel
			slot1 = slot1(slot2(slot3))

			if slot1 then
				return
			end
		end
	end

	slot1 = slot0.flag
	slot1 = not slot1
	slot0.flag = slot1
	slot1 = slot0.flag

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.leftPanle
		slot3 = slot0.leftWidth
		slot3 = -slot3
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.rightPanel
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.bottomPanel
		slot3 = slot0.bottomWidth
		slot3 = -slot3
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.topPanel
		slot3 = slot0.topWidth
		slot4 = slot0

		slot1(slot2, slot3, slot4)
	else
		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.leftPanle
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.rightPanel
		slot3 = slot0.rightWidth
		slot3 = -slot3
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.bottomPanel
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.topPanel
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)
	end

	slot1 = setActive
	slot2 = slot0.nameTF
	slot3 = slot0.flag
	slot3 = not slot3

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.stateInfo
	slot3 = slot0.flag
	slot3 = not slot3

	slot1(slot2, slot3)
end

slot0.hideUI = slot8

function slot8(slot0, slot1)
	slot2 = 0.3
	slot3 = LeanTween
	slot3 = slot3.moveX
	slot4 = slot0.leftPanle
	slot5 = slot0.leftWidth
	slot5 = -slot5
	slot6 = slot2

	slot3(slot4, slot5, slot6)

	slot3 = LeanTween
	slot3 = slot3.moveX
	slot4 = slot0.rightPanel
	slot5 = 0
	slot6 = slot2

	slot3(slot4, slot5, slot6)

	slot3 = LeanTween
	slot3 = slot3.moveX
	slot4 = slot0.leftPanle
	slot5 = 0
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.setDelay
	slot5 = slot2 + 0.1

	slot3(slot4, slot5)

	slot3 = LeanTween
	slot3 = slot3.moveX
	slot4 = slot0.rightPanel
	slot5 = slot0.rightWidth
	slot5 = -slot5
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.setDelay
	slot5 = slot2 + 0.1

	slot3(slot4, slot5)

	slot3 = LeanTween
	slot3 = slot3.delayedCall
	slot4 = slot2 + 0.1
	slot5 = System
	slot5 = slot5.Action

	function slot6()
		slot0 = slot0

		if slot0 then
			slot0 = slot0

			slot0()
		end
	end

	slot3(slot4, slot5(slot6))
end

slot0.switchUI = slot8

function slot8(slot0, slot1)
	slot2 = {
		go = slot1
	}
	slot3 = tf
	slot4 = slot1
	slot3 = slot3(slot4)
	slot2.tf = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "icon"
	slot3 = slot3(slot4, slot5)
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = "Image"
	slot3 = slot3(slot4, slot5)
	slot2.iconShip = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "count"
	slot3 = slot3(slot4, slot5)
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = typeof
	slot6 = Text
	slot3 = slot3(slot4, slot5(slot6))
	slot2.countTxt = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "selected"
	slot3 = slot3(slot4, slot5)
	slot2.seleted = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "state/mask_lock"
	slot3 = slot3(slot4, slot5)
	slot2.maskLock = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "state/mask_dev"
	slot3 = slot3(slot4, slot5)
	slot2.maskDev = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "state/mask_none"
	slot3 = slot3(slot4, slot5)
	slot2.maskNone = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "tip"
	slot3 = slot3(slot4, slot5)
	slot2.tip = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "icon"
	slot3 = slot3(slot4, slot5)
	slot2.iconTF = slot3
	slot3 = slot2.tf
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = "Toggle"
	slot3 = slot3(slot4, slot5)
	slot2.toggle = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "dev_lv"
	slot3 = slot3(slot4, slot5)
	slot2.lvTF = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "dev_lv/Text"
	slot3 = slot3(slot4, slot5)
	slot2.lvTextTF = slot3

	function slot3(slot0, slot1, slot2)
		slot0.toggle.enabled = slot1.id > 0
		slot3 = slot1.id
		slot4 = 0

		if slot3 < slot4 then
			slot3 = setActive
			slot4 = slot0.maskNone
			slot5 = true

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.seleted
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.maskLock
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.maskDev
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.tip
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.lvTF
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.countTxt
			slot5 = false

			slot3(slot4, slot5)

			slot3 = LoadSpriteAsync
			slot4 = "shipdesignicon/unknow"

			function slot5(slot0)
				slot1 = slot0
				slot1 = slot1.iconShip
				slot1.sprite = slot0
			end

			slot3(slot4, slot5)
		else
			slot0.shipBluePrintVO = slot1
			slot3 = slot0.shipBluePrintVO
			slot4 = slot3
			slot3 = slot3.getShipVO
			slot3 = slot3(slot4)
			slot4 = LoadSpriteAsync
			slot5 = "shipdesignicon/"
			slot7 = slot3
			slot6 = slot3.getPainting
			slot6 = slot6(slot7)
			slot5 = slot5 .. slot6

			function slot6(slot0)
				if slot0 then
					slot1 = slot0
					slot1 = slot1.iconShip
					slot1.sprite = slot0
				end
			end

			slot4(slot5, slot6)

			slot4 = slot2.count
			slot5 = 999

			if slot4 > slot5 then
				slot4 = slot0
				slot4 = slot4.countTxt
				slot5 = "999+"
				slot4.text = slot5
			else
				slot4 = slot0
				slot4 = slot4.countTxt
				slot5 = slot2.count
				slot4.text = slot5
			end

			slot4 = setText
			slot5 = slot0.lvTextTF
			slot6 = slot0.shipBluePrintVO
			slot6 = slot6.level

			slot4(slot5, slot6)

			slot4 = setActive
			slot5 = slot0.seleted
			slot6 = false

			slot4(slot5, slot6)

			slot4 = setActive
			slot5 = slot0.countTxt
			slot6 = true

			slot4(slot5, slot6)

			slot4 = setActive
			slot5 = slot0.maskLock
			slot7 = slot1
			slot6 = slot1.isLock

			slot4(slot5, slot6(slot7))

			slot4 = setActive
			slot5 = slot0.maskDev
			slot7 = slot1
			slot6 = slot1.isDeving

			slot4(slot5, slot6(slot7))

			slot4 = setActive
			slot5 = slot0.tip
			slot7 = slot1
			slot6 = slot1.isFinished

			slot4(slot5, slot6(slot7))

			slot4 = setActive
			slot5 = slot0.maskNone
			slot6 = false

			slot4(slot5, slot6)

			slot4 = setActive
			slot5 = slot0.lvTF
			slot7 = slot1
			slot6 = slot1.isLock
			slot6 = slot6(slot7)

			if not slot6 then
				slot7 = slot1
				slot6 = slot1.isDeving
				slot6 = slot6(slot7)
				slot6 = not slot6
			else
				slot6 = false

				if false then
					slot6 = true
				end
			end

			slot4(slot5, slot6)
		end
	end

	slot2.update = slot3

	function slot3(slot0, slot1)
		LeanTween.moveY(slot0.iconTF, (slot1 and 25) or 0, 0.1)
	end

	slot2.updateSelectedStyle = slot3

	return slot2
end

slot0.createShipItem = slot8

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.filterBlueprints

	slot1(slot2)

	slot1 = slot0.contextData
	slot2 = slot0.contextData
	slot2 = slot2.shipBluePrintVO

	if not slot2 then
		slot2 = slot0.filterBlueprintVOs
		slot2 = slot2[1]
	end

	slot1.shipBluePrintVO = slot2
	slot1 = {}
	slot0.bluePrintItems = slot1
	slot1 = slot0.shipScorll

	function slot2(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.createShipItem
		slot3 = slot0
		slot1 = slot1(slot2, slot3)
		slot2 = slot0
		slot2 = slot2.bluePrintItems
		slot2[slot0] = slot1
		slot2 = onToggle
		slot3 = slot0
		slot4 = slot1.go

		function slot5(slot0)
			if slot0 then
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.clearLeanTween

				slot1(slot2)

				slot1 = slot0
				slot1 = slot1.contextData
				slot2 = slot1
				slot2 = slot2.shipBluePrintVO
				slot1.shipBluePrintVO = slot2

				function slot1()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.setSelectedBluePrint

					slot0(slot1)

					slot0 = slot0
					slot1 = slot0
					slot1 = slot1.contextData
					slot1 = slot1.shipBluePrintVO
					slot1 = slot1.id
					slot0.nowShipId = slot1
					slot0 = slot0
					slot1 = true
					slot0.inFlag = slot1
				end

				slot2 = slot0
				slot2 = slot2.inFlag

				if slot2 then
					slot2 = slot0
					slot2 = slot2.nowShipId
					slot3 = slot0
					slot3 = slot3.contextData
					slot3 = slot3.shipBluePrintVO
					slot3 = slot3.id

					if slot2 ~= slot3 then
						slot2 = slot0
						slot3 = slot2
						slot2 = slot2.switchUI
						slot4 = slot1

						slot2(slot3, slot4)
					end
				else
					slot2 = slot1

					slot2()
				end
			end

			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.updateSelectedStyle
			slot3 = slot0

			slot1(slot2, slot3)
		end

		slot6 = SFX_PANEL

		slot2(slot3, slot4, slot5, slot6)
	end

	slot1.onInitItem = slot2
	slot1 = slot0.shipScorll

	function slot2(slot0, slot1)
		slot2 = slot0
		slot2 = slot2.bluePrintItems
		slot2 = slot2[slot1]

		if not slot2 then
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.createShipItem
			slot5 = slot1
			slot3 = slot3(slot4, slot5)
			slot2 = slot3
			slot3 = slot0
			slot3 = slot3.bluePrintItems
			slot3[slot1] = slot2
		end

		slot3 = slot0
		slot3 = slot3.filterBlueprintVOs
		slot4 = slot0 + 1
		slot3 = slot3[slot4]
		slot4 = slot3.id
		slot5 = 0

		if slot4 > slot5 then
			slot5 = slot3
			slot4 = slot3.getItemId
			slot4 = slot4(slot5)
			slot5 = slot0
			slot6 = slot5
			slot5 = slot5.getItemById
			slot7 = slot4
			slot5 = slot5(slot6, slot7)
			slot7 = slot2
			slot6 = slot2.update
			slot8 = slot3
			slot9 = slot5

			slot6(slot7, slot8, slot9)

			slot6 = slot0
			slot6 = slot6.contextData
			slot6 = slot6.shipBluePrintVO
			slot6 = slot6.id
			slot7 = slot2.shipBluePrintVO
			slot7 = slot7.id

			if slot6 == slot7 then
				slot6 = triggerToggle
				slot7 = slot2.go
				slot8 = true

				slot6(slot7, slot8)
			end
		else
			slot5 = slot2
			slot4 = slot2.update
			slot6 = slot3
			slot7 = nil

			slot4(slot5, slot6, slot7)
		end
	end

	slot1.onUpdateItem = slot2
	slot2 = slot0
	slot1 = slot0.setTotalCount

	slot1(slot2)
end

slot0.initShips = slot8

function slot8(slot0)
	slot1 = {}
	slot0.filterBlueprintVOs = slot1
	slot1 = 0
	slot2 = pairs
	slot3 = slot0.bluePrintByIds
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = table
		slot7 = slot7.insert
		slot8 = slot0.filterBlueprintVOs
		slot9 = slot6

		slot7(slot8, slot9)

		slot1 = slot1 + 1
	end

	slot2 = slot1
	slot3 = 6
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot0.filterBlueprintVOs
		slot8 = {
			id = -1,
			state = -1
		}

		slot6(slot7, slot8)
	end

	slot2 = table
	slot2 = slot2.sort
	slot3 = slot0.filterBlueprintVOs

	function slot4(slot0, slot1)
		slot2 = slot0.state
		slot3 = slot1.state

		if slot2 == slot3 then
			return slot0.id < slot1.id
		else
			return slot1.state < slot0.state
		end
	end

	slot2(slot3, slot4)
end

slot0.filterBlueprints = slot8

function slot8(slot0)
	slot1 = slot0.shipScorll
	slot2 = slot1
	slot1 = slot1.SetTotalCount
	slot3 = slot0.filterBlueprintVOs
	slot3 = #slot3
	slot4 = -1

	slot1(slot2, slot3, slot4)
end

slot0.setTotalCount = slot8

function slot8(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot0
	slot2 = slot0.updateInfo

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updatePainting

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateProperty

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.isUnlock
	slot2 = slot2(slot3)
	slot3 = setActive
	slot4 = slot0.taskListPanel
	slot5 = not slot2

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.modPanel
	slot5 = slot2

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.attrDisableBtn
	slot5 = not slot2

	slot3(slot4, slot5)

	if slot2 then
		slot4 = slot0
		slot3 = slot0.updateMod

		slot3(slot4)
	else
		slot4 = slot0
		slot3 = slot0.updateTaskList

		slot3(slot4)

		slot3 = triggerToggle
		slot4 = slot0.initBtn
		slot5 = true

		slot3(slot4, slot5)
	end

	slot4 = slot1
	slot3 = slot1.isDeving
	slot3 = slot3(slot4)

	if slot3 then
		slot4 = slot0
		slot3 = slot0.emit
		slot5 = ShipBluePrintMediator
		slot5 = slot5.ON_CHECK_TAKES
		slot6 = slot1.id

		slot3(slot4, slot5, slot6)
	end
end

slot0.setSelectedBluePrint = slot8

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.updateModPanel

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateModAdditionPanel

	slot1(slot2)
end

slot0.updateMod = slot8

function slot8(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.shipBluePrintVO
	slot4 = slot0
	slot3 = slot0.getShipById
	slot5 = slot1.shipId
	slot3 = slot3(slot4, slot5)
	slot4 = intProperties
	slot6 = slot1
	slot5 = slot1.getShipProperties
	slot7 = slot3
	slot4 = slot4(slot5(slot6, slot7))
	slot5 = Clone
	slot6 = slot1
	slot5 = slot5(slot6)
	slot7 = slot5
	slot6 = slot5.getMaxLevel
	slot6 = slot6(slot7)
	slot5.level = slot6
	slot6 = intProperties
	slot8 = slot5
	slot7 = slot5.getShipProperties
	slot9 = slot3
	slot6 = slot6(slot7(slot8, slot9))

	function slot7(slot0, slot1, slot2, slot3)
		slot4 = slot0
		slot5 = slot4
		slot4 = slot4.findTF
		slot6 = "attr_bg/name"
		slot7 = slot0
		slot4 = slot4(slot5, slot6, slot7)
		slot5 = slot0
		slot6 = slot5
		slot5 = slot5.findTF
		slot7 = "attr_bg/value"
		slot8 = slot0
		slot5 = slot5(slot6, slot7, slot8)
		slot6 = slot0
		slot7 = slot6
		slot6 = slot6.findTF
		slot8 = "attr_bg/max"
		slot9 = slot0
		slot6 = slot6(slot7, slot8, slot9)
		slot7 = slot0
		slot8 = slot7
		slot7 = slot7.findTF
		slot9 = "slider"
		slot10 = slot0
		slot7 = slot7(slot8, slot9, slot10)
		slot8 = slot7
		slot7 = slot7.GetComponent
		slot9 = typeof
		slot10 = Slider
		slot7 = slot7(slot8, slot9(slot10))
		slot8 = slot0
		slot9 = slot8
		slot8 = slot8.findTF
		slot10 = "pre_slider"
		slot11 = slot0
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Slider
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot0
		slot10 = slot9
		slot9 = slot9.findTF
		slot11 = "exp"
		slot12 = slot0
		slot9 = slot9(slot10, slot11, slot12)
		slot10 = setText
		slot11 = slot4
		slot12 = AttributeType
		slot12 = slot12.Type2Name
		slot13 = slot1

		slot10(slot11, slot12(slot13))

		slot10 = setText
		slot11 = slot5
		slot12 = slot2

		slot10(slot11, slot12)

		slot10 = slot1
		slot11 = slot10
		slot10 = slot10.getBluePrintAddition
		slot12 = slot1
		slot10, slot11 = slot10(slot11, slot12)
		slot12 = table
		slot12 = slot12.indexof
		slot13 = ShipModAttr
		slot13 = slot13.BLUEPRINT_ATTRS
		slot14 = slot1
		slot12 = slot12(slot13, slot14)
		slot13 = slot1
		slot14 = slot13
		slot13 = slot13.getExpRetio
		slot15 = slot12
		slot13 = slot13(slot14, slot15)
		slot14 = slot11 / slot13
		slot7.value = slot14
		slot14 = slot2
		slot15 = slot14
		slot14 = slot14.getBluePrintAddition
		slot16 = slot1
		slot14, slot15 = slot14(slot15, slot16)
		slot11 = slot15
		slot10 = slot14
		slot14 = slot2
		slot15 = slot14
		slot14 = slot14.getExpRetio
		slot16 = slot12
		slot14 = slot14(slot15, slot16)
		slot13 = slot14
		slot14 = setText
		slot15 = slot9
		slot16 = math
		slot16 = slot16.floor
		slot17 = slot11
		slot16 = slot16(slot17)
		slot17 = "/"
		slot18 = slot13
		slot16 = slot16 .. slot17 .. slot18

		slot14(slot15, slot16)

		slot14 = slot11 / slot13
		slot8.value = slot14
		slot14 = slot2
		slot15 = slot14
		slot14 = slot14.isMaxLevel
		slot14 = slot14(slot15)

		if slot14 then
			slot3 = slot2
		end

		slot14 = setText
		slot15 = slot6
		slot16 = slot3

		slot14(slot15, slot16)
	end

	slot8 = 0
	slot9 = pairs
	slot10 = slot4
	slot9, slot10, slot11 = slot9(slot10)

	for slot12, slot13 in slot9, slot10, slot11 do
		slot14 = table
		slot14 = slot14.contains
		slot15 = ShipModAttr
		slot15 = slot15.BLUEPRINT_ATTRS
		slot16 = slot12
		slot14 = slot14(slot15, slot16)

		if slot14 then
			slot8 = slot8 + 1

			slot7(slot0.attrContainer:Find(slot12), slot12, slot13, slot6[slot12] or 0)
		end
	end

	slot9 = slot0.modLevel
	slot10 = "<size=30>"
	slot11 = slot1.level
	slot12 = "</size> /"
	slot13 = "<size=18>"
	slot15 = slot1
	slot14 = slot1.getMaxLevel
	slot14 = slot14(slot15)
	slot15 = "</size>"
	slot10 = slot10 .. slot11 .. slot12 .. slot13 .. slot14 .. slot15
	slot9.text = slot10
	slot10 = slot2
	slot9 = slot2.getNextLevelExp
	slot9 = slot9(slot10)

	if slot9 == -1 then
		slot10 = slot0.levelSlider
		slot11 = 1
		slot10.value = slot11
	else
		slot10 = slot0.levelSlider
		slot11 = slot2.exp
		slot11 = slot11 / slot9
		slot10.value = slot11
	end

	slot11 = slot1
	slot10 = slot1.getNextLevelExp
	slot10 = slot10(slot11)
	slot9 = slot10

	if slot9 == -1 then
		slot10 = setText
		slot11 = slot0.levelSliderTxt
		slot12 = "MAX"

		slot10(slot11, slot12)

		slot10 = slot0.preLevelSlider
		slot11 = 1
		slot10.value = slot11
	else
		slot10 = setText
		slot11 = slot0.levelSliderTxt
		slot12 = slot1.exp
		slot13 = "/"
		slot15 = slot1
		slot14 = slot1.getNextLevelExp
		slot14 = slot14(slot15)
		slot12 = slot12 .. slot13 .. slot14

		slot10(slot11, slot12)

		slot10 = slot0.preLevelSlider
		slot11 = slot1.exp
		slot11 = slot11 / slot9
		slot10.value = slot11
	end

	slot10 = setActive
	slot11 = slot0.needLevelTxt
	slot12 = false

	slot10(slot11, slot12)

	slot10 = setActive
	slot11 = slot0.levelSliderTxt
	slot12 = true

	slot10(slot11, slot12)

	slot10 = slot1.exp
	slot12 = slot1
	slot11 = slot1.getItemExp
	slot11 = slot11(slot12)

	if slot10 < slot11 then
		slot11 = slot1
		slot10 = slot1.isShipModMaxLevel
		slot12 = slot3
		slot10, slot11 = slot10(slot11, slot12)
		slot12 = setActive
		slot13 = slot0.needLevelTxt
		slot14 = slot10

		slot12(slot13, slot14)

		slot12 = setActive
		slot13 = slot0.levelSliderTxt
		slot14 = not slot10

		slot12(slot13, slot14)

		if slot11 then
			slot12 = setText
			slot13 = slot0.needLevelTxt
			slot14 = i18n
			slot15 = "buleprint_need_level_tip"
			slot16 = slot11

			slot12(slot13, slot14(slot15, slot16))

			slot12 = slot0.levelSlider
			slot13 = 1
			slot12.value = slot13
		end
	end
end

slot0.updateModInfo = slot8

function slot8(slot0)
	slot1 = slot0.inAnim

	return slot1
end

slot0.inModAnim = slot8
slot8 = 0.2

function slot9(slot0, slot1, slot2)
	slot4 = slot0
	slot3 = slot0.clearLeanTween

	slot3(slot4)

	slot3 = slot0.preLevelSlider
	slot4 = 0
	slot3.value = slot4
	slot3 = true
	slot0.inAnim = slot3
	slot3 = {}
	slot5 = slot2
	slot4 = slot2.getMaxLevel
	slot4 = slot4(slot5)
	slot6 = slot2
	slot5 = slot2.getNextLevelExp
	slot5 = slot5(slot6)
	slot6 = slot1.level
	slot7 = slot2.level

	if slot6 < slot7 then
		slot6 = slot1.level
		slot7 = slot2.level
		slot8 = 1

		for slot9 = slot6, slot7, slot8 do
			slot10 = slot2.level

			if slot9 == slot10 then
				slot10 = table
				slot10 = slot10.insert
				slot11 = slot3

				function slot12(slot0)
					slot1 = slot0
					slot1 = slot1.modLevel
					slot2 = slot1
					slot2 = slot2.level
					slot3 = "/"
					slot4 = slot2
					slot2 = slot2 .. slot3 .. slot4
					slot1.text = slot2
					slot1 = TweenValue
					slot2 = go
					slot3 = slot0
					slot3 = slot3.levelSlider
					slot2 = slot2(slot3)
					slot3 = 0
					slot4 = slot1
					slot4 = slot4.exp
					slot5 = slot3
					slot6 = nil

					function slot7(slot0)
						slot1 = slot0
						slot1 = slot1.levelSlider
						slot2 = slot1
						slot2 = slot0 / slot2
						slot1.value = slot2
					end

					function slot8()
						slot0 = Clone
						slot1 = slot0
						slot0 = slot0(slot1)
						slot1 = slot0
						slot1 = slot1.level
						slot1 = slot1 - 1
						slot0.level = slot1
						slot1 = 0
						slot0.exp = slot1
						slot1 = slot1
						slot2 = slot1
						slot1 = slot1.doAttrsAinm
						slot3 = slot0
						slot4 = slot0
						slot5 = slot2

						slot1(slot2, slot3, slot4, slot5)

						slot1 = slot1
						slot1 = slot1.modLevel
						slot2 = "<size=30>"
						slot3 = slot0
						slot3 = slot3.level
						slot4 = "</size> /"
						slot5 = "<size=18>"
						slot6 = slot3
						slot7 = "</size>"
						slot2 = slot2 .. slot3 .. slot4 .. slot5 .. slot6 .. slot7
						slot1.text = slot2
						slot1 = slot0
						slot1 = slot1.level
						slot2 = slot3

						if slot1 == slot2 then
							slot1 = slot1
							slot1 = slot1.levelSlider
							slot2 = 1
							slot1.value = slot2
						end
					end

					slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8)
				end

				slot10(slot11, slot12)
			else
				slot10 = table
				slot10 = slot10.insert
				slot11 = slot3

				function slot12(slot0)
					slot1 = slot0
					slot1 = slot1.modLevel
					slot2 = slot1
					slot3 = "/"
					slot4 = slot2
					slot2 = slot2 .. slot3 .. slot4
					slot1.text = slot2
					slot1 = TweenValue
					slot2 = go
					slot3 = slot0
					slot3 = slot3.levelSlider
					slot2 = slot2(slot3)
					slot3 = 0
					slot4 = 1
					slot5 = slot3
					slot6 = nil

					function slot7(slot0)
						slot1 = slot0
						slot1 = slot1.levelSlider
						slot1.value = slot0
					end

					function slot8()
						slot0 = Clone
						slot1 = slot0
						slot0 = slot0(slot1)
						slot1 = slot1
						slot0.level = slot1
						slot1 = 0
						slot0.exp = slot1
						slot1 = Clone
						slot2 = slot0
						slot1 = slot1(slot2)
						slot2 = math
						slot2 = slot2.max
						slot3 = 1
						slot4 = slot0.level
						slot4 = slot4 - 1
						slot2 = slot2(slot3, slot4)
						slot1.level = slot2
						slot2 = 0
						slot1.exp = slot2
						slot2 = slot2
						slot3 = slot2
						slot2 = slot2.doAttrsAinm
						slot4 = slot1
						slot5 = slot0
						slot6 = slot3

						slot2(slot3, slot4, slot5, slot6)

						slot2 = slot2
						slot2 = slot2.modLevel
						slot3 = "<size=30>"
						slot4 = slot1
						slot5 = "</size> /"
						slot6 = "<size=18>"
						slot7 = slot4
						slot8 = "</size>"
						slot3 = slot3 .. slot4 .. slot5 .. slot6 .. slot7 .. slot8
						slot2.text = slot3
					end

					slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8)
				end

				slot10(slot11, slot12)
			end
		end
	else
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot3

		function slot8(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getNextLevelExp
			slot1 = slot1(slot2)
			slot2 = TweenValue
			slot3 = go
			slot4 = slot1
			slot4 = slot4.levelSlider
			slot3 = slot3(slot4)
			slot4 = slot2
			slot4 = slot4.exp
			slot5 = slot0
			slot5 = slot5.exp
			slot6 = slot3
			slot7 = nil

			function slot8(slot0)
				slot1 = slot0
				slot1 = slot1.levelSlider
				slot2 = slot1
				slot2 = slot0 / slot2
				slot1.value = slot2
			end

			function slot9()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.doAttrsAinm
				slot2 = slot1
				slot3 = slot2
				slot4 = slot3

				slot0(slot1, slot2, slot3, slot4)
			end

			slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)
		end

		slot6(slot7, slot8)
	end

	slot6 = table
	slot6 = slot6.insert
	slot7 = slot0.leanTweens
	slot8 = slot0.levelSlider

	slot6(slot7, slot8)

	slot6 = seriesAsync
	slot7 = slot3

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateMod

		slot0(slot1)

		slot0 = slot0
		slot1 = false
		slot0.inAnim = slot1
	end

	slot6(slot7, slot8)
end

slot0.doModAnim = slot9

function slot9(slot0, slot1, slot2, slot3)
	slot4 = {}
	slot6 = slot0
	slot5 = slot0.getShipById
	slot7 = slot1.shipId
	slot5 = slot5(slot6, slot7)
	slot6 = intProperties
	slot8 = slot1
	slot7 = slot1.getShipProperties
	slot9 = slot5
	slot6 = slot6(slot7(slot8, slot9))
	slot7 = intProperties
	slot9 = slot2
	slot8 = slot2.getShipProperties
	slot10 = slot5
	slot7 = slot7(slot8(slot9, slot10))
	slot8 = ipairs
	slot9 = ShipModAttr
	slot9 = slot9.BLUEPRINT_ATTRS
	slot8, slot9, slot10 = slot8(slot9)

	for slot11, slot12 in slot8, slot9, slot10 do
		slot13 = AttributeType
		slot13 = slot13.AntiAircraft

		if slot13 ~= slot12 then
			slot13 = slot0.attrContainer
			slot14 = slot13
			slot13 = slot13.Find
			slot15 = slot12
			slot13 = slot13(slot14, slot15)
			slot15 = slot0
			slot14 = slot0.findTF
			slot16 = "attr_bg/value"
			slot17 = slot13
			slot14 = slot14(slot15, slot16, slot17)
			slot15 = slot14
			slot14 = slot14.GetComponent
			slot16 = typeof
			slot17 = Text
			slot14 = slot14(slot15, slot16(slot17))
			slot16 = slot0
			slot15 = slot0.findTF
			slot17 = "slider"
			slot18 = slot13
			slot15 = slot15(slot16, slot17, slot18)
			slot16 = slot15
			slot15 = slot15.GetComponent
			slot17 = typeof
			slot18 = Slider
			slot15 = slot15(slot16, slot17(slot18))
			slot17 = slot0
			slot16 = slot0.findTF
			slot18 = "pre_slider"
			slot19 = slot13
			slot16 = slot16(slot17, slot18, slot19)
			slot17 = slot16
			slot16 = slot16.GetComponent
			slot18 = typeof
			slot19 = Slider
			slot16 = slot16(slot17, slot18(slot19))
			slot17 = table
			slot17 = slot17.indexof
			slot18 = ShipModAttr
			slot18 = slot18.BLUEPRINT_ATTRS
			slot19 = slot12
			slot17 = slot17(slot18, slot19)
			slot19 = slot1
			slot18 = slot1.getExpRetio
			slot20 = slot17
			slot18 = slot18(slot19, slot20)
			slot19 = slot6[slot12]
			slot20 = slot7[slot12]
			slot22 = slot1
			slot21 = slot1.getBluePrintAddition
			slot23 = slot12
			slot21, slot22 = slot21(slot22, slot23)
			slot24 = slot2
			slot23 = slot2.getBluePrintAddition
			slot25 = slot12
			slot23, slot24 = slot23(slot24, slot25)
			slot25 = slot22 / slot18
			slot26 = slot24 / slot18
			slot27 = 0
			slot16.value = slot27
			slot27 = table
			slot27 = slot27.insert
			slot28 = slot4

			function slot29(slot0)
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.doAttrAnim
				slot3 = slot1
				slot4 = slot2
				slot5 = slot3
				slot6 = slot4
				slot7 = slot5
				slot8 = slot6
				slot9 = slot0

				slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
			end

			slot27(slot28, slot29)
		end
	end

	slot8 = parallelAsync
	slot9 = slot4
	slot10 = slot3

	slot8(slot9, slot10)
end

slot0.doAttrsAinm = slot9
slot9 = 0.1

function slot10(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = table
	slot8 = slot8.insert
	slot9 = slot0.leanTweens
	slot10 = slot1

	slot8(slot9, slot10)

	slot8 = slot5

	if slot5 < slot6 then
		slot9 = TweenValue
		slot10 = go
		slot11 = slot1
		slot10 = slot10(slot11)
		slot11 = slot3
		slot12 = 1
		slot13 = slot0
		slot14 = nil

		function slot15(slot0)
			slot1 = slot0
			slot1.value = slot0
		end

		function slot16()
			slot0 = slot0
			slot0 = slot0 + 1
			slot0 = slot0
			slot0 = slot1
			slot1 = slot0
			slot0.text = slot1
			slot0 = slot2
			slot1 = slot0
			slot0 = slot0 - slot1
			slot1 = 0

			if slot0 > slot1 then
				slot1 = TweenValue
				slot2 = go
				slot3 = slot3
				slot2 = slot2(slot3)
				slot3 = 0
				slot4 = 1
				slot5 = slot4
				slot6 = nil

				function slot7(slot0)
					slot1 = slot0
					slot1.value = slot0
				end

				function slot8()
					slot0 = slot0
					slot0 = slot0 + 1
					slot0 = slot0
					slot0 = slot1
					slot1 = slot0
					slot0.text = slot1
					slot0 = slot0
					slot1 = slot2

					if slot0 == slot1 then
						slot0 = TweenValue
						slot1 = go
						slot2 = slot3
						slot1 = slot1(slot2)
						slot2 = 0
						slot3 = slot4
						slot4 = slot5
						slot5 = nil

						function slot6(slot0)
							slot1 = slot0
							slot1.value = slot0
						end

						function slot7()
							slot0 = slot0
							slot1 = slot1
							slot0.text = slot1
							slot0 = slot2

							slot0()
						end

						slot0(slot1, slot2, slot3, slot4, slot5, slot6, slot7)
					end
				end

				slot9 = slot0

				slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
			else
				slot1 = TweenValue
				slot2 = go
				slot3 = slot3
				slot2 = slot2(slot3)
				slot3 = 0
				slot4 = slot5
				slot5 = slot4
				slot6 = nil

				function slot7(slot0)
					slot1 = slot0
					slot1.value = slot0
				end

				function slot8()
					slot0 = slot0
					slot1 = slot1
					slot0.text = slot1
					slot0 = slot2

					slot0()
				end

				slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8)
			end
		end

		slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16)
	elseif slot6 == 0 then
		slot9 = slot7

		slot9()
	else
		slot9 = TweenValue
		slot10 = go
		slot11 = slot1
		slot10 = slot10(slot11)
		slot11 = slot3
		slot12 = slot4
		slot13 = slot0
		slot14 = nil

		function slot15(slot0)
			slot1 = slot0
			slot1.value = slot0
		end

		slot16 = slot7

		slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16)
	end
end

slot0.doAttrAnim = slot10

function slot10(slot0, slot1)
	slot2 = pairs
	slot3 = slot0.leanTweens
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = LeanTween
		slot7 = slot7.isTweening
		slot8 = go
		slot9 = slot6
		slot7 = slot7(slot8(slot9))

		if slot7 then
			slot7 = LeanTween
			slot7 = slot7.cancel
			slot8 = go
			slot9 = slot6

			slot7(slot8(slot9))
		end
	end

	slot2 = slot0.inAnim

	if slot2 then
		slot2 = nil
		slot0.inAnim = slot2

		if not slot1 then
			slot3 = slot0
			slot2 = slot0.updateMod

			slot2(slot3)
		end
	end

	slot2 = {}
	slot0.leanTweens = slot2
end

slot0.clearLeanTween = slot10

function slot10(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot0
	slot2 = slot0.getShipById
	slot4 = slot1.shipId
	slot2 = slot2(slot3, slot4)
	slot4 = slot1
	slot3 = slot1.getConfig
	slot5 = "strengthen_item"
	slot3 = slot3(slot4, slot5)
	slot5 = slot0
	slot4 = slot0.getItemById
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	slot6 = slot1
	slot5 = slot1.getUseageMaxItem
	slot5 = slot5(slot6)
	slot6 = 0
	slot7 = math
	slot7 = slot7.min
	slot8 = slot4.count
	slot9 = slot5
	slot7 = slot7(slot8, slot9)

	function slot8(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getItemExp
		slot1 = slot1(slot2)
		slot2 = slot0 * slot1
		slot3 = Clone
		slot4 = slot0
		slot3 = slot3(slot4)
		slot5 = slot3
		slot4 = slot3.addExp
		slot6 = slot2

		slot4(slot5, slot6)

		slot4 = slot1
		slot5 = slot4
		slot4 = slot4.updateModInfo
		slot6 = slot3

		slot4(slot5, slot6)

		slot4 = setText
		slot5 = slot1
		slot5 = slot5.calcTxt
		slot6 = slot0

		slot4(slot5, slot6)
	end

	slot9 = nil
	slot10 = slot0.nameTxts
	slot11 = slot0.itemInfo
	slot10 = slot10[slot11]

	if slot10 then
		slot10 = slot0.nameTxts
		slot11 = slot0.itemInfo
		slot9 = slot10[slot11]
	else
		slot10 = ScrollTxt
		slot10 = slot10.New
		slot11 = findTF
		slot12 = slot0.itemInfo
		slot13 = "name"
		slot11 = slot11(slot12, slot13)
		slot12 = findTF
		slot13 = slot0.itemInfo
		slot14 = "name/Text"
		slot10 = slot10(slot11, slot12(slot13, slot14))
		slot9 = slot10
		slot10 = slot0.nameTxts
		slot10[1] = slot9
	end

	slot11 = slot9
	slot10 = slot9.setText
	slot13 = slot4
	slot12 = slot4.getConfig
	slot14 = "name"

	slot10(slot11, slot12(slot13, slot14))

	slot10 = slot0.itemInfoCount
	slot11 = slot4.count
	slot10.text = slot11
	slot10 = GetImageSpriteFromAtlasAsync
	slot12 = slot4
	slot11 = slot4.getConfig
	slot13 = "icon"
	slot11 = slot11(slot12, slot13)
	slot12 = ""
	slot13 = slot0.itemInfoIcon

	slot10(slot11, slot12, slot13)

	slot10 = onButton
	slot11 = slot0
	slot12 = slot0.modBtn

	function slot13()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.inModAnim
		slot0 = slot0(slot1)

		if slot0 then
			return
		end

		slot0 = slot1

		if slot0 == 0 then
			return
		end

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipBluePrintMediator
		slot2 = slot2.ON_MOD
		slot3 = slot2
		slot3 = slot3.id
		slot4 = slot1

		slot0(slot1, slot2, slot3, slot4)
	end

	slot14 = SFX_PANEL

	slot10(slot11, slot12, slot13, slot14)

	slot10 = pressPersistTrigger
	slot11 = slot0.calcMinBtn
	slot12 = 0.5

	function slot13(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.inModAnim
		slot1 = slot1(slot2)

		if not slot1 then
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.isMaxLevel
			slot1 = slot1(slot2)

			if not slot1 then
				slot1 = slot2

				if slot1 == 0 then
					if slot0 then
						slot1 = slot0

						slot1()
					end

					return
				end
			end
		end

		slot1 = math
		slot1 = slot1.max
		slot2 = slot2
		slot2 = slot2 - 1
		slot3 = 0
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot3
		slot2 = slot2

		slot1(slot2)
	end

	slot14 = nil
	slot15 = true
	slot16 = true
	slot17 = 0.1
	slot18 = SFX_PANEL

	slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)

	slot10 = pressPersistTrigger
	slot11 = slot0.calcMaxBtn
	slot12 = 0.5

	function slot13(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.inModAnim
		slot1 = slot1(slot2)

		if not slot1 then
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.isMaxLevel
			slot1 = slot1(slot2)

			if slot1 then
				if slot0 then
					slot1 = slot0

					slot1()
				end

				return
			end
		end

		slot1 = slot2
		slot1 = slot1 + 1
		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.getItemExp
		slot2 = slot2(slot3)
		slot3 = slot1 * slot2
		slot4 = Clone
		slot5 = slot1
		slot4 = slot4(slot5)
		slot6 = slot4
		slot5 = slot4.addExp
		slot7 = slot3

		slot5(slot6, slot7)

		slot6 = slot4
		slot5 = slot4.getStrengthenConfig
		slot7 = math
		slot7 = slot7.min
		slot8 = slot4.level
		slot8 = slot8 + 1
		slot10 = slot4
		slot9 = slot4.getMaxLevel
		slot5 = slot5(slot6, slot7(slot8, slot9(slot10)))
		slot6 = slot3
		slot6 = slot6.level
		slot7 = slot5.need_lv

		if slot6 < slot7 then
			slot6 = slot4.exp

			if slot2 <= slot6 then
				if slot0 then
					slot6 = slot0

					slot6()
				end

				return
			end
		end

		slot6 = slot4.level
		slot8 = slot4
		slot7 = slot4.getMaxLevel
		slot7 = slot7(slot8)

		if slot6 == slot7 then
			slot6 = slot4.exp

			if slot2 <= slot6 then
				if slot0 then
					slot6 = slot0

					slot6()
				end

				return
			end
		end

		slot6 = math
		slot6 = slot6.max
		slot7 = math
		slot7 = slot7.min
		slot8 = slot2
		slot8 = slot8 + 1
		slot9 = slot4
		slot7 = slot7(slot8, slot9)
		slot8 = 0
		slot6 = slot6(slot7, slot8)
		slot2 = slot6
		slot6 = slot5
		slot7 = slot2

		slot6(slot7)
	end

	slot14 = nil
	slot15 = true
	slot16 = true
	slot17 = 0.1
	slot18 = SFX_PANEL

	slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)

	slot10 = slot8
	slot11 = slot6

	slot10(slot11)
end

slot0.updateModPanel = slot10

function slot10(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.specialStrengthens
	slot2 = slot2(slot3)
	slot3 = slot0.modAdditionContainer
	slot3 = slot3.childCount
	slot4 = slot3 - 1
	slot5 = #slot2
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot9 = slot0
		slot8 = slot0.cloneTplTo
		slot10 = slot0.modAdditionTpl
		slot11 = slot0.modAdditionContainer

		slot8(slot9, slot10, slot11)
	end

	slot4 = slot0.modAdditionContainer
	slot3 = slot4.childCount
	slot4 = 1
	slot5 = slot3
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		setActive(slot0.modAdditionContainer:GetChild(slot7 - 1), slot7 <= #slot2)

		if slot7 <= #slot2 then
			slot11 = slot0
			slot10 = slot0.updateAdvanceTF
			slot12 = slot1
			slot13 = slot9
			slot14 = slot2[slot7]

			slot10(slot11, slot12, slot13, slot14)
		end
	end
end

slot0.updateModAdditionPanel = slot10

function slot10(slot0, slot1, slot2, slot3)
	setActive(slot2:Find("mask"), slot1.level < slot3.level)

	if slot1.level < slot3.level then
		slot5 = setText
		slot7 = slot2
		slot6 = slot2.Find
		slot8 = "mask/content/Text"
		slot6 = slot6(slot7, slot8)
		slot7 = i18n
		slot8 = "blueprint_mod_addition_lock"
		slot9 = slot3.level

		slot5(slot6, slot7(slot8, slot9))
	end

	slot6 = slot3.extraDes or {}

	removeAllChildren(slot7)

	slot8 = slot0:findTF("scroll_rect/info", slot0.modAdditionPanel)

	function slot9(slot0, slot1)
		slot7 = Ship.New({
			configId = slot1[2]
		}).getStar(slot4)
		slot8 = slot0:Find("star_tpl")

		removeAllChildren(slot9)
		removeAllChildren(slot10)

		slot11 = 1
		slot12 = Ship.New({
			configId = pg.ship_data_breakout[slot1[2]].pre_id
		}).getStar(slot5)
		slot13 = 1

		for slot14 = slot11, slot12, slot13 do
			cloneTplTo(slot8, slot9)
		end

		slot11 = 1
		slot12 = slot7
		slot13 = 1

		for slot14 = slot11, slot12, slot13 do
			cloneTplTo(slot8, slot10)
		end
	end

	slot10 = 1
	slot11 = #slot3.des
	slot12 = 1

	for slot13 = slot10, slot11, slot12 do
		slot14 = cloneTplTo
		slot15 = slot8
		slot16 = slot7
		slot14 = slot14(slot15, slot16)
		slot16 = slot14
		slot15 = slot14.Find
		slot17 = "text_tpl"
		slot15 = slot15(slot16, slot17)
		slot17 = slot14
		slot16 = slot14.Find
		slot18 = "breakout_tpl"
		slot16 = slot16(slot17, slot18)
		slot17 = setActive
		slot18 = slot15
		slot19 = false

		slot17(slot18, slot19)

		slot17 = setActive
		slot19 = slot14
		slot18 = slot14.Find
		slot20 = "attr_tpl"
		slot18 = slot18(slot19, slot20)
		slot19 = false

		slot17(slot18, slot19)

		slot17 = setActive
		slot18 = slot16
		slot19 = false

		slot17(slot18, slot19)

		slot17 = setActive
		slot19 = slot14
		slot18 = slot14.Find
		slot20 = "empty_tpl"
		slot18 = slot18(slot19, slot20)
		slot19 = false

		slot17(slot18, slot19)

		slot17 = slot5[slot13]

		if slot17 then
			slot17 = slot5[slot13]
			slot17 = slot17[1]
			slot18 = ShipBluePrint
			slot18 = slot18.STRENGTHEN_TYPE_BREAKOUT

			if slot17 == slot18 then
				slot18 = setActive
				slot19 = slot16
				slot20 = true

				slot18(slot19, slot20)

				slot18 = slot9
				slot19 = slot16
				slot20 = slot5[slot13]

				slot18(slot19, slot20)
			else
				slot18 = setActive
				slot19 = slot15
				slot20 = true

				slot18(slot19, slot20)

				slot18 = setText
				slot20 = slot15
				slot19 = slot15.Find
				slot21 = "Text"
				slot19 = slot19(slot20, slot21)
				slot20 = slot5[slot13]
				slot20 = slot20[3]

				slot18(slot19, slot20)
			end
		else
			slot17 = setActive
			slot18 = empty_tpl
			slot19 = true

			slot17(slot18, slot19)
		end
	end

	slot10 = 1
	slot11 = #slot6
	slot12 = 1

	for slot13 = slot10, slot11, slot12 do
		slot14 = cloneTplTo
		slot15 = slot8
		slot16 = slot7
		slot14 = slot14(slot15, slot16)
		slot16 = slot14
		slot15 = slot14.Find
		slot17 = "text_tpl"
		slot15 = slot15(slot16, slot17)
		slot16 = setActive
		slot17 = slot15
		slot18 = true

		slot16(slot17, slot18)

		slot16 = setActive
		slot18 = slot14
		slot17 = slot14.Find
		slot19 = "attr_tpl"
		slot17 = slot17(slot18, slot19)
		slot18 = false

		slot16(slot17, slot18)

		slot16 = setActive
		slot18 = slot14
		slot17 = slot14.Find
		slot19 = "breakout_tpl"
		slot17 = slot17(slot18, slot19)
		slot18 = false

		slot16(slot17, slot18)

		slot16 = setActive
		slot18 = slot14
		slot17 = slot14.Find
		slot19 = "empty_tpl"
		slot17 = slot17(slot18, slot19)
		slot18 = false

		slot16(slot17, slot18)

		slot16 = setText
		slot18 = slot15
		slot17 = slot15.Find
		slot19 = "Text"
		slot17 = slot17(slot18, slot19)
		slot18 = slot6[slot13]

		slot16(slot17, slot18)
	end
end

slot0.updateAdvanceTF = slot10

function slot10(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot0.shipBluePrintVO = slot1
	slot2 = nil
	slot4 = slot1
	slot3 = slot1.isFetched
	slot3 = slot3(slot4)

	if slot3 then
		slot3 = slot0.shipVOs
		slot4 = slot1.shipId
		slot2 = slot3[slot4]
	end

	if not slot2 then
		slot4 = slot1
		slot3 = slot1.getShipVO
		slot3 = slot3(slot4)
		slot2 = slot3
	end

	slot4 = slot2
	slot3 = slot2.getConfigTable
	slot3 = slot3(slot4)
	slot5 = slot2
	slot4 = slot2.getName
	slot4 = slot4(slot5)
	slot5 = setText
	slot6 = slot0.shipName
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = setText
	slot6 = slot0.englishName
	slot7 = slot3.english_name

	slot5(slot6, slot7)

	slot5 = removeAllChildren
	slot6 = slot0.stars

	slot5(slot6)

	slot6 = slot2
	slot5 = slot2.getStar
	slot5 = slot5(slot6)
	slot7 = slot2
	slot6 = slot2.getMaxStar
	slot6 = slot6(slot7)
	slot7 = 1
	slot8 = slot6
	slot9 = 1

	for slot10 = slot7, slot8, slot9 do
		slot11 = cloneTplTo
		slot12 = slot0.shipInfoStarTpl
		slot13 = slot0.stars
		slot14 = "star_"
		slot15 = slot10
		slot14 = slot14 .. slot15

		slot11(slot12, slot13, slot14)
	end

	slot7 = slot6 - slot5
	slot8 = 1
	slot9 = slot7
	slot10 = 1

	for slot11 = slot8, slot9, slot10 do
		slot12 = slot0.stars
		slot13 = slot12
		slot12 = slot12.GetChild
		slot14 = slot11 - 1
		slot12 = slot12(slot13, slot14)
		slot13 = setActive
		slot15 = slot12
		slot14 = slot12.Find
		slot16 = "star_tpl"
		slot14 = slot14(slot15, slot16)
		slot15 = false

		slot13(slot14, slot15)

		slot13 = setActive
		slot15 = slot12
		slot14 = slot12.Find
		slot16 = "empty_star_tpl"
		slot14 = slot14(slot15, slot16)
		slot15 = true

		slot13(slot14, slot15)
	end

	slot8 = GetSpriteFromAtlas
	slot9 = "shiptype"
	slot11 = slot2
	slot10 = slot2.getShipType
	slot8 = slot8(slot9, slot10(slot11))

	if not slot8 then
		slot9 = warning
		slot10 = "找不到船形, shipConfigId: "
		slot11 = slot2.configId
		slot10 = slot10 .. slot11

		slot9(slot10)
	end

	slot9 = setImageSprite
	slot10 = slot0.shipType
	slot11 = slot8
	slot12 = true

	slot9(slot10, slot11, slot12)

	slot9 = slot0.shipBluePrintVO
	slot10 = slot9
	slot9 = slot9.isLock
	slot9 = slot9(slot10)
	slot10 = setActive
	slot11 = slot0.finishedBtn
	slot12 = slot0.shipBluePrintVO
	slot13 = slot12
	slot12 = slot12.isFinished

	slot10(slot11, slot12(slot13))

	slot10 = slot0.shipBluePrintVO
	slot11 = slot10
	slot10 = slot10.isDeving
	slot10 = slot10(slot11)
	slot11 = setActive
	slot12 = slot0.progressPanel
	slot13 = slot10

	slot11(slot12, slot13)

	if slot10 then
		slot12 = slot0
		slot11 = slot0.updateTasksProgress

		slot11(slot12)
	end

	slot11 = false
	slot12 = slot0.shipBluePrintVO
	slot13 = slot12
	slot12 = slot12.isLock
	slot12 = slot12(slot13)

	if slot12 then
		slot12 = setActive
		slot13 = slot0.openConditiontxt
		slot13 = slot13.parent
		slot14 = true

		slot12(slot13, slot14)

		slot12 = slot0.shipBluePrintVO
		slot13 = slot12
		slot12 = slot12.getOpenTaskID
		slot12 = slot12(slot13)
		slot14 = slot0
		slot13 = slot0.getTaskById
		slot15 = slot12
		slot13 = slot13(slot14, slot15)

		if slot13 then
			slot14 = pg
			slot14 = slot14.task_data_template
			slot14 = slot14[slot12]

			if slot14 then
				slot14 = setText
				slot15 = slot0.openConditiontxt
				slot17 = slot13
				slot16 = slot13.getConfig
				slot18 = "desc"

				slot14(slot15, slot16(slot17, slot18))

				if slot13 then
					slot15 = slot13
					slot14 = slot13.isFinish
					slot14 = slot14(slot15)

					if not slot14 then
						slot15 = slot13
						slot14 = slot13.isReceive
						slot14 = slot14(slot15)
						slot11 = slot14
					end
				end
			end
		end

		slot14 = setText
		slot16 = slot0
		slot15 = slot0.findTF
		slot17 = "Text"
		slot18 = slot0.lockBtn
		slot15 = slot15(slot16, slot17, slot18)
		slot17 = slot13
		slot16 = slot13.getProgress
		slot16 = slot16(slot17)
		slot17 = "/"
		slot19 = slot13
		slot18 = slot13.getConfig
		slot20 = "target_num"
		slot18 = slot18(slot19, slot20)
		slot16 = slot16 .. slot17 .. slot18

		slot14(slot15, slot16)
	else
		slot12 = setActive
		slot13 = slot0.openConditiontxt
		slot13 = slot13.parent
		slot14 = false

		slot12(slot13, slot14)
	end

	setActive(slot0.startBtn, slot9 and slot11)
	setActive(slot0.lockBtn, slot9 and not slot11)
end

slot0.updateInfo = slot10

function slot10(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.getTaskIds
	slot2 = slot2(slot3)
	slot3 = slot0.progressContainer
	slot3 = slot3.childCount
	slot4 = slot3
	slot5 = #slot2
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = cloneTplTo
		slot9 = slot0.progressTpl
		slot10 = slot0.progressContainer

		slot8(slot9, slot10)
	end

	slot4 = slot0.progressContainer
	slot3 = slot4.childCount
	slot4 = 1
	slot5 = slot3
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		setActive(slot0.progressContainer:GetChild(slot7 - 1), slot7 <= #slot2)
		setActive(findTF(slot8, "complete"), slot1:getTaskStateById(slot2[slot7]) == ShipBluePrint.TASK_STATE_FINISHED)

		slot11 = setActive
		slot12 = findTF(slot8, "lock")

		slot11(slot12, slot10 == ShipBluePrint.TASK_STATE_WAIT)

		slot11 = setActive
		slot12 = findTF
		slot13 = slot8
		slot14 = "working"
		slot12 = slot12(slot13, slot14)
		slot13 = ShipBluePrint
		slot13 = slot13.TASK_STATE_ACHIEVED
		slot13 = ShipBluePrint
		slot13 = slot13.TASK_STATE_OPENING

		slot11(slot12, slot10 == ShipBluePrint.TASK_STATE_START)
	end
end

slot0.updateTasksProgress = slot10

function slot10(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.getShipVO
	slot2 = slot2(slot3)
	slot3 = slot0.lastPaintingName

	if slot3 then
		slot3 = slot0.lastPaintingName
		slot5 = slot2
		slot4 = slot2.getPainting
		slot4 = slot4(slot5)

		if slot3 ~= slot4 then
			slot3 = retPaintingPrefab
			slot4 = slot0.painting
			slot5 = slot0.lastPaintingName

			slot3(slot4, slot5)
		end
	end

	slot4 = slot2
	slot3 = slot2.getPainting
	slot3 = slot3(slot4)
	slot4 = setPaintingPrefab
	slot5 = slot0.painting
	slot6 = slot3
	slot7 = "tuzhi"

	slot4(slot5, slot6, slot7)

	slot0.lastPaintingName = slot3
	slot5 = slot0
	slot4 = slot0.paintBreath

	slot4(slot5)
end

slot0.updatePainting = slot10

function slot10(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.getShipVO
	slot2 = slot2(slot3)
	slot3 = slot0.propertyPanel
	slot4 = slot3
	slot3 = slot3.initProperty
	slot5 = slot2.configId

	slot3(slot4, slot5)

	slot3 = slot0
	slot4 = slot2.configId
	slot3 = slot3[slot4]
	slot4 = slot3.buff_list_display
	slot5 = slot0.skillPanel
	slot5 = slot5.childCount
	slot6 = slot5
	slot7 = #slot4
	slot7 = slot7 - 1
	slot8 = 1

	for slot9 = slot6, slot7, slot8 do
		slot10 = cloneTplTo
		slot11 = slot0.skillTpl
		slot12 = slot0.skillPanel

		slot10(slot11, slot12)
	end

	slot6 = slot0.skillPanel
	slot5 = slot6.childCount
	slot6 = 1
	slot7 = slot5
	slot8 = 1

	for slot9 = slot6, slot7, slot8 do
		slot11 = slot9 <= #slot4
		slot12 = findTF(slot0.skillPanel:GetChild(slot9 - 1), "icon")

		if slot11 then
			slot13 = getSkillConfig
			slot14 = slot4[slot9]
			slot13 = slot13(slot14)
			slot14 = LoadImageSpriteAsync
			slot15 = "skillicon/"
			slot16 = slot13.icon
			slot15 = slot15 .. slot16
			slot16 = slot12

			slot14(slot15, slot16)

			slot14 = onButton
			slot15 = slot0
			slot16 = slot10

			function slot17()
				slot0 = pg
				slot0 = slot0.UIMgr
				slot0 = slot0.GetInstance
				slot0 = slot0()
				slot1 = slot0
				slot0 = slot0.PartialBlur
				slot2 = slot0
				slot2 = slot2.leftPanle
				slot3 = slot2
				slot2 = slot2.Find
				slot4 = "property_panel/init_panel"
				slot2 = slot2(slot3, slot4)
				slot3 = false

				slot0(slot1, slot2, slot3)

				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ShipBluePrintMediator
				slot2 = slot2.SHOW_SKILL_INFO
				slot3 = slot1
				slot3 = slot3.id
				slot4 = {}
				slot5 = slot1
				slot5 = slot5.id
				slot4.id = slot5
				slot5 = pg
				slot5 = slot5.skill_data_template
				slot6 = slot1
				slot6 = slot6.id
				slot5 = slot5[slot6]
				slot5 = slot5.max_level
				slot4.level = slot5

				function slot5()
					slot0 = pg
					slot0 = slot0.UIMgr
					slot0 = slot0.GetInstance
					slot0 = slot0()
					slot1 = slot0
					slot0 = slot0.PartialBlur
					slot2 = slot0
					slot2 = slot2.leftPanle
					slot3 = slot2
					slot2 = slot2.Find
					slot4 = "property_panel/init_panel"
					slot2 = slot2(slot3, slot4)
					slot3 = true

					slot0(slot1, slot2, slot3)
				end

				slot0(slot1, slot2, slot3, slot4, slot5)
			end

			slot18 = SFX_PANEL

			slot14(slot15, slot16, slot17, slot18)
		end

		slot13 = setActive
		slot14 = slot10
		slot15 = slot11

		slot13(slot14, slot15)
	end

	setActive(slot0.skillArrLeft, #slot4 > 3)
	setActive(slot0.skillArrRight, #slot4 > 3)

	slot6 = #slot4
	slot7 = 3

	if slot6 > slot7 then
		slot6 = onScroll
		slot7 = slot0
		slot8 = slot0.skillRect

		function slot9(slot0)
			setActive(slot0.skillArrLeft, slot0.x > 0.01)
			setActive(slot0.skillArrRight, slot0.x < 0.99)
		end

		slot6(slot7, slot8, slot9)
	else
		slot6 = GetComponent
		slot7 = slot0.skillRect
		slot8 = typeof
		slot9 = ScrollRect
		slot6 = slot6(slot7, slot8(slot9))
		slot6 = slot6.onValueChanged
		slot8 = slot6
		slot7 = slot6.RemoveAllListeners

		slot7(slot8)
	end

	slot6 = setAnchoredPosition
	slot7 = slot0.skillPanel
	slot8 = {
		x = 0
	}

	slot6(slot7, slot8)
end

slot0.updateProperty = slot10

function slot10(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.getTaskIds
	slot2 = slot2(slot3)
	slot3 = slot0.taskContainer
	slot3 = slot3.childCount
	slot4 = slot3
	slot5 = #slot2
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = cloneTplTo
		slot9 = slot0.taskTpl
		slot10 = slot0.taskContainer

		slot8(slot9, slot10)
	end

	slot4 = slot0.taskContainer
	slot3 = slot4.childCount
	slot4 = 1
	slot5 = slot3
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		setActive(slot0.taskContainer:GetChild(slot7 - 1), slot7 <= #slot2)

		slot9 = slot0.taskTFs[slot7]

		if slot9 then
			slot9 = slot0.taskTFs
			slot9 = slot9[slot7]
			slot10 = slot9
			slot9 = slot9.clear

			slot9(slot10)
		end

		slot9 = #slot2

		if slot7 <= slot9 then
			slot9 = slot0.taskTFs
			slot9 = slot9[slot7]

			if not slot9 then
				slot9 = slot0.taskTFs
				slot11 = slot0
				slot10 = slot0.createTask
				slot12 = slot8
				slot10 = slot10(slot11, slot12)
				slot9[slot7] = slot10
			end

			slot9 = slot2[slot7]
			slot11 = slot0
			slot10 = slot0.getTaskById
			slot12 = slot9
			slot10 = slot10(slot11, slot12)
			slot11 = slot1.duration
			slot12 = 0

			if slot11 > slot12 then
				slot12 = slot1
				slot11 = slot1.getTaskOpenTimeStamp
				slot13 = slot9
				slot11 = slot11(slot12, slot13)
				slot12 = slot1.duration
				slot12 = slot11 - slot12
				slot10.leftTime = slot12
			end

			slot12 = slot1
			slot11 = slot1.getTaskStateById
			slot13 = slot9
			slot11 = slot11(slot12, slot13)
			slot10.taskState = slot11
			slot12 = slot1
			slot11 = slot1.getTaskOpenTimeStamp
			slot13 = slot9
			slot11 = slot11(slot12, slot13)
			slot10.dueTime = slot11
			slot10.index = slot7
			slot11 = slot0.taskTFs
			slot11 = slot11[slot7]
			slot12 = slot11
			slot11 = slot11.update
			slot13 = slot10

			slot11(slot12, slot13)
		end
	end
end

slot0.updateTaskList = slot10

function slot10(slot0, slot1)
	slot2 = {}
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/name"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.title = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/Text"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.desc = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/timer"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.timerTF = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/timer/Text"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.timerTFTxt = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/timer/open"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.timerOpen = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/timer/close"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.timerClose = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/slider/complete"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.maskAchieved = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/tip"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.tip = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/commit_panel/commit_btn"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.commitBtn = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/item_info"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.itemInfo = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "items"
	slot6 = slot2.itemInfo
	slot3 = slot3(slot4, slot5, slot6)
	slot2.itemContainer = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "item_tpl"
	slot6 = slot2.itemContainer
	slot3 = slot3(slot4, slot5, slot6)
	slot2.itemTpl = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/number"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.numberTF = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/slider"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.progressTF = slot3
	slot3 = slot2.progressTF
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = typeof
	slot6 = Slider
	slot3 = slot3(slot4, slot5(slot6))
	slot2.progessSlider = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/commit_panel/lock_btn"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.lockBtn = slot3
	slot3 = slot2.itemTpl
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "award/icon_bg/count"
	slot3 = slot3(slot4, slot5)
	slot2.itemCount = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/commit_panel/progress"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.progres = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/shadow"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.progreshadow = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/complete"
	slot3 = slot3(slot4, slot5)
	slot2.check = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/lock"
	slot3 = slot3(slot4, slot5)
	slot2.lock = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/working"
	slot3 = slot3(slot4, slot5)
	slot2.working = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/pause"
	slot3 = slot3(slot4, slot5)
	slot2.pause = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/pause_lock"
	slot3 = slot3(slot4, slot5)
	slot2.pauseLock = slot3
	slot2.view = slot0
	slot3 = onToggle
	slot4 = slot0
	slot5 = slot1

	function slot6(slot0)
		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.desc
		slot3 = slot0

		slot1(slot2, slot3)

		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.progreshadow
		slot3 = slot0

		slot1(slot2, slot3)

		if slot0 then
			slot1 = Canvas
			slot1 = slot1.ForceUpdateCanvases

			slot1()

			slot1 = slot1
			slot1 = slot1.taskContainer
			slot1 = slot1.parent
			slot1 = slot1.transform
			slot2 = slot1
			slot1 = slot1.InverseTransformPoint
			slot3 = slot2
			slot3 = slot3.position
			slot1 = slot1(slot2, slot3)
			slot1 = slot1.y
			slot2 = slot2
			slot2 = slot2.rect
			slot2 = slot2.height
			slot2 = slot1 - slot2
			slot3 = slot1
			slot3 = slot3.taskContainer
			slot3 = slot3.parent
			slot3 = slot3.transform
			slot3 = slot3.rect
			slot4 = 0
			slot5 = slot3.yMin

			if slot2 < slot5 then
				slot5 = slot3.yMin
				slot4 = slot5 - slot2
			end

			slot5 = slot3.yMax

			if slot5 < slot1 then
				slot5 = slot3.yMax
				slot4 = slot5 - slot1
			end

			slot5 = slot1
			slot5 = slot5.taskContainer
			slot5 = slot5.localPosition
			slot6 = slot5.y
			slot6 = slot6 + slot4
			slot5.y = slot6
			slot6 = slot1
			slot6 = slot6.taskContainer
			slot6.localPosition = slot5
			slot6 = slot0
			slot6 = slot6.progreshadow
			slot7 = Vector3
			slot8 = 39
			slot9 = slot0
			slot9 = slot9.desc
			slot9 = slot9.rect
			slot9 = slot9.height
			slot9 = 148 + slot9
			slot9 = slot9 - 150
			slot9 = -slot9
			slot7 = slot7(slot8, slot9)
			slot6.localPosition = slot7
		end
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	function slot3(slot0, slot1)
		slot3 = slot0
		slot2 = slot0.clearTimer

		slot2(slot3)

		slot2 = true
		slot0.autoCommit = slot2
		slot2 = false
		slot0.isExpTask = slot2
		slot2 = removeOnButton
		slot3 = slot0.commitBtn

		slot2(slot3)

		slot3 = slot0
		slot2 = slot0.updateItemInfo
		slot4 = slot1

		slot2(slot3, slot4)

		slot3 = slot0
		slot2 = slot0.updateView
		slot4 = slot1

		slot2(slot3, slot4)

		slot3 = slot0
		slot2 = slot0.updateProgress
		slot4 = slot1

		slot2(slot3, slot4)
	end

	slot2.update = slot3

	function slot3(slot0, slot1)
		slot0.taskVO = slot1
		slot2 = setText
		slot3 = slot0.title
		slot5 = slot1
		slot4 = slot1.getConfig
		slot6 = "name"

		slot2(slot3, slot4(slot5, slot6))

		slot2 = setText
		slot3 = slot0.desc
		slot5 = slot1
		slot4 = slot1.getConfig
		slot6 = "desc"
		slot4 = slot4(slot5, slot6)
		slot5 = "\n\n"
		slot4 = slot4 .. slot5

		slot2(slot3, slot4)

		slot2 = nil
		slot4 = slot1
		slot3 = slot1.getConfig
		slot5 = "target_num"
		slot3 = slot3(slot4, slot5)
		slot5 = slot1
		slot4 = slot1.getConfig
		slot6 = "sub_type"
		slot4 = slot4(slot5, slot6)
		slot5 = TASK_SUB_TYPE_GIVE_ITEM

		if slot4 == slot5 then
			slot5 = false
			slot0.autoCommit = slot5
			slot6 = slot1
			slot5 = slot1.getConfig
			slot7 = "target_id_for_client"
			slot5 = slot5(slot6, slot7)
			slot2 = slot5
		else
			slot5 = TASK_SUB_TYPE_PLAYER_RES

			if slot4 == slot5 then
				slot5 = false
				slot0.autoCommit = slot5
				slot5 = id2ItemId
				slot7 = slot1
				slot6 = slot1.getConfig
				slot8 = "target_id_for_client"
				slot5 = slot5(slot6(slot7, slot8))
				slot2 = slot5
			else
				slot5 = TASK_SUB_TYPE_PREV_TASK

				if slot4 == slot5 then
					slot5 = true
					slot0.isExpTask = slot5
					slot2 = 59000
				end
			end
		end

		setActive(slot0.itemContainer, not slot0.autoCommit or slot0.isExpTask)

		if slot2 then
			slot5 = updateDrop
			slot6 = slot0.itemTpl
			slot7 = slot6
			slot6 = slot6.Find
			slot8 = "award"
			slot6 = slot6(slot7, slot8)
			slot7 = {
				type = 2,
				id = slot2,
				count = slot3
			}

			slot5(slot6, slot7)

			slot5 = setText
			slot6 = slot0.itemCount
			slot7 = 1000

			slot5(slot6, math.floor(slot3 / 1000) .. "K" or slot3)
		end

		slot5 = setText
		slot6 = slot0.numberTF
		slot7 = slot1.index

		slot5(slot6, slot7)
	end

	slot2.updateItemInfo = slot3

	function slot3(slot0, slot1)
		slot2 = slot1.taskState
		slot3 = false
		slot4 = false
		slot5 = false
		slot6 = ShipBluePrint
		slot6 = slot6.TASK_STATE_PAUSE

		if slot2 == slot6 then
			slot6 = slot1.leftTime

			if slot6 then
				slot6 = getProxy
				slot7 = TaskProxy
				slot6 = slot6(slot7)
				slot7 = slot6
				slot6 = slot6.getTaskForBluePrint
				slot8 = slot1.id
				slot6 = slot6(slot7, slot8)

				if slot6 then
					slot8 = slot6
					slot7 = slot6.isFinish
					slot7 = slot7(slot8)
					slot3 = slot7
				end

				slot5 = slot1.leftTime > 0

				if slot6 then
					slot8 = slot6
					slot7 = slot6.isReceive
					slot7 = slot7(slot8)
					slot4 = slot7
				end

				slot7 = slot1.leftTime
				slot8 = 0

				if slot7 > slot8 then
					slot7 = setText
					slot8 = slot0
					slot8 = slot8.timerTFTxt
					slot9 = pg
					slot9 = slot9.TimeMgr
					slot10 = slot9
					slot9 = slot9.GetInstance
					slot9 = slot9(slot10)
					slot10 = slot9
					slot9 = slot9.DescCDTime
					slot11 = slot1.leftTime

					slot7(slot8, slot9(slot10, slot11))
				end
			end
		end

		slot6 = setActive
		slot7 = slot0.pause
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_PAUSE

		if slot8 ~= slot2 or slot3 or slot5 then
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_PAUSE

			if slot8 == slot2 and not slot5 then
				if slot3 then
					slot8 = slot0.autoCommit
					slot8 = not slot8
				end
			else
				slot8 = false
			end
		else
			slot8 = true
		end

		slot6(slot7, slot8)
		setActive(slot0.pauseLock, ShipBluePrint.TASK_STATE_PAUSE == slot2 and not slot3 and slot5)

		slot6 = setActive
		slot7 = slot0.lockBtn
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_ACHIEVED

		if slot2 ~= slot8 then
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_START

			if slot2 == slot8 then
				slot8 = slot0.autoCommit
				slot8 = not slot8
				slot8 = not slot8
			end
		else
			slot8 = false

			if false then
				slot8 = true
			end
		end

		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.commitBtn
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_ACHIEVED

		if slot2 ~= slot8 then
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_START

			if slot2 == slot8 then
				slot8 = slot0.autoCommit
				slot8 = not slot8
			else
				slot8 = false
			end
		else
			slot8 = true
		end

		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.progressTF
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_ACHIEVED
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_START
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_FINISHED

		slot6(slot7, slot2 == ShipBluePrint.TASK_STATE_PAUSE and not slot5)

		slot6 = setActive
		slot7 = slot0.lock
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_LOCK

		slot6(slot7, slot2 == ShipBluePrint.TASK_STATE_WAIT)

		slot6 = setActive
		slot7 = slot0.working
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_OPENING
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_START

		slot6(slot7, slot2 == ShipBluePrint.TASK_STATE_ACHIEVED)

		slot6 = setActive
		slot7 = slot0.maskAchieved
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_FINISHED

		slot6(slot7, slot2 == ShipBluePrint.TASK_STATE_PAUSE and slot4)

		slot6 = setActive
		slot7 = slot0.timerTF
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_WAIT
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_PAUSE
		slot8 = slot1.leftTime

		if slot8 then
			slot6(slot7, slot1.leftTime > 0)

			slot6 = setActive
			slot7 = slot0.check
			slot8 = slot0.autoCommit
		end

		slot8 = TASK_STATE_ACHIEVED
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_FINISHED

		slot6(slot7, slot2 == ShipBluePrint.TASK_STATE_PAUSE and slot4)
		setActive(slot0.tip, slot2 == ShipBluePrint.TASK_STATE_ACHIEVED)
		setActive(slot0.timerOpen, slot2 == ShipBluePrint.TASK_STATE_WAIT)

		slot6 = setActive
		slot7 = slot0.timerClose
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_PAUSE
		slot8 = slot1.leftTime

		if slot8 then
			slot6(slot7, slot1.leftTime > 0)

			return
		end
	end

	slot2.updateView = slot3

	function slot3(slot0, slot1)
		slot2 = slot1.taskState
		slot4 = slot1
		slot3 = slot1.getProgress
		slot3 = slot3(slot4)
		slot5 = slot1
		slot4 = slot1.getConfig
		slot6 = "target_num"
		slot4 = slot4(slot5, slot6)
		slot3 = slot3 / slot4
		slot4 = ShipBluePrint
		slot4 = slot4.TASK_STATE_WAIT

		if slot2 == slot4 then
			slot5 = slot0
			slot4 = slot0.addTimer
			slot6 = slot1
			slot7 = slot1.dueTime

			slot4(slot5, slot6, slot7)

			slot3 = 0
		else
			slot4 = ShipBluePrint
			slot4 = slot4.TASK_STATE_OPENING

			if slot2 == slot4 then
				slot3 = 0
				slot4 = slot0.view
				slot5 = slot4
				slot4 = slot4.emit
				slot6 = ShipBluePrintMediator
				slot6 = slot6.ON_TASK_OPEN
				slot7 = slot1.id

				slot4(slot5, slot6, slot7)
			else
				slot4 = ShipBluePrint
				slot4 = slot4.TASK_STATE_PAUSE

				if slot2 == slot4 then
				else
					slot4 = ShipBluePrint
					slot4 = slot4.TASK_STATE_LOCK

					if slot2 == slot4 then
						slot3 = 0
					else
						slot4 = ShipBluePrint
						slot4 = slot4.TASK_STATE_ACHIEVED

						if slot2 == slot4 then
							slot4 = onButton
							slot5 = slot0.view
							slot6 = slot0.commitBtn

							function slot7()
								slot0 = slot0
								slot0 = slot0.view
								slot1 = slot0
								slot0 = slot0.emit
								slot2 = ShipBluePrintMediator
								slot2 = slot2.ON_FINISH_TASK
								slot3 = slot1
								slot3 = slot3.id

								slot0(slot1, slot2, slot3)
							end

							slot8 = SFX_PANEL

							slot4(slot5, slot6, slot7, slot8)

							slot3 = 1
						else
							slot4 = ShipBluePrint
							slot4 = slot4.TASK_STATE_FINISHED

							if slot2 == slot4 then
								slot3 = 1
							else
								slot4 = ShipBluePrint
								slot4 = slot4.TASK_STATE_START

								if slot2 == slot4 then
									slot4 = slot0.autoCommit

									if not slot4 then
										slot4 = onButton
										slot5 = slot0.view
										slot6 = slot0.commitBtn

										function slot7()
											slot0 = slot0
											slot0 = slot0.view
											slot1 = slot0
											slot0 = slot0.emit
											slot2 = ShipBluePrintMediator
											slot2 = slot2.ON_FINISH_TASK
											slot3 = slot1
											slot3 = slot3.id

											slot0(slot1, slot2, slot3)
										end

										slot8 = SFX_PANEL

										slot4(slot5, slot6, slot7, slot8)

										slot3 = 0
									end
								end
							end
						end
					end
				end
			end
		end

		slot4 = slot0.progessSlider
		slot4.value = slot3
		slot4 = math
		slot4 = slot4.floor
		slot5 = slot3 * 100
		slot4 = slot4(slot5)
		slot5 = setText
		slot6 = slot0.progres
		slot7 = math
		slot7 = slot7.ceil
		slot8 = math
		slot8 = slot8.min
		slot9 = slot4
		slot10 = 100
		slot7 = slot7(slot8(slot9, slot10))
		slot8 = "%"
		slot7 = slot7 .. slot8

		slot5(slot6, slot7)

		slot5 = setText
		slot6 = slot0.progreshadow
		slot7 = math
		slot7 = slot7.min
		slot8 = slot4
		slot9 = 100
		slot7 = slot7(slot8, slot9)
		slot8 = "%"
		slot7 = slot7 .. slot8

		slot5(slot6, slot7)
	end

	slot2.updateProgress = slot3

	function slot3(slot0, slot1, slot2)
		function slot3()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.clearTimer

			slot0(slot1)

			slot0 = setText
			slot1 = slot0
			slot1 = slot1.timerTFTxt
			slot2 = "00:00:00"

			slot0(slot1, slot2)

			slot0 = slot0
			slot0 = slot0.view
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ShipBluePrintMediator
			slot2 = slot2.ON_TASK_OPEN
			slot3 = slot1
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)
		end

		slot5 = slot0
		slot4 = slot0.clearTimer

		slot4(slot5)

		slot4 = Timer
		slot4 = slot4.New

		function slot5()
			slot0 = pg
			slot0 = slot0.TimeMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.GetServerTime
			slot0 = slot0(slot1)
			slot1 = slot0
			slot1 = slot1 - slot0
			slot2 = 0

			if slot1 > slot2 then
				slot2 = setText
				slot3 = slot1
				slot3 = slot3.timerTFTxt
				slot4 = pg
				slot4 = slot4.TimeMgr
				slot4 = slot4.GetInstance
				slot4 = slot4()
				slot5 = slot4
				slot4 = slot4.DescCDTime
				slot6 = slot1

				slot2(slot3, slot4(slot5, slot6))
			else
				slot2 = slot2

				slot2()
			end
		end

		slot6 = 1
		slot7 = -1
		slot4 = slot4(slot5, slot6, slot7)
		slot0.taskTimer = slot4
		slot4 = slot0.taskTimer
		slot5 = slot4
		slot4 = slot4.Start

		slot4(slot5)

		slot4 = slot0.taskTimer
		slot4 = slot4.func

		slot4()
	end

	slot2.addTimer = slot3

	function slot3(slot0)
		slot1 = slot0.taskTimer

		if slot1 then
			slot1 = slot0.taskTimer
			slot2 = slot1
			slot1 = slot1.Stop

			slot1(slot2)

			slot1 = nil
			slot0.taskTimer = slot1
		end
	end

	slot2.clearTimer = slot3

	function slot3(slot0)
		slot2 = slot0
		slot1 = slot0.clearTimer

		slot1(slot2)
	end

	slot2.clear = slot3

	return slot2
end

slot0.createTask = slot10

function slot10(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO

	if slot1 then
		slot2 = setActive
		slot3 = slot0.preViewer
		slot4 = true

		slot2(slot3, slot4)

		slot2 = SetParent
		slot3 = slot0.leftPanle
		slot4 = slot0._tf

		slot2(slot3, slot4)

		slot2 = SetParent
		slot3 = slot0.rightPanel
		slot4 = slot0._tf

		slot2(slot3, slot4)

		slot2 = SetParent
		slot3 = slot0.bottomPanel
		slot4 = slot0._tf

		slot2(slot3, slot4)

		slot2 = pg
		slot2 = slot2.UIMgr
		slot3 = slot2
		slot2 = slot2.GetInstance
		slot2 = slot2(slot3)
		slot3 = slot2
		slot2 = slot2.BlurPanel
		slot4 = slot0.preViewer

		slot2(slot3, slot4)

		slot3 = slot0
		slot2 = slot0.playLoadingAni

		slot2(slot3)

		slot3 = slot1
		slot2 = slot1.getShipVO
		slot2 = slot2(slot3)
		slot0.viewShipVO = slot2
		slot3 = slot0
		slot2 = slot0.getStages
		slot4 = slot0.viewShipVO
		slot2 = slot2(slot3, slot4)
		slot0.breakIds = slot2
		slot2 = 1
		slot3 = slot0
		slot4 = 1

		for slot5 = slot2, slot3, slot4 do
			slot6 = slot0.breakIds
			slot6 = slot6[slot5]
			slot7 = slot1
			slot7 = slot7[slot6]
			slot9 = slot0
			slot8 = slot0.findTF
			slot10 = "stage"
			slot11 = slot5
			slot10 = slot10 .. slot11
			slot11 = slot0.stages
			slot8 = slot8(slot9, slot10, slot11)
			slot9 = onToggle
			slot10 = slot0
			slot11 = slot8

			function slot12(slot0)
				if slot0 then
					slot1 = setText
					slot2 = slot0
					slot2 = slot2.breakView
					slot3 = slot1
					slot4 = slot2
					slot3 = slot3[slot4]
					slot3 = slot3.breakout_view

					slot1(slot2, slot3)

					slot1 = slot0
					slot2 = slot1
					slot1 = slot1.switchStage
					slot3 = slot2

					slot1(slot2, slot3)
				end
			end

			slot13 = SFX_PANEL

			slot9(slot10, slot11, slot12, slot13)

			if slot5 == 1 then
				slot9 = triggerToggle
				slot10 = slot8
				slot11 = true

				slot9(slot10, slot11)
			end
		end

		slot2 = true
		slot0.isShowPreview = slot2
		slot3 = slot0
		slot2 = slot0.updateMaxLevelAttrs
		slot4 = slot1

		slot2(slot3, slot4)
	end
end

slot0.openPreView = slot10
slot10 = {}
slot11 = AttributeType
slot11 = slot11.Durability
slot10[1] = slot11
slot11 = AttributeType
slot11 = slot11.Cannon
slot10[2] = slot11
slot11 = AttributeType
slot11 = slot11.Torpedo
slot10[3] = slot11
slot11 = AttributeType
slot11 = slot11.AntiAircraft
slot10[4] = slot11
slot11 = AttributeType
slot11 = slot11.Air
slot10[5] = slot11
slot11 = AttributeType
slot11 = slot11.Reload
slot10[6] = slot11
slot11 = AttributeType
slot11 = slot11.ArmorType
slot10[7] = slot11
slot11 = AttributeType
slot11 = slot11.Dodge
slot10[8] = slot11
slot0.MAX_LEVEL_ATTRS = slot10

function slot10(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.isFetched
	slot2 = slot2(slot3)

	if not slot2 then
		return
	end

	slot2 = slot0.shipVOs
	slot3 = slot1.shipId
	slot2 = slot2[slot3]
	slot3 = Clone
	slot4 = slot2
	slot3 = slot3(slot4)
	slot4 = 120
	slot3.level = slot4
	slot4 = Clone
	slot5 = slot1
	slot4 = slot4(slot5)
	slot6 = slot1
	slot5 = slot1.getMaxLevel
	slot5 = slot5(slot6)
	slot4.level = slot5
	slot5 = intProperties
	slot7 = slot4
	slot6 = slot4.getShipProperties
	slot8 = slot3
	slot9 = false
	slot5 = slot5(slot6(slot7, slot8, slot9))
	slot6 = ipairs
	slot7 = slot0
	slot7 = slot7.MAX_LEVEL_ATTRS
	slot6, slot7, slot8 = slot6(slot7)

	for slot9, slot10 in slot6, slot7, slot8 do
		slot11 = slot0.previewAttrContainer
		slot12 = slot11
		slot11 = slot11.Find
		slot13 = slot10
		slot11 = slot11(slot12, slot13)
		slot12 = AttributeType
		slot12 = slot12.ArmorType

		if slot10 == slot12 then
			slot12 = setText
			slot14 = slot11
			slot13 = slot11.Find
			slot15 = "bg/value"
			slot13 = slot13(slot14, slot15)
			slot15 = slot2
			slot14 = slot2.getShipArmorName

			slot12(slot13, slot14(slot15))
		else
			setText(slot11:Find("bg/value"), slot5[slot10] or 0)
		end

		slot12 = setText
		slot14 = slot11
		slot13 = slot11.Find
		slot15 = "bg/name"
		slot13 = slot13(slot14, slot15)
		slot14 = AttributeType
		slot14 = slot14.Type2Name
		slot15 = slot10

		slot12(slot13, slot14(slot15))
	end
end

slot0.updateMaxLevelAttrs = slot10

function slot10(slot0, slot1)
	slot2 = slot0.previewer

	if slot2 then
		slot2 = slot0.previewer
		slot3 = slot2
		slot2 = slot2.clear

		slot2(slot3)

		slot2 = nil
		slot0.previewer = slot2
	end

	slot2 = setActive
	slot3 = slot0.preViewer
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.rawImage
	slot4 = false

	slot2(slot3, slot4)

	if not slot1 then
		slot2 = SetParent
		slot3 = slot0.leftPanle
		slot4 = pg
		slot4 = slot4.UIMgr
		slot5 = slot4
		slot4 = slot4.GetInstance
		slot4 = slot4(slot5)
		slot4 = slot4.OverlayMain

		slot2(slot3, slot4)

		slot2 = SetParent
		slot3 = slot0.rightPanel
		slot4 = pg
		slot4 = slot4.UIMgr
		slot5 = slot4
		slot4 = slot4.GetInstance
		slot4 = slot4(slot5)
		slot4 = slot4.OverlayMain

		slot2(slot3, slot4)

		slot2 = SetParent
		slot3 = slot0.bottomPanel
		slot4 = pg
		slot4 = slot4.UIMgr
		slot5 = slot4
		slot4 = slot4.GetInstance
		slot4 = slot4(slot5)
		slot4 = slot4.OverlayMain

		slot2(slot3, slot4)
	end

	slot2 = pg
	slot2 = slot2.UIMgr
	slot3 = slot2
	slot2 = slot2.GetInstance
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.UnblurPanel
	slot4 = slot0.preViewer
	slot5 = slot0._tf

	slot2(slot3, slot4, slot5)

	slot2 = nil
	slot0.isShowPreview = slot2
end

slot0.closePreview = slot10

function slot10(slot0)
	slot1 = setActive
	slot2 = slot0.seaLoading
	slot3 = true

	slot1(slot2, slot3)
end

slot0.playLoadingAni = slot10

function slot10(slot0)
	slot1 = setActive
	slot2 = slot0.seaLoading
	slot3 = false

	slot1(slot2, slot3)
end

slot0.stopLoadingAni = slot10

function slot10(slot0)
	slot1 = WeaponPreviewer
	slot1 = slot1.New
	slot2 = slot0.rawImage
	slot1 = slot1(slot2)
	slot0.previewer = slot1
	slot1 = slot0.previewer
	slot2 = slot1
	slot1 = slot1.configUI
	slot3 = slot0.healTF

	slot1(slot2, slot3)

	slot1 = slot0.previewer
	slot2 = slot1
	slot1 = slot1.setDisplayWeapon
	slot4 = slot0
	slot3 = slot0.getWaponIdsById
	slot5 = slot0.breakOutId

	slot1(slot2, slot3(slot4, slot5))

	slot1 = slot0.previewer
	slot2 = slot1
	slot1 = slot1.load
	slot3 = 40000
	slot4 = slot0.viewShipVO
	slot6 = slot0
	slot5 = slot0.getAllWeaponIds
	slot5 = slot5(slot6)

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.stopLoadingAni

		slot0(slot1)
	end

	slot1(slot2, slot3, slot4, slot5, slot6)
end

slot0.showBarrage = slot10

function slot10(slot0, slot1)
	slot2 = slot0
	slot2 = slot2[slot1]
	slot2 = slot2.weapon_ids

	return slot2
end

slot0.getWaponIdsById = slot10

function slot10(slot0)
	slot1 = {}
	slot2 = ipairs
	slot3 = slot0.breakIds
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = Clone
		slot8 = slot0
		slot8 = slot8[slot6]
		slot8 = slot8.weapon_ids
		slot7 = slot7(slot8)
		slot8 = {}

		function slot9(slot0, slot1)
			slot2 = ipairs
			slot3 = slot0
			slot2, slot3, slot4 = slot2(slot3)

			for slot5, slot6 in slot2, slot3, slot4 do
				slot7 = table
				slot7 = slot7.contains
				slot8 = slot1
				slot9 = slot6
				slot7 = slot7(slot8, slot9)

				if not slot7 then
					slot7 = table
					slot7 = slot7.insert
					slot8 = slot1
					slot9 = slot6

					slot7(slot8, slot9)
				end
			end

			return slot1
		end

		slot8.__add = slot9
		slot9 = setmetatable
		slot10 = slot1
		slot11 = slot8

		slot9(slot10, slot11)

		slot1 = slot1 + slot7
	end

	return slot1
end

slot0.getAllWeaponIds = slot10

function slot10(slot0, slot1)
	slot2 = {}
	slot3 = math
	slot3 = slot3.floor
	slot4 = slot1.configId
	slot4 = slot4 / 10
	slot3 = slot3(slot4)
	slot4 = 1
	slot5 = 4
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = tonumber
		slot9 = slot3
		slot10 = slot7
		slot9 = slot9 .. slot10
		slot8 = slot8(slot9)
		slot9 = table
		slot9 = slot9.insert
		slot10 = slot2
		slot11 = slot8

		slot9(slot10, slot11)
	end

	return slot2
end

slot0.getStages = slot10

function slot10(slot0, slot1)
	slot2 = slot0.breakOutId

	if slot2 == slot1 then
		return
	end

	slot0.breakOutId = slot1
	slot2 = slot0.previewer

	if slot2 then
		slot2 = slot0.previewer
		slot3 = slot2
		slot2 = slot2.setDisplayWeapon
		slot5 = slot0
		slot4 = slot0.getWaponIdsById
		slot6 = slot0.breakOutId

		slot2(slot3, slot4(slot5, slot6))
	end
end

slot0.switchStage = slot10

function slot10(slot0)
	slot1 = pairs
	slot2 = slot0.taskTFs or {}
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.clear

		slot6(slot7)
	end
end

slot0.clearTimers = slot10

function slot10(slot0, slot1, slot2)
	slot3 = tf
	slot4 = Instantiate
	slot5 = slot1
	slot3 = slot3(slot4(slot5))
	slot4 = SetActive
	slot5 = slot3
	slot6 = true

	slot4(slot5, slot6)

	slot5 = slot3
	slot4 = slot3.SetParent
	slot6 = tf
	slot7 = slot2
	slot6 = slot6(slot7)
	slot7 = false

	slot4(slot5, slot6, slot7)

	return slot3
end

slot0.cloneTplTo = slot10

function slot10(slot0)
	slot1 = slot0.isShowPreview

	if slot1 then
		slot2 = slot0
		slot1 = slot0.closePreview
		slot3 = true

		slot1(slot2, slot3)

		return
	end

	slot2 = slot0
	slot1 = slot0.inModAnim
	slot1 = slot1(slot2)

	if slot1 then
		return
	end

	slot2 = slot0
	slot1 = slot0.emit
	slot3 = slot0
	slot3 = slot3.ON_BACK_PRESSED

	slot1(slot2, slot3)
end

slot0.onBackPressed = slot10

function slot10(slot0)
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot3 = slot1
	slot2 = slot1.PartialBlur
	slot4 = slot0.leftPanle
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "property_panel/init_panel"
	slot4 = slot4(slot5, slot6)
	slot5 = false

	slot2(slot3, slot4, slot5)

	slot3 = slot1
	slot2 = slot1.ClearPartialMask

	slot2(slot3)

	slot2 = SetParent
	slot3 = slot0.leftPanle
	slot4 = slot0._tf

	slot2(slot3, slot4)

	slot2 = SetParent
	slot3 = slot0.rightPanel
	slot4 = slot0._tf

	slot2(slot3, slot4)

	slot2 = SetParent
	slot3 = slot0.bottomPanel
	slot4 = slot0._tf

	slot2(slot3, slot4)

	slot2 = slot0.lastPaintingName

	if slot2 then
		slot2 = retPaintingPrefab
		slot3 = slot0.painting
		slot4 = slot0.lastPaintingName

		slot2(slot3, slot4)
	end

	slot2 = pairs
	slot3 = slot0.taskTFs or {}
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.clear

		slot7(slot8)
	end

	slot3 = slot0
	slot2 = slot0.closePreview
	slot4 = true

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.clearLeanTween
	slot4 = true

	slot2(slot3, slot4)

	slot2 = nil
	slot0.nameTxts = slot2
	slot2 = slot0.previewer

	if slot2 then
		slot2 = slot0.previewer
		slot3 = slot2
		slot2 = slot2.clear

		slot2(slot3)

		slot2 = nil
		slot0.previewer = slot2
	end
end

slot0.willExit = slot10

function slot10(slot0)
	slot1 = LeanTween
	slot1 = slot1.cancel
	slot2 = go
	slot3 = slot0.painting

	slot1(slot2(slot3))

	slot1 = LeanTween
	slot1 = slot1.moveY
	slot2 = rtf
	slot3 = slot0.painting
	slot2 = slot2(slot3)
	slot3 = slot0
	slot4 = slot1
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.setLoopPingPong
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.setEase
	slot3 = LeanTweenType
	slot3 = slot3.easeInOutCubic
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.setFrom
	slot3 = 0

	slot1(slot2, slot3)
end

slot0.paintBreath = slot10

function slot10(slot0)
	slot1 = slot0.progressPanel
	slot2 = Vector3
	slot3 = 0
	slot4 = 1
	slot5 = 1
	slot2 = slot2(slot3, slot4, slot5)
	slot1.localScale = slot2
	slot1 = LeanTween
	slot1 = slot1.scale
	slot2 = slot0.progressPanel
	slot3 = Vector3
	slot4 = 1
	slot5 = 1
	slot6 = 1
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = 0.2
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.setDelay
	slot3 = 2

	slot1(slot2, slot3)

	function slot1()
		slot0 = slot0
		slot0 = slot0.awakenAni
		slot1 = slot0
		slot0 = slot0.SetActive
		slot2 = true

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = true
		slot0.awakenPlay = slot1
		slot0 = tf
		slot1 = slot0
		slot1 = slot1.awakenAni
		slot0 = slot0(slot1)
		slot1 = pg
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.BlurPanel
		slot3 = slot0
		slot3 = slot3.awakenAni

		slot1(slot2, slot3)

		slot2 = slot0
		slot1 = slot0.SetAsLastSibling

		slot1(slot2)

		slot1 = setText
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.findTF
		slot4 = "window/desc"
		slot5 = slot0
		slot5 = slot5.awakenAni
		slot2 = slot2(slot3, slot4, slot5)
		slot3 = desc

		slot1(slot2, slot3)

		slot2 = slot0
		slot1 = slot0.GetComponent
		slot3 = "DftAniEvent"
		slot1 = slot1(slot2, slot3)
		slot3 = slot1
		slot2 = slot1.SetEndEvent

		function slot4(slot0)
			slot1 = IsNil
			slot2 = slot0
			slot2 = slot2.awakenAni
			slot1 = slot1(slot2)

			if not slot1 then
				slot1 = slot0
				slot1 = slot1.awakenAni
				slot2 = slot1
				slot1 = slot1.GetComponent
				slot3 = "Animator"
				slot1 = slot1(slot2, slot3)
				slot2 = slot1
				slot1 = slot1.SetBool
				slot3 = "endFlag"
				slot4 = false

				slot1(slot2, slot3, slot4)

				slot1 = pg
				slot1 = slot1.UIMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.UnblurPanel
				slot3 = slot0
				slot3 = slot3.awakenAni
				slot4 = slot0
				slot4 = slot4.common

				slot1(slot2, slot3, slot4)

				slot1 = slot0
				slot1 = slot1.awakenAni
				slot2 = slot1
				slot1 = slot1.SetActive
				slot3 = false

				slot1(slot2, slot3)

				slot1 = slot0
				slot2 = false
				slot1.awakenPlay = slot2
			end
		end

		slot2(slot3, slot4)
	end

	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "researchStartWindow(Clone)"
	slot2 = slot2(slot3, slot4)

	if slot2 then
		slot3 = go
		slot4 = slot2
		slot3 = slot3(slot4)
		slot0.awakenAni = slot3
	end

	slot3 = slot0.awakenAni

	if not slot3 then
		slot3 = PoolMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.GetUI
		slot5 = "researchStartWindow"
		slot6 = true

		function slot7(slot0)
			slot2 = slot0
			slot1 = slot0.SetActive
			slot3 = true

			slot1(slot2, slot3)

			slot1 = slot0
			slot1.awakenAni = slot0
			slot1 = slot1

			slot1()
		end

		slot3(slot4, slot5, slot6, slot7)
	else
		slot3 = slot1

		slot3()
	end
end

slot0.buildStartAni = slot10

return slot0
