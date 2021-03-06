slot0 = class("ColoringScene", import("..base.BaseUI"))
slot0.Letters = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G"
}
slot0.CharPrefab = "anshan"
slot0.PageNums = 5

function slot0.getUIName(slot0)
	return "ColoringUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
end

function slot0.setColorItems(slot0, slot1)
	slot0.colorItems = slot1
end

function slot0.setColorGroups(slot0, slot1)
	slot0.colorGroups = slot1
end

function slot0.init(slot0)
	slot0.topPanel = slot0:findTF("top")
	slot0.btnBack = slot0:findTF("top/back")
	slot0.ship = slot0:findTF("ship")
	slot0.title = slot0:findTF("title_bar/text")
	slot0.bg = slot0:findTF("container/bg")
	slot0.zoom = slot0.bg:GetComponent("Zoom")
	slot0.zoom.maxZoom = 3
	slot0.cells = slot0:findTF("cells", slot0.bg)
	slot0.cell = slot0:findTF("cell", slot0.bg)
	slot0.lines = slot0:findTF("lines", slot0.bg)
	slot0.line = slot0:findTF("line", slot0.bg)
	slot0.btnHelp = slot0:findTF("btnHelp")
	slot0.btnShare = slot0:findTF("btnShare")
	slot0.toggleAward = slot0:findTF("award_bar/award")
	slot0.toggleAwardWhite = slot0:findTF("award_bar/award_white/toggle")
	slot0.groupAward = slot0:findTF("award_bar/awards")
	slot0.btnPageLast = slot0:findTF("award_bar/page_last")
	slot0.btnPageNext = slot0:findTF("award_bar/page_next")
	slot0.scrollColor = slot0:findTF("color_bar/scroll")
	slot0.groupColor = slot0:findTF("content", slot0.scrollColor)
	slot0.barExtra = slot0:findTF("color_bar/extra")
	slot0.toggleEraser = slot0:findTF("eraser", slot0.barExtra)
	slot0.btnEraserAll = slot0:findTF("eraser_all", slot0.barExtra)
	slot0.arrowDown = slot0:findTF("arrow", slot0.barExtra)
	slot0.awardDisplay = slot0:findTF("award_display")
	slot0.resource = slot0:findTF("resource")

	setActive(slot0.cell, false)
	setActive(slot0.line, false)
	setActive(slot0.toggleAward, false)
	setActive(slot0.toggleAwardWhite, false)
	setActive(slot0.barExtra, false)
	setActive(slot0.awardDisplay, false)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btnBack, function ()
		if slot0.exited then
			return
		end

		slot0:uiExitAnimating()
		slot0.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.3)
	end, SOUND_BACK)
	onButton(slot0, slot0.btnHelp, function ()
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = i18n("coloring_help_tip")
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.btnShare, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeColoring)
	end, SFX_PANEL)
	onNextTick(function ()
		if slot0.exited then
			return
		end

		slot0:uiStartAnimating()
	end)
	slot0:initColoring()
	slot0:loadChar()
end

function slot0.uiStartAnimating(slot0)
	slot0.topPanel.anchoredPosition = Vector2(0, slot0.topPanel.rect.height)

	shiftPanel(slot0.topPanel, nil, 0, slot2, slot1, true, true, nil, function ()
		slot0:dispatchUILoaded(true)
	end)

	slot0.tweens = topAnimation(slot0:findTF("bg/left", slot0.topPanel), slot0:findTF("bg/right", slot0.topPanel), slot0:findTF("bg/title_vote", slot0.topPanel), slot0:findTF("bg/Text", slot0.topPanel), 0.27, function ()
		slot0.tweens = nil
	end)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.topPanel, nil, slot0.topPanel.rect.height, dur, delay, true, true, nil, function ()
		slot0:dispatchUILoaded(true)
	end)
end

function slot0.loadChar(slot0)
	PoolMgr.GetInstance():GetSpineChar(slot0.CharPrefab, true, function (slot0)
		if slot0.exited then
			PoolMgr.GetInstance():ReturnSpineChar(slot1.CharPrefab, slot0)
		else
			slot0.transform.localScale = Vector3.New(0.7, 0.7, 0.7)

			slot0:GetComponent(typeof(SpineAnimUI)):SetAction("stand", 0)
			setParent(slot0, slot0.ship, false)

			slot0.charModel = slot0
		end
	end)
end

function slot0.unloadChar(slot0)
	if slot0.charModel then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.CharPrefab, slot0.charModel)

		slot0.charModel = nil
	end
end

function slot0.initColoring(slot0)
	onButton(slot0, slot0.btnEraserAll, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("coloring_erase_all_warning"),
			onYes = function ()
				if slot0.colorGroups[slot0.selectedIndex]:canBeCustomised() then
					slot0:emit(ColoringMediator.EVENT_COLORING_CLEAR, {
						activityId = slot0.activity.id,
						id = slot0.id
					})
				end
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.arrowDown, function ()
		slot0.scrollColor:GetComponent(typeof(ScrollRect)).verticalNormalizedPosition = 0
	end, SFX_PANEL)
	onButton(slot0, slot0.btnPageLast, function ()
		if slot0.currentPage == 1 then
			slot0.currentPage = 0

			slot0:updatePage()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.btnPageNext, function ()
		if slot0.currentPage == 0 then
			slot0.currentPage = 1

			slot0:updatePage()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.toggleAwardWhite, function ()
		for slot3, slot4 in ipairs(slot0.colorGroups) do
			if slot4:canBeCustomised() and slot0.selectedIndex ~= slot3 then
				if (slot0.selectedIndex - 1) % slot1.PageNums >= 0 and slot5 < slot0.groupAward.childCount then
					setActive(slot0.groupAward:GetChild(slot5):Find("selected"), false)
				end

				slot0.selectedIndex = slot3

				setActive(slot0.toggleAwardWhite:Find("selected"), true)
				slot0:tryPlayStory()
				slot0:updateSelectedColoring()
			end
		end
	end, SFX_PANEL)

	slot1 = 1

	for slot5 = 1, #slot0.colorGroups, 1 do
		if slot0.colorGroups[slot5]:getState() == ColorGroup.StateColoring then
			slot1 = slot5

			break
		end
	end

	slot0.currentPage = math.floor((slot1 - 1) / slot0.PageNums)

	slot0:updatePage()

	slot0.selectedIndex = 0

	if slot0.colorGroups[slot1]:canBeCustomised() then
		triggerButton(slot0.toggleAwardWhite, true)
	else
		triggerButton(slot0.groupAward:GetChild((slot1 - 1) % slot0.PageNums), true)
	end

	slot0.selectedColorIndex = 1

	triggerToggle(slot0.groupColor:GetChild(slot0.selectedColorIndex - 1), true)
end

function slot0.updatePage(slot0)
	slot1 = UIItemList.New(slot0.groupAward, slot0.toggleAward)

	slot1:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
		end
	end)
	slot1:align((slot0.currentPage == 0 and slot0.PageNums) or #slot0.colorGroups - slot0.PageNums - 1)

	slot0.awardList = slot1

	setActive(slot0.toggleAwardWhite, slot0.currentPage == 1 and _.any(slot0.colorGroups, function (slot0)
		return slot0:canBeCustomised() and slot0:getState() == ColorGroup.StateColoring
	end))
	slot0:updateColoring()
end

function slot0.updateColoring(slot0)
	slot0.awardList:each(function (slot0, slot1)
		if not isActive(slot1) then
			return
		end

		if not slot0.colorGroups[slot0.currentPage * slot1.PageNums + slot0 + 1]:canBeCustomised() then
			setImageSprite(slot1:Find("number"), getImageSprite(slot0.resource:Find(tostring(slot2))), true)

			if slot3:getState() == ColorGroup.StateLock then
				setImageColor(slot1:Find("bg"), Color.gray)
				setImageColor(slot1:Find("number"), Color.gray)
			else
				setImageColor(slot1:Find("bg"), Color.white)
				setImageColor(slot1:Find("number"), Color.white)
			end

			setActive(slot1:Find("get"), slot4 == ColorGroup.StateAchieved)
			onButton(slot0, slot1, function ()
				if slot0:getState().selectedIndex ~= slot2 and slot0 ~= ColorGroup.StateLock then
					if slot1.colorGroups[slot1.selectedIndex] then
						if slot1:canBeCustomised() then
							setActive(slot1.toggleAwardWhite:Find("selected"), false)
						else
							setActive(slot1.groupAward:GetChild(slot2):Find("selected"), false)
						end
					end

					slot1.selectedIndex = slot1

					setActive(slot4:Find("selected"), true)
					slot1:tryPlayStory()
					slot1:updateSelectedColoring()
				elseif slot0 == ColorGroup.StateLock then
					pg.TipsMgr.GetInstance():ShowTips(i18n("coloring_lock"))
				end
			end, SFX_PANEL)
		end

		setActive(slot1:Find("selected"), slot0.selectedIndex == slot2)
	end)
	setActive(slot0.toggleAwardWhite:Find("selected"), slot0.colorGroups[slot0.selectedIndex] and slot1:canBeCustomised())
end

function slot0.updateSelectedColoring(slot0)
	slot2 = slot0.colorGroups[slot0.selectedIndex].getConfig(slot1, "color_id_list")
	slot3 = slot0.colorGroups[slot0.selectedIndex].colors

	for slot7 = 0, slot0.groupColor.childCount - 1, 1 do
		setText(slot0.groupColor:GetChild(slot7).Find(slot8, "nums"), slot0.colorItems[slot2[slot7 + 1]] or 0)
		onToggle(slot0, slot8, function (slot0)
			if slot0 then
				slot0.selectedColorIndex = slot1 + 1
			end
		end, SFX_PANEL)
	end

	setText(slot0.title, slot1:getConfig("name"))
	setActive(slot0.title.parent, false)
	setActive(slot0.barExtra, slot1:canBeCustomised())

	slot0.scrollColor.sizeDelta.y = (slot1:canBeCustomised() and 480) or 634
	slot0.scrollColor.sizeDelta = slot0.scrollColor.sizeDelta
	slot0.scrollColor:GetComponent(typeof(ScrollRect)).verticalNormalizedPosition = 1

	setActive(slot0.scrollColor, false)
	setActive(slot0.scrollColor, true)
	onToggle(slot0, slot0.toggleEraser, function ()
		slot0.selectedColorIndex = 0
	end, SFX_PANEL)

	slot0.cellSize = slot0:calcCellSize()

	slot0:updateCells()
	slot0:updateLines()
end

function slot0.updateCells(slot0)
	slot5, slot3 = unpack(slot0.colorGroups[slot0.selectedIndex].getConfig(slot1, "theme"))

	for slot7 = 0, slot2, 1 do
		for slot11 = 0, slot3, 1 do
			slot0:updateCell(slot7, slot11)
		end
	end

	slot4 = slot0.bg:GetComponent("EventTriggerListener")

	slot4:RemovePointClickFunc()
	slot4:RemoveBeginDragFunc()
	slot4:RemoveDragFunc()
	slot4:RemoveDragEndFunc()

	slot5 = false

	slot4:AddPointClickFunc(function (slot0, slot1)
		if slot0 then
			return
		end

		slot2 = LuaHelper.ScreenToLocal(slot1.bg, slot1.position, GameObject.Find("UICamera"):GetComponent(typeof(Camera)))
		slot5 = slot2:getCell(slot3, math.floor(slot2.x / slot1.cellSize.x))

		if slot2:getState() == ColorGroup.StateColoring then
			function slot6()
				slot0:emit(ColoringMediator.EVENT_COLORING_CELL, {
					activityId = slot0.activity.id,
					id = slot1.id,
					cells = slot0:searchColoringCells(slot0, ColoringMediator.EVENT_COLORING_CELL, , slot0.selectedColorIndex)
				})
			end

			if not slot2:canBeCustomised() then
				if slot1.selectedColorIndex == 0 or not slot5 or slot2:hasFill(slot3, slot4) then
					return
				end

				if slot5.type ~= slot1.selectedColorIndex then
					pg.TipsMgr.GetInstance():ShowTips(i18n("coloring_color_missmatch"))

					return
				end

				if (slot1.colorItems[slot2:getConfig("color_id_list")[slot1.selectedColorIndex]] or 0) <= 0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("coloring_color_not_enough"))

					return
				end
			elseif slot1.selectedColorIndex == 0 and not slot2:hasFill(slot3, slot4) then
				return
			end

			slot6()
		end
	end)
	slot4:AddBeginDragFunc(function ()
		slot0 = false
	end)

	slot6 = Vector2.New(slot0.bg.rect.width / UnityEngine.Screen.width, slot0.bg.rect.height / UnityEngine.Screen.height)

	slot4:AddDragFunc(function (slot0, slot1)
		slot0 = true

		if not Application.isEditor then
			slot1.zoom.enabled = Input.touchCount == 2
		end

		if Application.isEditor or not slot1.zoom.enabled then
			slot1.bg.anchoredPosition.x = slot1.bg.anchoredPosition.x + slot1.delta.x * slot2.x
			slot1.bg.anchoredPosition.x = math.clamp(slot1.bg.anchoredPosition.x, -slot1.bg.rect.width * (slot1.bg.localScale.x - 1), 0)
			slot1.bg.anchoredPosition.y = slot1.bg.anchoredPosition.y + slot1.delta.y * slot2.y
			slot1.bg.anchoredPosition.y = math.clamp(slot1.bg.anchoredPosition.y, 0, slot1.bg.rect.height * (slot1.bg.localScale.y - 1))
			slot1.bg.anchoredPosition = slot1.bg.anchoredPosition
		end
	end)
	slot4:AddDragEndFunc(function ()
		slot0 = false
	end)
end

function slot0.updateCell(slot0, slot1, slot2)
	slot4 = slot0.colorGroups[slot0.selectedIndex].getCell(slot3, slot1, slot2)
	slot5 = slot0.colorGroups[slot0.selectedIndex].getFill(slot3, slot1, slot2)

	if slot0.colorGroups[slot0.selectedIndex].getState(slot3) == ColorGroup.StateFinish or slot6 == ColorGroup.StateAchieved then
		slot5 = slot4
	end

	slot8 = slot0.cells:Find(slot1 .. "_" .. slot2)

	if slot4 or slot5 then
		slot8 or cloneTplTo(slot0.cell, slot0.cells, slot7).sizeDelta = slot0.cellSize
		slot8 or cloneTplTo(slot0.cell, slot0.cells, slot7).anchoredPosition = Vector2(slot5 or slot4.column * slot0.cellSize.x, -(slot5 or slot4.row * slot0.cellSize.y))
		slot9 = slot8 or cloneTplTo(slot0.cell, slot0.cells, slot7):Find("image")
		slot10 = slot8:Find("text")

		if slot5 then
			setImageColor(slot9, slot3.colors[slot5.type])
		else
			setText(slot10, slot0.Letters[slot4.type])
		end

		setActive(slot9, slot5)
		setActive(slot10, not slot5)
		setActive(slot8, true)
	elseif slot8 then
		setActive(slot8, false)
	end
end

function slot0.calcCellSize(slot0)
	slot2, slot3 = unpack(slot0.colorGroups[slot0.selectedIndex].getConfig(slot1, "theme"))

	return Vector2.New(slot0.bg.rect.width / slot3, slot0.bg.rect.height / slot2)
end

function slot0.updateLines(slot0)
	slot2, slot3 = unpack(slot0.colorGroups[slot0.selectedIndex].getConfig(slot1, "theme"))

	for slot7 = 1, slot3 - 1, 1 do
		slot0.lines:Find("column_" .. slot7) or cloneTplTo(slot0.line, slot0.lines, slot8).sizeDelta = Vector2.New(1, slot0.lines.rect.height)
		slot0.lines.Find("column_" .. slot7) or cloneTplTo(slot0.line, slot0.lines, slot8).anchoredPosition = Vector2.New(slot7 * slot0.cellSize.x - 0.5, 0)
	end

	for slot7 = 1, slot2 - 1, 1 do
		slot0.lines:Find("row_" .. slot7) or cloneTplTo(slot0.line, slot0.lines, slot8).sizeDelta = Vector2.New(slot0.lines.rect.width, 1)
		slot0.lines.Find("row_" .. slot7) or cloneTplTo(slot0.line, slot0.lines, slot8).anchoredPosition = Vector2.New(0, -(slot7 * slot0.cellSize.y - 0.5))
	end
end

function slot0.searchColoringCells(slot0, slot1, slot2, slot3, slot4)
	slot5 = {
		row = slot2,
		column = slot3,
		color = slot4
	}

	if slot1:canBeCustomised() then
		return {
			slot5
		}
	else
		slot7 = slot0.colorItems[slot1:getConfig("color_id_list")[slot4]]
		slot8 = {}
		slot9 = {}
		slot10 = {
			slot5
		}
		slot11 = {
			{
				row = -1,
				column = 0
			},
			{
				row = 1,
				column = 0
			},
			{
				row = 0,
				column = -1
			},
			{
				row = 0,
				column = 1
			},
			{
				row = -1,
				column = -1
			},
			{
				row = -1,
				column = 1
			},
			{
				row = 1,
				column = -1
			},
			{
				row = 1,
				column = 1
			}
		}

		while #slot10 > 0 and slot7 > 0 do
			if not slot1:hasFill(table.remove(slot10, 1).row, table.remove(slot10, 1).column) and slot12.color == slot4 then
				table.insert(slot8, slot12)

				slot7 = slot7 - 1

				_.each(slot11, function (slot0)
					if slot0:getCell(slot0.row + slot1.row, slot0.column + slot1.column) and not (_.any(_.any, function (slot0)
						return slot0.row == slot0.row and slot0.column == slot0.column
					end) or _.any(slot3, function (slot0)
						return slot0.row == slot0.row and slot0.column == slot0.column
					end)) then
						table.insert(slot2, {
							row = slot1.row,
							column = slot1.column,
							color = slot1.type
						})
					end
				end)
			end

			table.insert(slot9, slot12)
		end

		return slot8
	end
end

function slot0.updateAwardDisplay(slot0)
	slot1 = {
		1,
		3,
		7
	}

	for slot5 = 1, 3, 1 do
		setActive(slot0.awardDisplay:GetChild("item" .. slot5).Find(slot6, "get"), slot0.colorGroups[slot1[slot5]]:getState() == ColorGroup.StateColoring)
	end
end

function slot0.tryPlayStory(slot0)
	if pg.gameset.coloring_story.description[slot0.selectedIndex] then
		pg.StoryMgr.GetInstance():Play(slot1)
	end
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0.btnBack)
end

function slot0.willExit(slot0)
	slot0:unloadChar()
end

return slot0
