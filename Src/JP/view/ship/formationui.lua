slot0 = class
slot1 = "FormationUI"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = 60
slot0.RADIUS = slot1
slot1 = 30
slot0.LONGPRESS_Y = slot1
slot1 = math
slot1 = slot1.pi
slot1 = slot1 / 2
slot1 = slot1 / 6
slot0.INTERVAL = slot1
slot1 = 6
slot0.MAX_FLEET_NUM = slot1
slot1 = 5
slot0.MAX_SHIPP_NUM = slot1
slot1 = "_detailToggle"
slot0.TOGGLE_DETAIL = slot1
slot1 = "_formationToggle"
slot0.TOGGLE_FORMATION = slot1
slot1 = {
	blue = "blue",
	pink = "pink",
	cyan = "cyan"
}
slot0.BUFF_TYEP = slot1

function slot1(slot0)
	slot1 = "FormationUI"

	return slot1
end

slot0.getUIName = slot1

function slot1(slot0, slot1)
	slot0.player = slot1
end

slot0.setPlayer = slot1

function slot1(slot0)
	slot1 = {}
	slot0.eventTriggers = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container"
	slot1 = slot1(slot2, slot3)
	slot0._blurLayer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top/title/back"
	slot4 = slot0._blurLayer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.backBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bg_fleet"
	slot1 = slot1(slot2, slot3)
	slot0._bgFleet = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bg_sub"
	slot1 = slot1(slot2, slot3)
	slot0._bgSub = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/bottom"
	slot1 = slot1(slot2, slot3)
	slot0._bottomPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/bottom/toggle_list/detail_toggle"
	slot1 = slot1(slot2, slot3)
	slot0._detailToggle = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/bottom/toggle_list/formation_toggle"
	slot1 = slot1(slot2, slot3)
	slot0._formationToggle = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "nextPage"
	slot1 = slot1(slot2, slot3)
	slot0._nextPage = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "prevPage"
	slot1 = slot1(slot2, slot3)
	slot0._prevPage = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "star_tpl"
	slot1 = slot1(slot2, slot3)
	slot0._starTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "star_empty_tpl"
	slot1 = slot1(slot2, slot3)
	slot0._starEmptyTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "heroInfo"
	slot1 = slot1(slot2, slot3)
	slot0._heroInfoTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top"
	slot4 = slot0._blurLayer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.topPanel = slot1
	slot1 = {}
	slot2 = Fleet
	slot2 = slot2.VANGUARD
	slot3 = {}
	slot1[slot2] = slot3
	slot2 = Fleet
	slot2 = slot2.MAIN
	slot3 = {}
	slot1[slot2] = slot3
	slot2 = Fleet
	slot2 = slot2.SUBMARINE
	slot3 = {}
	slot1[slot2] = slot3
	slot0._gridTFs = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GridFrame"
	slot1 = slot1(slot2, slot3)
	slot0._gridFrame = slot1
	slot1 = 1
	slot2 = 3
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = slot0._gridTFs
		slot6 = Fleet
		slot6 = slot6.MAIN
		slot5 = slot5[slot6]
		slot6 = slot0._gridFrame
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "main_"
		slot9 = slot4
		slot8 = slot8 .. slot9
		slot6 = slot6(slot7, slot8)
		slot5[slot4] = slot6
		slot5 = slot0._gridTFs
		slot6 = Fleet
		slot6 = slot6.VANGUARD
		slot5 = slot5[slot6]
		slot6 = slot0._gridFrame
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "vanguard_"
		slot9 = slot4
		slot8 = slot8 .. slot9
		slot6 = slot6(slot7, slot8)
		slot5[slot4] = slot6
		slot5 = slot0._gridTFs
		slot6 = Fleet
		slot6 = slot6.SUBMARINE
		slot5 = slot5[slot6]
		slot6 = slot0._gridFrame
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "submarine_"
		slot9 = slot4
		slot8 = slot8 .. slot9
		slot6 = slot6(slot7, slot8)
		slot5[slot4] = slot6
	end

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "HeroContainer"
	slot1 = slot1(slot2, slot3)
	slot0._heroContainer = slot1
	slot1 = {}
	slot0._attachmentList = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/fleet_info"
	slot1 = slot1(slot2, slot3)
	slot0._fleetInfo = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/fleet_info/fleet_number"
	slot1 = slot1(slot2, slot3)
	slot0._fleetNumText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/fleet_info/fleet_name"
	slot1 = slot1(slot2, slot3)
	slot0._fleetNameText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/fleet_info/edit_btn"
	slot1 = slot1(slot2, slot3)
	slot0._fleetNameEditBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "changeName_panel"
	slot1 = slot1(slot2, slot3)
	slot0._renamePanel = slot1
	slot1 = slot0._renamePanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "frame/queren"
	slot1 = slot1(slot2, slot3)
	slot0._renameConfirmBtn = slot1
	slot1 = slot0._renamePanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "frame/cancel"
	slot1 = slot1(slot2, slot3)
	slot0._renameCancelBtn = slot1
	slot1 = setLocalPosition
	slot2 = slot0._renamePanel
	slot3 = {
		z = -45
	}

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "buff_list"
	slot1 = slot1(slot2, slot3)
	slot0._buffPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "buff_group"
	slot4 = slot0._buffPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0._buffGroup = slot1
	slot2 = slot0
	slot1 = slot0.getTpl
	slot3 = "buff_model"
	slot4 = slot0._buffPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0._buffModel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/property_frame/titles/cannon/value"
	slot1 = slot1(slot2, slot3)
	slot0._cannonPower = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/property_frame/titles/torpedo/value"
	slot1 = slot1(slot2, slot3)
	slot0._torpedoPower = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/property_frame/titles/anti_air/value"
	slot1 = slot1(slot2, slot3)
	slot0._AAPower = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/property_frame/titles/air/value"
	slot1 = slot1(slot2, slot3)
	slot0._airPower = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/property_frame/titles/cost/value"
	slot1 = slot1(slot2, slot3)
	slot0._cost = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/property_frame/titles/ac/value"
	slot1 = slot1(slot2, slot3)
	slot0._airDominance = slot1
	slot1 = setText
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "blur_container/property_frame/titles/cannon/Text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_attr_cannon"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "blur_container/property_frame/titles/torpedo/Text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_attr_torpedo"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "blur_container/property_frame/titles/anti_air/Text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_attr_antiaircraft"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "blur_container/property_frame/titles/air/Text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_attr_air"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "blur_container/property_frame/titles/cost/Text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_attr_luck"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "blur_container/property_frame/titles/ac/Text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_attr_ac"

	slot1(slot2, slot3(slot4))

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "gear_score/main"
	slot1 = slot1(slot2, slot3)
	slot0._mainGS = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "gear_score/vanguard"
	slot1 = slot1(slot2, slot3)
	slot0._vanguardGS = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "gear_score/submarine"
	slot1 = slot1(slot2, slot3)
	slot0._subGS = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/attr_frame"
	slot1 = slot1(slot2, slot3)
	slot0._attrFrame = slot1
	slot2 = slot0
	slot1 = slot0.getTpl
	slot3 = "ship"
	slot4 = slot0._attrFrame
	slot1 = slot1(slot2, slot3, slot4)
	slot0._cardTpl = slot1
	slot1 = {}
	slot0._cards = slot1
	slot1 = slot0._cards
	slot2 = Fleet
	slot2 = slot2.MAIN
	slot3 = {}
	slot1[slot2] = slot3
	slot1 = slot0._cards
	slot2 = Fleet
	slot2 = slot2.VANGUARD
	slot3 = {}
	slot1[slot2] = slot3
	slot1 = slot0._cards
	slot2 = Fleet
	slot2 = slot2.SUBMARINE
	slot3 = {}
	slot1[slot2] = slot3
	slot1 = setActive
	slot2 = slot0._attrFrame
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0._cardTpl
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "fleet_select/regular"
	slot4 = slot0._bottomPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.btnRegular = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "fleet_select/sub"
	slot4 = slot0._bottomPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.btnSub = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/list_mask"
	slot1 = slot1(slot2, slot3)
	slot0.fleetToggleMask = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "list"
	slot4 = slot0.fleetToggleMask
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fleetToggleList = slot1
	slot1 = {}
	slot0.fleetToggles = slot1
	slot1 = 1
	slot2 = slot0
	slot2 = slot2.MAX_FLEET_NUM
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = slot0.fleetToggles
		slot7 = slot0
		slot6 = slot0.findTF
		slot8 = "item"
		slot9 = slot4
		slot8 = slot8 .. slot9
		slot9 = slot0.fleetToggleList
		slot6 = slot6(slot7, slot8, slot9)
		slot5[slot4] = slot6
	end

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "resource"
	slot1 = slot1(slot2, slot3)
	slot0.resource = slot1
	slot1 = setAnchoredPosition
	slot2 = slot0._bottomPanel
	slot3 = {
		y = -90
	}

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AL_Biandui01"
	slot1 = slot1(slot2, slot3)
	slot0.subBottom = slot1
	slot1 = CommanderFormationPanel
	slot1 = slot1.New
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "commander_panel"
	slot1 = slot1(slot2(slot3, slot4))
	slot0.commanderFormationPanel = slot1
	slot1 = slot0.commanderFormationPanel
	slot2 = slot1
	slot1 = slot1.attach
	slot3 = slot0

	slot1(slot2, slot3)
end

slot0.init = slot1

function slot1(slot0, slot1)
	slot0.shipVOs = slot1
end

slot0.setShips = slot1

function slot1(slot0, slot1)
	slot2 = _
	slot3 = _
	slot3 = slot3.values
	slot4 = slot1
	slot2 = slot2(slot3(slot4))
	slot3 = slot2
	slot2 = slot2.chain
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.filter

	function slot4(slot0)
		slot2 = slot0
		slot1 = slot0.isRegularFleet

		return slot1(slot2)
	end

	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.sort

	function slot4(slot0, slot1)
		return slot0.id < slot1.id
	end

	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.value
	slot2 = slot2(slot3)
	slot0._fleetVOs = slot2
	slot3 = slot0._currentFleetVO

	if slot3 then
		slot4 = slot0
		slot3 = slot0.getFleetById
		slot5 = slot0._currentFleetVO
		slot5 = slot5.id
		slot3 = slot3(slot4, slot5)
		slot0._currentFleetVO = slot3
	end
end

slot0.SetFleets = slot1

function slot1(slot0, slot1)
	slot2 = _
	slot2 = slot2.detect
	slot3 = slot0._fleetVOs

	function slot4(slot0)
		return slot0.id == slot0
	end

	return slot2(slot3, slot4)
end

slot0.getFleetById = slot1

function slot1(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.displayFleetInfo

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateFleetBg

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateGridVisibility

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.resetGrid
	slot4 = Fleet
	slot4 = slot4.VANGUARD

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.resetGrid
	slot4 = Fleet
	slot4 = slot4.MAIN

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.resetGrid
	slot4 = Fleet
	slot4 = slot4.SUBMARINE

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.resetFormationComponent

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateAttrFrame

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateFleetButton

	slot2(slot3)

	if slot1 then
		slot3 = slot0
		slot2 = slot0.loadAllCharacter

		slot2(slot3)
	else
		slot3 = slot0
		slot2 = slot0.setAllCharacterPos

		slot2(slot3)
	end
end

slot0.UpdateFleetView = slot1

function slot1(slot0)
	slot1 = slot0._currentFleetVO
	slot2 = slot1
	slot1 = slot1.getFleetType
	slot1 = slot1(slot2)
	slot2 = _
	slot2 = slot2.each
	slot3 = slot0._gridTFs
	slot4 = Fleet
	slot4 = slot4.MAIN
	slot3 = slot3[slot4]

	function slot4(slot0)
		setActive(slot0, slot0 == FleetType.Normal)
	end

	slot2(slot3, slot4)

	slot2 = _
	slot2 = slot2.each
	slot3 = slot0._gridTFs
	slot4 = Fleet
	slot4 = slot4.VANGUARD
	slot3 = slot3[slot4]

	function slot4(slot0)
		setActive(slot0, slot0 == FleetType.Normal)
	end

	slot2(slot3, slot4)

	slot2 = _
	slot2 = slot2.each
	slot3 = slot0._gridTFs
	slot4 = Fleet
	slot4 = slot4.SUBMARINE
	slot3 = slot3[slot4]

	function slot4(slot0)
		setActive(slot0, slot0 == FleetType.Submarine)
	end

	slot2(slot3, slot4)
end

slot0.updateGridVisibility = slot1

function slot1(slot0)
	slot1 = "commonbg/"
	slot2 = slot0._currentFleetVO:getFleetType()

	setActive(slot0._bgFleet, slot2 == FleetType.Normal)
	setActive(slot0._bgSub, slot2 == FleetType.Submarine)
	setActive(slot0.subBottom, slot2 == FleetType.Submarine)
end

slot0.updateFleetBg = slot1

function slot1(slot0)
	slot1 = slot0._currentFleetVO:getFleetType()

	setActive(slot0.btnRegular:Find("title"), slot1 ~= FleetType.Normal)
	setActive(slot0.btnRegular:Find("title_selected"), slot1 == FleetType.Normal)
	setActive(slot0.btnRegular:Find("text"), slot1 ~= FleetType.Normal)
	setActive(slot0.btnRegular:Find("text_selected"), slot1 == FleetType.Normal)

	slot2 = FleetType.Normal

	if slot1 == slot2 then
		slot2 = slot0._currentFleetVO
		slot3 = slot2
		slot2 = slot2.getIndex
		slot2 = slot2(slot3)
		slot4 = slot0
		slot3 = slot0.setSpriteTo
		slot5 = "resource/btn_fleet_"
		slot6 = slot2
		slot5 = slot5 .. slot6
		slot6 = slot0.btnRegular
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "fleet"

		slot3(slot4, slot5, slot6(slot7, slot8))

		slot4 = slot0
		slot3 = slot0.setSpriteTo
		slot5 = "resource/text_fleet_"
		slot6 = slot2
		slot5 = slot5 .. slot6
		slot6 = slot0.btnRegular
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "text"

		slot3(slot4, slot5, slot6(slot7, slot8))

		slot4 = slot0
		slot3 = slot0.setSpriteTo
		slot5 = "resource/text_fleet_"
		slot6 = slot2
		slot5 = slot5 .. slot6
		slot6 = slot0.btnRegular
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "text_selected"

		slot3(slot4, slot5, slot6(slot7, slot8))
	end

	setActive(slot0.btnSub:Find("title"), slot1 ~= FleetType.Submarine)
	setActive(slot0.btnSub:Find("title_selected"), slot1 == FleetType.Submarine)
	setActive(slot0.btnSub:Find("text"), slot1 ~= FleetType.Submarine)
	setActive(slot0.btnSub:Find("text_selected"), slot1 == FleetType.Submarine)

	slot2 = FleetType.Submarine

	if slot1 == slot2 then
		slot2 = slot0._currentFleetVO
		slot3 = slot2
		slot2 = slot2.getIndex
		slot2 = slot2(slot3)
		slot4 = slot0
		slot3 = slot0.setSpriteTo
		slot5 = "resource/btn_fleet_"
		slot6 = slot2
		slot5 = slot5 .. slot6
		slot6 = slot0.btnSub
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "fleet"

		slot3(slot4, slot5, slot6(slot7, slot8))

		slot4 = slot0
		slot3 = slot0.setSpriteTo
		slot5 = "resource/text_fleet_"
		slot6 = slot2
		slot5 = slot5 .. slot6
		slot6 = slot0.btnSub
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "text"

		slot3(slot4, slot5, slot6(slot7, slot8))

		slot4 = slot0
		slot3 = slot0.setSpriteTo
		slot5 = "resource/text_fleet_"
		slot6 = slot2
		slot5 = slot5 .. slot6
		slot6 = slot0.btnSub
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "text_selected"

		slot3(slot4, slot5, slot6(slot7, slot8))
	end
end

slot0.updateFleetButton = slot1

function slot1(slot0)
	slot1 = setText
	slot2 = slot0._fleetNameText
	slot3 = slot0.defaultFleetName
	slot4 = slot0._currentFleetVO

	slot1(slot2, slot3(slot4))
end

slot0.SetFleetNameLabel = slot1

function slot1(slot0)
	slot1 = 0.3
	slot2 = 0.3
	slot3 = shiftPanel
	slot4 = slot0.topPanel
	slot5 = nil
	slot6 = 0
	slot7 = slot2
	slot8 = slot1
	slot9 = true
	slot10 = true
	slot11, slot12 = nil

	slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)

	slot3 = topAnimation
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "title/bg/left"
	slot7 = slot0.topPanel
	slot4 = slot4(slot5, slot6, slot7)
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "title/bg/right"
	slot8 = slot0.topPanel
	slot5 = slot5(slot6, slot7, slot8)
	slot7 = slot0
	slot6 = slot0.findTF
	slot8 = "title/bg/title_formation"
	slot9 = slot0.topPanel
	slot6 = slot6(slot7, slot8, slot9)
	slot8 = slot0
	slot7 = slot0.findTF
	slot9 = "title/bg/formation"
	slot10 = slot0.topPanel
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = 0.57

	function slot9()
		slot0 = slot0
		slot1 = nil
		slot0.tweens = slot1
	end

	slot3 = slot3(slot4, slot5, slot6, slot7, slot8, slot9)
	slot0.tweens = slot3
end

slot0.uiStartAnimating = slot1

function slot1(slot0)
	slot1 = shiftPanel
	slot2 = slot0._bottomPanel
	slot3 = nil
	slot4 = slot0._bottomPanel
	slot4 = slot4.rect
	slot4 = slot4.height
	slot4 = -slot4
	slot5 = dur
	slot6 = delay
	slot7 = true
	slot8 = true

	slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8)

	slot1 = shiftPanel
	slot2 = slot0.topPanel
	slot3 = nil
	slot4 = slot0.topPanel
	slot4 = slot4.rect
	slot4 = slot4.height
	slot5 = dur
	slot6 = delay
	slot7 = true
	slot8 = true
	slot9, slot10 = nil

	slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
end

slot0.uiExitAnimating = slot1

function slot1(slot0)
	slot1 = slot0.commanderFormationPanel
	slot2 = slot1
	slot1 = slot1.enable
	slot3 = pg
	slot3 = slot3.SystemOpenMgr
	slot4 = slot3
	slot3 = slot3.GetInstance
	slot3 = slot3(slot4)
	slot4 = slot3
	slot3 = slot3.isOpenSystem
	slot5 = slot0.player
	slot5 = slot5.level
	slot6 = "CommandRoomMediator"

	slot1(slot2, slot3(slot4, slot5, slot6))

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.backBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0._currentDragDelegate

		if slot0 then
			slot0 = slot0
			slot1 = true
			slot0._forceDropCharacter = slot1
			slot0 = LuaHelper
			slot0 = slot0.triggerEndDrag
			slot1 = slot0
			slot1 = slot1._currentDragDelegate

			slot0(slot1)
		end

		slot0 = slot0
		slot0 = slot0._attrFrame
		slot0 = slot0.gameObject
		slot0 = slot0.activeSelf

		if slot0 then
			slot0 = triggerToggle
			slot1 = slot0
			slot1 = slot1._formationToggle
			slot2 = true

			slot0(slot1, slot2)
		else
			function slot0()
				slot0 = GetOrAddComponent
				slot1 = slot0
				slot1 = slot1._tf
				slot2 = typeof
				slot3 = CanvasGroup
				slot0 = slot0(slot1, slot2(slot3))
				slot1 = false
				slot0.interactable = slot1
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.uiExitAnimating

				slot1(slot2)

				slot1 = LeanTween
				slot1 = slot1.delayedCall
				slot2 = 0.3
				slot3 = System
				slot3 = slot3.Action

				function slot4()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = slot1
					slot2 = slot2.ON_BACK

					slot0(slot1, slot2)
				end

				slot1(slot2, slot3(slot4))
			end

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = FormationMediator
			slot3 = slot3.COMMIT_FLEET
			slot4 = slot0

			slot1(slot2, slot3, slot4)
		end
	end

	slot5 = SOUND_BACK

	slot1(slot2, slot3, slot4, slot5)

	slot1 = setActive
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "stamp"
	slot2 = slot2(slot3, slot4)
	slot3 = BATTLE_DEBUG

	if not slot3 then
		slot3 = getProxy
		slot4 = TaskProxy
		slot3 = slot3(slot4)
		slot4 = slot3
		slot3 = slot3.mingshiTouchFlagEnabled
		slot3 = slot3(slot4)
	end

	slot1(slot2, slot3)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "stamp"
	slot3 = slot3(slot4, slot5)

	function slot4()
		slot0 = BATTLE_DEBUG

		if slot0 then
			slot0 = print
			slot1 = slot0
			slot1 = slot1._currentFleetVO
			slot2 = slot1
			slot1 = slot1.genRobotDataString

			slot0(slot1(slot2))
		end

		slot0 = getProxy
		slot1 = TaskProxy
		slot0 = slot0(slot1)
		slot1 = slot0
		slot0 = slot0.dealMingshiTouchFlag
		slot2 = 6

		slot0(slot1, slot2)
	end

	slot5 = SFX_CONFIRM

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._fleetNameEditBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.DisplayRenamePanel
		slot2 = true

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._renameConfirmBtn

	function slot4()
		slot0 = getInputText
		slot1 = findTF
		slot2 = slot0
		slot2 = slot2._renamePanel
		slot3 = "frame/name_field"
		slot0 = slot0(slot1(slot2, slot3))
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = FormationMediator
		slot3 = slot3.CHANGE_FLEET_NAME
		slot4 = slot0
		slot4 = slot4._currentFleetVO
		slot4 = slot4.id
		slot5 = slot0

		slot1(slot2, slot3, slot4, slot5)
	end

	slot5 = SFX_CONFIRM

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._renameCancelBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.DisplayRenamePanel
		slot2 = false

		slot0(slot1, slot2)
	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onToggle
	slot2 = slot0
	slot3 = slot0._detailToggle

	function slot4(slot0)
		slot1 = slot0
		slot1 = slot1._currentDragDelegate

		if slot1 then
			slot1 = slot0
			slot2 = true
			slot1._forceDropCharacter = slot2
			slot1 = LuaHelper
			slot1 = slot1.triggerEndDrag
			slot2 = slot0
			slot2 = slot2._currentDragDelegate

			slot1(slot2)
		end

		if slot0 then
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.displayAttrFrame

			slot1(slot2)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onToggle
	slot2 = slot0
	slot3 = slot0._formationToggle

	function slot4(slot0)
		slot1 = slot0
		slot1 = slot1._currentDragDelegate

		if slot1 then
			slot1 = slot0
			slot2 = true
			slot1._forceDropCharacter = slot2
			slot1 = LuaHelper
			slot1 = slot1.triggerEndDrag
			slot2 = slot0
			slot2 = slot2._currentDragDelegate

			slot1(slot2)
		end

		if slot0 then
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.hideAttrFrame

			slot1(slot2)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._attrFrame

	function slot4()
		slot0 = triggerToggle
		slot1 = slot0
		slot1 = slot1._formationToggle
		slot2 = true

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.fleetToggleMask

	function slot4()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.fleetToggleMask
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.tweenTabArrow
		slot2 = true

		slot0(slot1, slot2)
	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.btnRegular

	function slot4()
		slot0:updateToggleList(_.filter(slot0._fleetVOs, function (slot0)
			return slot0:getFleetType() == FleetType.Normal
		end))
		triggerToggle(slot0.fleetToggles[tonumber(getImageSprite(slot0.btnRegular:Find("text")).name.sub(slot1, #getImageSprite(slot0.btnRegular.Find("text")).name))], true)

		if slot0.updateToggleList._currentFleetVO:getFleetType() == FleetType.Normal then
			slot3 = setActive
			slot4 = slot0
			slot4 = slot4.fleetToggleMask
			slot5 = true

			slot3(slot4, slot5)

			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.tweenTabArrow
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setAnchoredPosition
			slot4 = slot0
			slot4 = slot4.fleetToggleList
			slot5 = Vector3
			slot5 = slot5.New
			slot6 = 133
			slot7 = 475

			slot3(slot4, slot5(slot6, slot7))
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.btnSub

	function slot4()
		slot0:updateToggleList(_.filter(slot0._fleetVOs, function (slot0)
			return slot0:getFleetType() == FleetType.Submarine
		end))
		triggerToggle(slot0.fleetToggles[tonumber(getImageSprite(slot0.btnSub:Find("text")).name.sub(slot1, #getImageSprite(slot0.btnSub.Find("text")).name))], true)

		if slot0.updateToggleList._currentFleetVO:getFleetType() == FleetType.Submarine then
			slot3 = setActive
			slot4 = slot0
			slot4 = slot4.fleetToggleMask
			slot5 = true

			slot3(slot4, slot5)

			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.tweenTabArrow
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setAnchoredPosition
			slot4 = slot0
			slot4 = slot4.fleetToggleList
			slot5 = Vector3
			slot5 = slot5.New
			slot6 = 530
			slot7 = 475

			slot3(slot4, slot5(slot6, slot7))
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._prevPage

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.selectFleetByStep
		slot2 = -1
		slot0 = slot0(slot1, slot2)

		if slot0 then
			slot1 = slot0
			slot1 = slot1._currentDragDelegate

			if slot1 then
				slot1 = slot0
				slot2 = true
				slot1._forceDropCharacter = slot2
				slot1 = LuaHelper
				slot1 = slot1.triggerEndDrag
				slot2 = slot0
				slot2 = slot2._currentDragDelegate

				slot1(slot2)
			end

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = FormationMediator
			slot3 = slot3.ON_CHANGE_FLEET
			slot4 = slot0

			slot1(slot2, slot3, slot4)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._nextPage

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.selectFleetByStep
		slot2 = 1
		slot0 = slot0(slot1, slot2)

		if slot0 then
			slot1 = slot0
			slot1 = slot1._currentDragDelegate

			if slot1 then
				slot1 = slot0
				slot2 = true
				slot1._forceDropCharacter = slot2
				slot1 = LuaHelper
				slot1 = slot1.triggerEndDrag
				slot2 = slot0
				slot2 = slot2._currentDragDelegate

				slot1(slot2)
			end

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = FormationMediator
			slot3 = slot3.ON_CHANGE_FLEET
			slot4 = slot0

			slot1(slot2, slot3, slot4)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = defaultValue
	slot2 = slot0.contextData
	slot2 = slot2.number
	slot3 = 1
	slot1 = slot1(slot2, slot3)
	slot3 = slot0
	slot2 = slot0.SetCurrentFleetID
	slot4 = slot1

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.UpdateFleetView
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.contextData
	slot2 = slot2.toggle

	if slot2 ~= nil then
		slot2 = triggerToggle
		slot3 = slot0.contextData
		slot3 = slot3.toggle
		slot3 = slot0[slot3]
		slot4 = true

		slot2(slot3, slot4)
	end

	slot2 = shiftPanel
	slot3 = slot0._bottomPanel
	slot4 = nil
	slot5 = 0
	slot6 = nil
	slot7 = 0.5
	slot8 = true
	slot9 = true

	slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)

	slot2 = setAnchoredPosition
	slot3 = slot0.topPanel
	slot4 = {}
	slot5 = slot0.topPanel
	slot5 = slot5.rect
	slot5 = slot5.height
	slot4.y = slot5

	slot2(slot3, slot4)

	slot2 = onNextTick

	function slot3()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.uiStartAnimating

		slot0(slot1)
	end

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.tweenTabArrow
	slot4 = true

	slot2(slot3, slot4)

	slot2 = PoolMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetUI
	slot4 = "al_bg01"
	slot5 = true

	function slot6(slot0)
		slot1 = IsNil
		slot2 = slot0
		slot2 = slot2._tf
		slot1 = slot1(slot2)

		if slot1 then
			return
		end

		slot2 = slot0
		slot1 = slot0.SetActive
		slot3 = true

		slot1(slot2, slot3)

		slot1 = setParent
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf

		slot1(slot2, slot3)

		slot1 = slot0.transform
		slot2 = slot1
		slot1 = slot1.SetAsFirstSibling

		slot1(slot2)
	end

	slot2(slot3, slot4, slot5, slot6)
end

slot0.didEnter = slot1

function slot1(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.getFleetById
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot0._currentFleetVO = slot2
	slot2 = slot0.commanderFormationPanel
	slot3 = slot2
	slot2 = slot2.update
	slot4 = slot0._currentFleetVO

	slot2(slot3, slot4)
end

slot0.SetCurrentFleetID = slot1

function slot1(slot0, slot1)
	slot2 = table
	slot2 = slot2.indexof
	slot3 = slot0._fleetVOs
	slot4 = slot0._currentFleetVO
	slot2 = slot2(slot3, slot4)

	while true do
		slot2 = slot2 + slot1
		slot3 = 1

		if slot2 >= slot3 then
			slot3 = slot0._fleetVOs
			slot3 = #slot3

			if slot2 > slot3 then
				break
			end
		end

		slot3 = slot0._fleetVOs
		slot3 = slot3[slot2]
		slot5 = slot3
		slot4 = slot3.isUnlock
		slot4 = slot4(slot5)

		if slot4 then
			slot4 = slot3.id

			return slot4
		end
	end
end

slot0.selectFleetByStep = slot1

function slot1(slot0, slot1)
	slot2 = slot0.fleetToggleList
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = typeof
	slot5 = ToggleGroup
	slot2 = slot2(slot3, slot4(slot5))
	slot3 = true
	slot2.allowSwitchOff = slot3
	slot3 = slot0._currentFleetVO
	slot3 = slot3.id
	slot4 = 1
	slot5 = slot0.fleetToggles
	slot5 = #slot5
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = slot0.fleetToggles
		slot8 = slot8[slot7]
		slot9 = slot1[slot7]
		slot10 = setActive
		slot11 = slot8
		slot12 = slot9

		slot10(slot11, slot12)

		if slot9 then
			slot11 = slot8
			slot10 = slot8.GetComponent
			slot12 = typeof
			slot13 = Toggle
			slot10 = slot10(slot11, slot12(slot13))
			slot12 = slot8
			slot11 = slot8.Find
			slot13 = "lock"
			slot11 = slot11(slot12, slot13)
			slot13 = slot9
			slot12 = slot9.isUnlock
			slot12, slot13 = slot12(slot13)
			slot14 = setToggleEnabled
			slot15 = slot8
			slot16 = slot12

			slot14(slot15, slot16)

			slot14 = setActive
			slot15 = slot11
			slot16 = not slot12

			slot14(slot15, slot16)

			if slot12 then
				slot10.isOn = slot9.id == slot3
				slot14 = onToggle
				slot15 = slot0
				slot16 = slot8

				function slot17(slot0)
					if slot0 then
						slot1 = setActive
						slot2 = slot0
						slot2 = slot2.fleetToggleMask
						slot3 = false

						slot1(slot2, slot3)

						slot1 = slot0
						slot2 = slot1
						slot1 = slot1.tweenTabArrow
						slot3 = true

						slot1(slot2, slot3)

						slot1 = slot1
						slot1 = slot1.id
						slot2 = slot2

						if slot1 ~= slot2 then
							slot1 = slot0
							slot1 = slot1._currentDragDelegate

							if slot1 then
								slot1 = slot0
								slot2 = true
								slot1._forceDropCharacter = slot2
								slot1 = LuaHelper
								slot1 = slot1.triggerEndDrag
								slot2 = slot0
								slot2 = slot2._currentDragDelegate

								slot1(slot2)
							end

							slot1 = slot0
							slot2 = slot1
							slot1 = slot1.emit
							slot3 = FormationMediator
							slot3 = slot3.ON_CHANGE_FLEET
							slot4 = slot1
							slot4 = slot4.id

							slot1(slot2, slot3, slot4)
						end
					end
				end

				slot18 = SFX_UI_TAG

				slot14(slot15, slot16, slot17, slot18)
			else
				slot14 = onButton
				slot15 = slot0
				slot16 = slot11

				function slot17()
					slot0 = pg
					slot0 = slot0.TipsMgr
					slot0 = slot0.GetInstance
					slot0 = slot0()
					slot1 = slot0
					slot0 = slot0.ShowTips
					slot2 = slot0

					slot0(slot1, slot2)
				end

				slot18 = SFX_UI_CLICK

				slot14(slot15, slot16, slot17, slot18)
			end
		end
	end

	slot4 = false
	slot2.allowSwitchOff = slot4
end

slot0.updateToggleList = slot1

function slot1(slot0)
	slot1 = removeAllChildren
	slot2 = slot0._heroContainer

	slot1(slot2)

	slot1 = {}
	slot2 = Fleet
	slot2 = slot2.VANGUARD
	slot3 = {}
	slot1[slot2] = slot3
	slot2 = Fleet
	slot2 = slot2.MAIN
	slot3 = {}
	slot1[slot2] = slot3
	slot2 = Fleet
	slot2 = slot2.SUBMARINE
	slot3 = {}
	slot1[slot2] = slot3
	slot0._characterList = slot1

	function slot1(slot0, slot1, slot2, slot3)
		slot4 = slot0
		slot4 = slot4.exited

		if slot4 then
			return
		end

		slot4 = slot0
		slot4 = slot4.shipVOs
		slot4 = slot4[slot1]
		slot5 = tf
		slot6 = Instantiate
		slot7 = slot0
		slot7 = slot7._heroInfoTpl
		slot5 = slot5(slot6(slot7))
		slot6 = slot0.name
		slot5.name = slot6
		slot7 = slot5
		slot6 = slot5.SetParent
		slot8 = slot0
		slot8 = slot8._heroContainer
		slot9 = false

		slot6(slot7, slot8, slot9)

		slot6 = SetActive
		slot7 = slot5
		slot8 = true

		slot6(slot7, slot8)

		slot7 = slot4
		slot6 = slot4.getConfigTable
		slot6 = slot6(slot7)
		slot7 = pg
		slot7 = slot7.ship_data_template
		slot8 = slot4.configId
		slot7 = slot7[slot8]
		slot8 = findTF
		slot9 = slot5
		slot10 = "info"
		slot8 = slot8(slot9, slot10)
		slot9 = findTF
		slot10 = slot8
		slot11 = "stars"
		slot9 = slot9(slot10, slot11)
		slot10 = findTF
		slot11 = slot8
		slot12 = "energy"
		slot10 = slot10(slot11, slot12)
		slot12 = slot4
		slot11 = slot4.getStar
		slot11 = slot11(slot12)
		slot12 = 1
		slot13 = slot11
		slot14 = 1

		for slot15 = slot12, slot13, slot14 do
			slot16 = cloneTplTo
			slot17 = slot0
			slot17 = slot17._starTpl
			slot18 = slot9

			slot16(slot17, slot18)
		end

		slot12 = GetSpriteFromAtlas
		slot13 = "shiptype"
		slot14 = shipType2print
		slot16 = slot4
		slot15 = slot4.getShipType
		slot12 = slot12(slot13, slot14(slot15(slot16)))

		if not slot12 then
			slot13 = warning
			slot14 = "找不到船形, shipConfigId: "
			slot15 = slot4.configId
			slot14 = slot14 .. slot15

			slot13(slot14)
		end

		slot13 = setImageSprite
		slot14 = findTF
		slot15 = slot8
		slot16 = "type"
		slot14 = slot14(slot15, slot16)
		slot15 = slot12
		slot16 = true

		slot13(slot14, slot15, slot16)

		slot13 = slot4.energy
		slot14 = Ship
		slot14 = slot14.ENERGY_MID

		if slot13 <= slot14 then
			slot13 = GetSpriteFromAtlas
			slot14 = "energy"
			slot16 = slot4
			slot15 = slot4.getEnergyPrint
			slot13 = slot13(slot14, slot15(slot16))
			slot14 = setImageSprite
			slot15 = slot10
			slot16 = slot13

			slot14(slot15, slot16)

			slot14 = setActive
			slot15 = slot10
			slot16 = true

			slot14(slot15, slot16)
		end

		slot13 = setText
		slot14 = findTF
		slot15 = slot8
		slot16 = "frame/lv_contain/lv"
		slot14 = slot14(slot15, slot16)
		slot15 = slot4.level

		slot13(slot14, slot15)

		slot13 = tf
		slot14 = slot0
		slot13 = slot13(slot14)
		slot15 = slot13
		slot14 = slot13.SetParent
		slot16 = slot5
		slot17 = false

		slot14(slot15, slot16, slot17)

		slot14 = "model"
		slot0.name = slot14
		slot15 = slot0
		slot14 = slot0.GetComponent
		slot16 = "SkeletonGraphic"
		slot14 = slot14(slot15, slot16)
		slot15 = false
		slot14.raycastTarget = slot15
		slot15 = slot4
		slot14 = slot4.getAttachmentPrefab
		slot14 = slot14(slot15)
		slot15 = pairs
		slot16 = slot14
		slot15, slot16, slot17 = slot15(slot16)

		for slot18, slot19 in slot15, slot16, slot17 do
			slot20 = slot19.attachment_combat_ui
			slot20 = slot20[1]

			if slot20 ~= "" then
				slot21 = "Effect/"
				slot22 = slot20
				slot21 = slot21 .. slot22
				slot22 = ResourceMgr
				slot22 = slot22.Inst
				slot23 = slot22
				slot22 = slot22.getAssetAsync
				slot24 = slot21
				slot25 = slot20
				slot26 = UnityEngine
				slot26 = slot26.Events
				slot26 = slot26.UnityAction_UnityEngine_Object

				function slot27(slot0)
					slot1 = slot0
					slot1 = slot1.exited

					if slot1 then
					else
						slot1 = Object
						slot1 = slot1.Instantiate
						slot2 = slot0
						slot1 = slot1(slot2)
						slot2 = slot0
						slot2 = slot2._attachmentList
						slot3 = slot0
						slot3 = slot3._attachmentList
						slot3 = #slot3
						slot3 = slot3 + 1
						slot2[slot3] = slot1
						slot2 = tf
						slot3 = slot1
						slot2 = slot2(slot3)
						slot3 = slot2
						slot2 = slot2.SetParent
						slot4 = tf
						slot5 = slot1

						slot2(slot3, slot4(slot5))

						slot2 = tf
						slot3 = slot1
						slot2 = slot2(slot3)
						slot3 = BuildVector3
						slot4 = slot2
						slot4 = slot4.attachment_combat_ui
						slot4 = slot4[2]
						slot3 = slot3(slot4)
						slot2.localPosition = slot3
					end
				end

				slot26 = slot26(slot27)
				slot27 = true
				slot28 = true

				slot22(slot23, slot24, slot25, slot26, slot27, slot28)
			end
		end

		slot15 = Vector3
		slot16 = 0.5
		slot17 = 0.5
		slot18 = 1
		slot15 = slot15(slot16, slot17, slot18)
		slot13.localScale = slot15
		slot15 = pg
		slot15 = slot15.ViewUtils
		slot15 = slot15.SetLayer
		slot16 = slot13
		slot17 = Layer
		slot17 = slot17.UI

		slot15(slot16, slot17)

		slot16 = slot8
		slot15 = slot8.SetSiblingIndex
		slot17 = 2

		slot15(slot16, slot17)

		slot15 = slot0
		slot15 = slot15._characterList
		slot15 = slot15[slot2]
		slot15[slot3] = slot5
		slot16 = GameObject
		slot17 = "mouseChild"
		slot16 = slot16(slot17)
		slot17 = tf
		slot18 = slot16
		slot17 = slot17(slot18)
		slot18 = slot17
		slot17 = slot17.SetParent
		slot19 = tf
		slot20 = slot0

		slot17(slot18, slot19(slot20))

		slot17 = tf
		slot18 = slot16
		slot17 = slot17(slot18)
		slot18 = Vector3
		slot18 = slot18.zero
		slot17.localPosition = slot18
		slot17 = GetOrAddComponent
		slot18 = slot16
		slot19 = "ModelDrag"
		slot17 = slot17(slot18, slot19)
		slot18 = GetOrAddComponent
		slot19 = slot16
		slot20 = "UILongPressTrigger"
		slot18 = slot18(slot19, slot20)
		slot19 = GetOrAddComponent
		slot20 = slot16
		slot21 = "EventTriggerListener"
		slot19 = slot19(slot20, slot21)
		slot20 = slot0
		slot20 = slot20.eventTriggers
		slot21 = true
		slot20[slot19] = slot21
		slot21 = slot17
		slot20 = slot17.Init

		slot20(slot21)

		slot21 = slot16
		slot20 = slot16.GetComponent
		slot22 = typeof
		slot23 = RectTransform
		slot20 = slot20(slot21, slot22(slot23))
		slot21 = Vector2
		slot22 = 3
		slot23 = 3
		slot21 = slot21(slot22, slot23)
		slot20.sizeDelta = slot21
		slot21 = Vector2
		slot22 = 0.5
		slot23 = 0
		slot21 = slot21(slot22, slot23)
		slot20.pivot = slot21
		slot21 = Vector2
		slot22 = 0
		slot23 = 0
		slot21 = slot21(slot22, slot23)
		slot20.anchoredPosition = slot21
		slot21 = 1
		slot18.longPressThreshold = slot21
		slot21 = pg
		slot21 = slot21.DelegateInfo
		slot21 = slot21.Add
		slot22 = slot0
		slot23 = slot18.onLongPressed

		slot21(slot22, slot23)

		slot21 = slot18.onLongPressed
		slot22 = slot21
		slot21 = slot21.AddListener

		function slot23()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = FormationMediator
			slot2 = slot2.OPEN_SHIP_INFO
			slot3 = slot1
			slot3 = slot3.id
			slot4 = slot0
			slot4 = slot4._currentFleetVO
			slot5 = slot2
			slot5 = slot5.TOGGLE_FORMATION

			slot0(slot1, slot2, slot3, slot4, slot5)

			slot0 = playSoundEffect
			slot1 = SFX_PANEL

			slot0(slot1)
		end

		slot21(slot22, slot23)

		slot21, slot22, slot23, slot24 = nil
		slot25 = pg
		slot25 = slot25.DelegateInfo
		slot25 = slot25.Add
		slot26 = slot0
		slot27 = slot17.onModelClick

		slot25(slot26, slot27)

		slot25 = slot17.onModelClick
		slot26 = slot25
		slot25 = slot25.AddListener

		function slot27()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = FormationMediator
			slot2 = slot2.CHANGE_FLEET_SHIP
			slot3 = slot1
			slot4 = slot0
			slot4 = slot4._currentFleetVO
			slot5 = slot2
			slot5 = slot5.TOGGLE_FORMATION
			slot6 = slot3

			slot0(slot1, slot2, slot3, slot4, slot5, slot6)

			slot0 = playSoundEffect
			slot1 = SFX_PANEL

			slot0(slot1)
		end

		slot25(slot26, slot27)

		slot26 = slot19
		slot25 = slot19.AddBeginDragFunc

		function slot27()
			slot0 = slot0
			slot0 = slot0._modelDrag

			if slot0 then
				return
			end

			slot0 = slot0
			slot1 = slot1
			slot0._modelDrag = slot1
			slot0 = slot0
			slot1 = slot2
			slot0._currentDragDelegate = slot1
			slot0 = rtf
			slot1 = slot0
			slot1 = slot1._tf
			slot0 = slot0(slot1)
			slot0 = slot0.rect
			slot0 = slot0.width
			slot1 = UnityEngine
			slot1 = slot1.Screen
			slot1 = slot1.width
			slot0 = slot0 / slot1
			slot3 = slot0
			slot0 = rtf
			slot1 = slot0
			slot1 = slot1._tf
			slot0 = slot0(slot1)
			slot0 = slot0.rect
			slot0 = slot0.height
			slot1 = UnityEngine
			slot1 = slot1.Screen
			slot1 = slot1.height
			slot0 = slot0 / slot1
			slot4 = slot0
			slot0 = rtf
			slot1 = slot0
			slot1 = slot1._heroContainer
			slot0 = slot0(slot1)
			slot0 = slot0.rect
			slot0 = slot0.width
			slot0 = slot0 / 2
			slot5 = slot0
			slot0 = rtf
			slot1 = slot0
			slot1 = slot1._heroContainer
			slot0 = slot0(slot1)
			slot0 = slot0.rect
			slot0 = slot0.height
			slot0 = slot0 / 2
			slot6 = slot0
			slot0 = LeanTween
			slot0 = slot0.cancel
			slot1 = slot1

			slot0(slot1)

			slot0 = slot7
			slot1 = slot0
			slot0 = slot0.SetAsLastSibling

			slot0(slot1)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.switchToShiftMode
			slot2 = slot7
			slot3 = slot8

			slot0(slot1, slot2, slot3)

			slot0 = SetAction
			slot1 = go
			slot2 = slot1
			slot1 = slot1(slot2)
			slot2 = "tuozhuai"

			slot0(slot1, slot2)

			slot0 = SetActive
			slot1 = slot9
			slot2 = false

			slot0(slot1, slot2)

			slot0 = playSoundEffect
			slot1 = SFX_UI_HOME_DRAG

			slot0(slot1)
		end

		slot25(slot26, slot27)

		slot26 = slot19
		slot25 = slot19.AddDragFunc

		function slot27(slot0, slot1)
			slot2 = slot0
			slot2 = slot2._modelDrag
			slot3 = slot1

			if slot2 ~= slot3 then
				return
			end

			slot2 = slot2
			slot3 = Vector3
			slot4 = slot1.position
			slot4 = slot4.x
			slot5 = slot3
			slot4 = slot4 * slot5
			slot5 = slot4
			slot4 = slot4 - slot5
			slot5 = slot1.position
			slot5 = slot5.y
			slot6 = slot5
			slot5 = slot5 * slot6
			slot6 = slot6
			slot5 = slot5 - slot6
			slot6 = -22
			slot3 = slot3(slot4, slot5, slot6)
			slot2.localPosition = slot3
		end

		slot25(slot26, slot27)

		slot26 = slot19
		slot25 = slot19.AddDragEndFunc

		function slot27(slot0, slot1)
			slot2 = slot0
			slot2 = slot2._modelDrag
			slot3 = slot1

			if slot2 ~= slot3 then
				return
			end

			slot2 = slot0
			slot3 = nil
			slot2._modelDrag = slot3
			slot2 = slot0
			slot2 = slot2._forceDropCharacter
			slot3 = slot0
			slot4 = nil
			slot3._forceDropCharacter = slot4
			slot3 = slot0
			slot4 = nil
			slot3._currentDragDelegate = slot4
			slot3 = SetAction
			slot4 = slot1
			slot5 = "stand"

			slot3(slot4, slot5)

			slot3 = SetActive
			slot4 = slot2
			slot5 = true

			slot3(slot4, slot5)

			if slot2 then
				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.switchToDisplayMode

				slot3(slot4)

				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.sortSiblingIndex

				slot3(slot4)

				return
			end

			function slot3()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.switchToDisplayMode

				slot0(slot1)

				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.sortSiblingIndex

				slot0(slot1)

				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = FormationMediator
				slot2 = slot2.CHANGE_FLEET_SHIPS_ORDER
				slot3 = slot0
				slot3 = slot3._currentFleetVO

				slot0(slot1, slot2, slot3)
			end

			slot4 = slot1.position
			slot4 = slot4.x
			slot5 = UnityEngine
			slot5 = slot5.Screen
			slot5 = slot5.width
			slot5 = slot5 * 0.15

			if slot4 >= slot5 then
				slot4 = slot1.position
				slot4 = slot4.x
				slot5 = UnityEngine
				slot5 = slot5.Screen
				slot5 = slot5.width
				slot5 = slot5 * 0.87

				if slot4 <= slot5 then
					slot4 = slot1.position
					slot4 = slot4.y
					slot5 = UnityEngine
					slot5 = slot5.Screen
					slot5 = slot5.height
					slot5 = slot5 * 0.18

					if slot4 >= slot5 then
						slot4 = slot1.position
						slot4 = slot4.y
						slot5 = UnityEngine
						slot5 = slot5.Screen
						slot5 = slot5.height
						slot5 = slot5 * 0.7

						if slot4 > slot5 then
							slot4 = slot0
							slot4 = slot4._currentFleetVO
							slot5 = slot4
							slot4 = slot4.canRemove
							slot6 = slot3
							slot4 = slot4(slot5, slot6)

							if not slot4 then
								slot4 = slot0
								slot4 = slot4._currentFleetVO
								slot5 = slot4
								slot4 = slot4.getShipPos
								slot6 = slot3
								slot4, slot5 = slot4(slot5, slot6)
								slot6 = pg
								slot6 = slot6.TipsMgr
								slot7 = slot6
								slot6 = slot6.GetInstance
								slot6 = slot6(slot7)
								slot7 = slot6
								slot6 = slot6.ShowTips
								slot8 = i18n
								slot9 = "ship_formationUI_removeError_onlyShip"
								slot10 = slot3
								slot11 = slot10
								slot10 = slot10.getConfigTable
								slot10 = slot10(slot11)
								slot10 = slot10.name
								slot11 = slot0
								slot11 = slot11._currentFleetVO
								slot11 = slot11.name
								slot12 = Fleet
								slot12 = slot12.C_TEAM_NAME
								slot12 = slot12[slot5]

								slot6(slot7, slot8(slot9, slot10, slot11, slot12))

								slot6 = slot3

								slot6()
							else
								slot4 = pg
								slot4 = slot4.MsgboxMgr
								slot4 = slot4.GetInstance
								slot4 = slot4()
								slot5 = slot4
								slot4 = slot4.ShowMsgBox
								slot6 = {
									hideNo = false,
									zIndex = -30
								}
								slot7 = i18n
								slot8 = "ship_formationUI_quest_remove"
								slot9 = slot3
								slot10 = slot9
								slot9 = slot9.getName
								slot7 = slot7(slot8, slot9(slot10))
								slot6.content = slot7

								function slot7()
									slot0 = ipairs
									slot1 = slot0
									slot0, slot1, slot2 = slot0(slot1)

									for slot3, slot4 in slot0, slot1, slot2 do
										slot5 = slot1

										if slot4 == slot5 then
											slot5 = Object
											slot5 = slot5.Destroy
											slot6 = slot2
											slot6 = slot6.gameObject

											slot5(slot6)

											slot5 = PoolMgr
											slot5 = slot5.GetInstance
											slot5 = slot5()
											slot6 = slot5
											slot5 = slot5.ReturnSpineChar
											slot7 = slot3
											slot8 = slot7
											slot7 = slot7.getPrefab
											slot7 = slot7(slot8)
											slot8 = slot4

											slot5(slot6, slot7, slot8)

											slot5 = table
											slot5 = slot5.remove
											slot6 = slot0
											slot7 = slot3

											slot5(slot6, slot7)

											break
										end
									end

									slot0 = slot5
									slot1 = slot0
									slot0 = slot0.switchToDisplayMode

									slot0(slot1)

									slot0 = slot5
									slot1 = slot0
									slot0 = slot0.sortSiblingIndex

									slot0(slot1)

									slot0 = slot5
									slot1 = slot0
									slot0 = slot0.emit
									slot2 = FormationMediator
									slot2 = slot2.REMOVE_SHIP
									slot3 = slot3
									slot4 = slot5
									slot4 = slot4._currentFleetVO

									slot0(slot1, slot2, slot3, slot4)
								end

								slot6.onYes = slot7
								slot6.onNo = slot3

								slot4(slot5, slot6)
							end
						else
							slot4 = slot3

							slot4()
						end
					end
				end
			end

			slot4 = playSoundEffect
			slot5 = SFX_UI_HOME_PUT

			slot4(slot5)
		end

		slot25(slot26, slot27)

		slot25 = slot0
		slot26 = slot25
		slot25 = slot25.setCharacterPos
		slot27 = slot2
		slot28 = slot3
		slot29 = slot5

		slot25(slot26, slot27, slot28, slot29)
	end

	slot2 = {}

	function slot3(slot0, slot1)
		slot2 = ipairs
		slot3 = slot0
		slot2, slot3, slot4 = slot2(slot3)

		for slot5, slot6 in slot2, slot3, slot4 do
			slot7 = slot0
			slot7 = slot7.shipVOs
			slot7 = slot7[slot6]
			slot8 = slot7
			slot7 = slot7.getPrefab
			slot7 = slot7(slot8)
			slot8 = table
			slot8 = slot8.insert
			slot9 = slot1

			function slot10(slot0)
				slot1 = PoolMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.GetSpineChar
				slot3 = slot0
				slot4 = true

				function slot5(slot0)
					slot1 = slot0
					slot2 = slot0
					slot3 = slot1
					slot4 = slot2
					slot5 = slot3

					slot1(slot2, slot3, slot4, slot5)

					slot1 = slot4

					slot1()
				end

				slot1(slot2, slot3, slot4, slot5)
			end

			slot8(slot9, slot10)
		end
	end

	slot4 = slot0._currentFleetVO
	slot5 = slot4
	slot4 = slot4.getFleetType
	slot4 = slot4(slot5)
	slot5 = FleetType
	slot5 = slot5.Normal

	if slot4 == slot5 then
		slot5 = slot3
		slot6 = slot0._currentFleetVO
		slot6 = slot6.vanguardShips
		slot7 = Fleet
		slot7 = slot7.VANGUARD

		slot5(slot6, slot7)

		slot5 = slot3
		slot6 = slot0._currentFleetVO
		slot6 = slot6.mainShips
		slot7 = Fleet
		slot7 = slot7.MAIN

		slot5(slot6, slot7)
	else
		slot5 = FleetType
		slot5 = slot5.Submarine

		if slot4 == slot5 then
			slot5 = slot3
			slot6 = slot0._currentFleetVO
			slot6 = slot6.subShips
			slot7 = Fleet
			slot7 = slot7.SUBMARINE

			slot5(slot6, slot7)
		end
	end

	slot5 = #slot2
	slot6 = 0

	if slot5 > slot6 then
		slot5 = pg
		slot5 = slot5.UIMgr
		slot6 = slot5
		slot5 = slot5.GetInstance
		slot5 = slot5(slot6)
		slot6 = slot5
		slot5 = slot5.LoadingOn

		slot5(slot6)
	end

	slot5 = parallelAsync
	slot6 = slot2

	function slot7(slot0)
		slot1 = pg
		slot1 = slot1.UIMgr
		slot2 = slot1
		slot1 = slot1.GetInstance
		slot1 = slot1(slot2)
		slot2 = slot1
		slot1 = slot1.LoadingOff

		slot1(slot2)

		slot1 = slot0
		slot1 = slot1.exited

		if slot1 then
			return
		end

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.sortSiblingIndex

		slot1(slot2)
	end

	slot5(slot6, slot7)
end

slot0.loadAllCharacter = slot1

function slot1(slot0)
	slot1 = {}
	slot2 = Fleet
	slot2 = slot2.MAIN
	slot1[1] = slot2
	slot2 = Fleet
	slot2 = slot2.VANGUARD
	slot1[2] = slot2
	slot2 = Fleet
	slot2 = slot2.SUBMARINE
	slot1[3] = slot2
	slot2 = _
	slot2 = slot2.each
	slot3 = slot1

	function slot4(slot0)
		slot1 = ipairs
		slot2 = slot0
		slot2 = slot2._characterList
		slot2 = slot2[slot0]
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot6 = slot0
			slot7 = slot6
			slot6 = slot6.setCharacterPos
			slot8 = slot0
			slot9 = slot4
			slot10 = slot5

			slot6(slot7, slot8, slot9, slot10)
		end
	end

	slot2(slot3, slot4)
end

slot0.setAllCharacterPos = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot4 = findTF
	slot5 = slot3
	slot6 = "model"
	slot4 = slot4(slot5, slot6)
	slot5 = SetActive
	slot6 = slot4
	slot7 = true

	slot5(slot6, slot7)

	slot5 = slot0._gridTFs
	slot5 = slot5[slot1]
	slot5 = slot5[slot2]
	slot6 = slot5.localPosition
	slot7 = LeanTween
	slot7 = slot7.cancel
	slot8 = go
	slot9 = slot4

	slot7(slot8(slot9))

	slot7 = Vector3
	slot8 = slot6.x
	slot9 = slot6.y
	slot10 = slot6.z
	slot10 = -15 + slot10
	slot10 = slot10 + slot2
	slot7 = slot7(slot8, slot9, slot10)
	slot3.localPosition = slot7
	slot7 = Vector3
	slot8 = 0
	slot9 = 20
	slot10 = 0
	slot7 = slot7(slot8, slot9, slot10)
	slot4.localPosition = slot7
	slot7 = LeanTween
	slot7 = slot7.moveY
	slot8 = slot4
	slot9 = 0
	slot10 = 0.5
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = slot7
	slot7 = slot7.setDelay
	slot9 = 0.5

	slot7(slot8, slot9)

	slot7 = SetActive
	slot9 = slot5
	slot8 = slot5.Find
	slot10 = "shadow"
	slot8 = slot8(slot9, slot10)
	slot9 = true

	slot7(slot8, slot9)

	slot7 = SetAction
	slot8 = slot4
	slot9 = "stand"

	slot7(slot8, slot9)
end

slot0.setCharacterPos = slot1

function slot1(slot0, slot1)
	slot2 = slot0._currentFleetVO
	slot3 = slot2
	slot2 = slot2.getTeamByName
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = slot0._gridTFs
	slot3 = slot3[slot1]
	slot4 = ipairs
	slot5 = slot3
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = SetActive
		slot11 = slot8
		slot10 = slot8.Find
		slot12 = "shadow"
		slot10 = slot10(slot11, slot12)
		slot11 = false

		slot9(slot10, slot11)

		slot9 = SetActive
		slot11 = slot8
		slot10 = slot8.Find
		slot12 = "tip"
		slot10 = slot10(slot11, slot12)
		slot11 = false

		slot9(slot10, slot11)
	end

	slot4 = Fleet
	slot4 = slot4.MAIN

	if slot1 == slot4 then
		slot4 = slot0._currentFleetVO
		slot5 = slot4
		slot4 = slot4.getTeamByName
		slot6 = Fleet
		slot6 = slot6.VANGUARD
		slot4 = slot4(slot5, slot6)
		slot4 = #slot4

		if slot4 == 0 then
			return
		end
	end

	slot4 = #slot2
	slot5 = 3

	if slot4 < slot5 then
		slot5 = slot4 + 1
		slot5 = slot3[slot5]
		slot7 = slot5
		slot6 = slot5.Find
		slot8 = "tip"
		slot6 = slot6(slot7, slot8)
		slot8 = slot6
		slot7 = slot6.GetComponent
		slot9 = "Button"
		slot7 = slot7(slot8, slot9)
		slot8 = true
		slot7.enabled = slot8
		slot7 = onButton
		slot8 = slot0
		slot9 = slot6

		function slot10()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = FormationMediator
			slot2 = slot2.CHANGE_FLEET_SHIP
			slot3 = nil
			slot4 = slot0
			slot4 = slot4._currentFleetVO
			slot5 = slot1
			slot5 = slot5.TOGGLE_FORMATION
			slot6 = slot2

			slot0(slot1, slot2, slot3, slot4, slot5, slot6)
		end

		slot11 = SFX_UI_FORMATION_ADD

		slot7(slot8, slot9, slot10, slot11)

		slot7 = Vector3
		slot8 = 0
		slot9 = 0
		slot10 = 1
		slot7 = slot7(slot8, slot9, slot10)
		slot6.localScale = slot7
		slot7 = SetActive
		slot8 = slot6
		slot9 = true

		slot7(slot8, slot9)

		slot7 = LeanTween
		slot7 = slot7.value
		slot8 = go
		slot9 = slot6
		slot8 = slot8(slot9)
		slot9 = 0
		slot10 = 1
		slot11 = 1
		slot7 = slot7(slot8, slot9, slot10, slot11)
		slot8 = slot7
		slot7 = slot7.setOnUpdate
		slot9 = System
		slot9 = slot9.Action_float

		function slot10(slot0)
			slot1 = slot0
			slot2 = Vector3
			slot3 = slot0
			slot4 = slot0
			slot5 = 1
			slot2 = slot2(slot3, slot4, slot5)
			slot1.localScale = slot2
		end

		slot7 = slot7(slot8, slot9(slot10))
		slot8 = slot7
		slot7 = slot7.setEase
		slot9 = LeanTweenType
		slot9 = slot9.easeOutBack

		slot7(slot8, slot9)
	end
end

slot0.resetGrid = slot1

function slot1(slot0)
	SetActive(slot0._gridTFs.main[1]:Find("flag"), #slot0._currentFleetVO:getTeamByName(Fleet.MAIN) ~= 0)
	SetActive(slot0._gridTFs.submarine[1]:Find("flag"), #slot0._currentFleetVO:getTeamByName(Fleet.SUBMARINE) ~= 0)
	removeAllChildren(slot0._buffGroup)

	slot2, slot3, slot4 = ipairs({})

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = cloneTplTo
		slot8 = slot0._buffModel
		slot9 = slot0._buffGroup
		slot7 = slot7(slot8, slot9)
		slot8 = tf
		slot9 = slot7
		slot8 = slot8(slot9)
		slot9 = slot8
		slot8 = slot8.SetAsFirstSibling

		slot8(slot9)

		slot8 = SetActive
		slot10 = slot7
		slot9 = slot7.Find
		slot11 = "dot_list/"
		slot12 = slot6.type
		slot11 = slot11 .. slot12
		slot9 = slot9(slot10, slot11)
		slot10 = true

		slot8(slot9, slot10)

		slot9 = slot7
		slot8 = slot7.Find
		slot10 = "buff_describe"
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Text
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot6.describe
		slot8.text = slot9
	end
end

slot0.resetFormationComponent = slot1

function slot1(slot0, slot1, slot2)
	slot3 = 1
	slot4 = 3
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = {}
		slot8 = Fleet
		slot8 = slot8.VANGUARD
		slot7[1] = slot8
		slot8 = Fleet
		slot8 = slot8.MAIN
		slot7[2] = slot8
		slot8 = Fleet
		slot8 = slot8.SUBMARINE
		slot7[3] = slot8
		slot8 = _
		slot8 = slot8.each
		slot9 = slot7

		function slot10(slot0)
			slot1 = setActive
			slot2 = slot0
			slot2 = slot2._gridTFs
			slot2 = slot2[slot0]
			slot3 = slot1
			slot2 = slot2[slot3]
			slot3 = slot2
			slot2 = slot2.Find
			slot4 = "tip"
			slot2 = slot2(slot3, slot4)
			slot3 = false

			slot1(slot2, slot3)
		end

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot0._gridTFs
		slot9 = slot9[slot2]
		slot9 = slot9[slot6]
		slot10 = slot9
		slot9 = slot9.Find
		slot11 = "shadow"
		slot9 = slot9(slot10, slot11)
		slot10 = false

		slot8(slot9, slot10)
	end

	slot3 = slot0._characterList
	slot3 = slot3[slot2]
	slot4 = ipairs
	slot5 = slot3
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = findTF
		slot10 = slot8
		slot11 = "model"
		slot9 = slot9(slot10, slot11)

		if slot8 ~= slot1 then
			slot10 = LeanTween
			slot10 = slot10.moveY
			slot11 = rtf
			slot12 = slot9
			slot11 = slot11(slot12)
			slot12 = slot9.localPosition
			slot12 = slot12.y
			slot12 = slot12 + 20
			slot13 = 0.5

			slot10(slot11, slot12, slot13)

			slot10 = tf
			slot11 = slot9
			slot10 = slot10(slot11)
			slot11 = slot10
			slot10 = slot10.Find
			slot12 = "mouseChild"
			slot10 = slot10(slot11, slot12)
			slot11 = slot10
			slot10 = slot10.GetComponent
			slot12 = "EventTriggerListener"
			slot10 = slot10(slot11, slot12)
			slot11 = slot0.eventTriggers
			slot12 = true
			slot11[slot10] = slot12
			slot12 = slot10
			slot11 = slot10.AddPointEnterFunc

			function slot13()
				slot0 = ipairs
				slot1 = slot0
				slot0, slot1, slot2 = slot0(slot1)

				for slot3, slot4 in slot0, slot1, slot2 do
					slot5 = slot1

					if slot4 == slot5 then
						slot5 = slot2
						slot6 = slot5
						slot5 = slot5.shift
						slot7 = slot2
						slot7 = slot7._shiftIndex
						slot8 = slot3
						slot9 = slot3

						slot5(slot6, slot7, slot8, slot9)

						break
					end
				end
			end

			slot11(slot12, slot13)
		else
			slot0._shiftIndex = slot7
			slot10 = tf
			slot11 = slot9
			slot10 = slot10(slot11)
			slot11 = slot10
			slot10 = slot10.Find
			slot12 = "mouseChild"
			slot10 = slot10(slot11, slot12)
			slot11 = slot10
			slot10 = slot10.GetComponent
			slot12 = typeof
			slot13 = Image
			slot10 = slot10(slot11, slot12(slot13))
			slot11 = false
			slot10.enabled = slot11
		end

		slot10 = SetAction
		slot11 = slot9
		slot12 = "normal"

		slot10(slot11, slot12)
	end
end

slot0.switchToShiftMode = slot1

function slot1(slot0)
	function slot1(slot0)
		slot1 = ipairs
		slot2 = slot0
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot6 = findTF
			slot7 = slot5
			slot8 = "model"
			slot6 = slot6(slot7, slot8)
			slot7 = tf
			slot8 = slot6
			slot7 = slot7(slot8)
			slot8 = slot7
			slot7 = slot7.Find
			slot9 = "mouseChild"
			slot7 = slot7(slot8, slot9)

			if slot7 then
				slot9 = slot7
				slot8 = slot7.GetComponent
				slot10 = "EventTriggerListener"
				slot8 = slot8(slot9, slot10)

				if slot8 then
					slot10 = slot8
					slot9 = slot8.RemovePointEnterFunc

					slot9(slot10)
				end

				slot9 = slot0
				slot9 = slot9._shiftIndex

				if slot4 == slot9 then
					slot10 = slot7
					slot9 = slot7.GetComponent
					slot11 = typeof
					slot12 = Image
					slot9 = slot9(slot10, slot11(slot12))
					slot10 = true
					slot9.enabled = slot10
				end
			end
		end
	end

	slot2 = slot1
	slot3 = slot0._characterList
	slot4 = Fleet
	slot4 = slot4.VANGUARD
	slot3 = slot3[slot4]

	slot2(slot3)

	slot2 = slot1
	slot3 = slot0._characterList
	slot4 = Fleet
	slot4 = slot4.MAIN
	slot3 = slot3[slot4]

	slot2(slot3)

	slot2 = slot1
	slot3 = slot0._characterList
	slot4 = Fleet
	slot4 = slot4.SUBMARINE
	slot3 = slot3[slot4]

	slot2(slot3)

	slot2 = nil
	slot0._shiftIndex = slot2
end

slot0.switchToDisplayMode = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot4 = slot0._characterList
	slot4 = slot4[slot3]
	slot5 = slot0._gridTFs
	slot5 = slot5[slot3]
	slot6 = slot0._currentFleetVO
	slot7 = slot6
	slot6 = slot6.getTeamByName
	slot8 = slot3
	slot6 = slot6(slot7, slot8)
	slot7 = slot4[slot2]
	slot8 = findTF
	slot9 = slot7
	slot10 = "model"
	slot8 = slot8(slot9, slot10)
	slot9 = slot5[slot1]
	slot10 = slot9.localPosition
	slot11 = Vector3
	slot12 = slot10.x
	slot13 = slot10.y
	slot13 = slot13 + 20
	slot14 = slot10.z
	slot14 = -15 + slot14
	slot14 = slot14 + slot1
	slot11 = slot11(slot12, slot13, slot14)
	slot7.localPosition = slot11
	slot11 = LeanTween
	slot11 = slot11.cancel
	slot12 = go
	slot13 = slot8

	slot11(slot12(slot13))

	slot11 = slot4[slot2]
	slot12 = slot4[slot1]
	slot4[slot2] = slot12
	slot4[slot1] = slot11
	slot11 = slot6[slot2]
	slot12 = slot6[slot1]
	slot6[slot2] = slot12
	slot6[slot1] = slot11
	slot11 = slot0._cards
	slot11 = slot11[slot3]
	slot12 = #slot11
	slot13 = 0

	if slot12 > slot13 then
		slot12 = slot11[slot2]
		slot13 = slot11[slot1]
		slot11[slot2] = slot13
		slot11[slot1] = slot12
	end

	slot0._shiftIndex = slot2
end

slot0.shift = slot1

function slot1(slot0)
	slot1 = 0
	slot2 = {
		2,
		1,
		3
	}
	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0._characterList
		slot9 = Fleet
		slot9 = slot9.MAIN
		slot8 = slot8[slot9]
		slot8 = slot8[slot7]

		if slot8 then
			slot9 = tf
			slot10 = slot8
			slot9 = slot9(slot10)
			slot10 = slot9
			slot9 = slot9.SetSiblingIndex
			slot11 = slot1

			slot9(slot10, slot11)

			slot1 = slot1 + 1
		end
	end

	slot3 = 3
	slot4 = 0

	while slot3 > slot4 do
		slot4 = slot0._characterList
		slot5 = Fleet
		slot5 = slot5.VANGUARD
		slot4 = slot4[slot5]
		slot4 = slot4[slot3]

		if slot4 then
			slot5 = tf
			slot6 = slot4
			slot5 = slot5(slot6)
			slot6 = slot5
			slot5 = slot5.SetSiblingIndex
			slot7 = slot1

			slot5(slot6, slot7)

			slot1 = slot1 + 1
		end

		slot3 = slot3 - 1
	end

	slot3 = 3
	slot4 = 0

	while slot3 > slot4 do
		slot4 = slot0._characterList
		slot5 = Fleet
		slot5 = slot5.SUBMARINE
		slot4 = slot4[slot5]
		slot4 = slot4[slot3]

		if slot4 then
			slot5 = tf
			slot6 = slot4
			slot5 = slot5(slot6)
			slot6 = slot5
			slot5 = slot5.SetSiblingIndex
			slot7 = slot1

			slot5(slot6, slot7)

			slot1 = slot1 + 1
		end

		slot3 = slot3 - 1
	end

	slot4 = {}
	slot5 = Fleet
	slot5 = slot5.MAIN
	slot4[1] = slot5
	slot5 = Fleet
	slot5 = slot5.VANGUARD
	slot4[2] = slot5
	slot5 = Fleet
	slot5 = slot5.SUBMARINE
	slot4[3] = slot5
	slot5 = _
	slot5 = slot5.each
	slot6 = slot4

	function slot7(slot0)
		slot1 = slot0
		slot1 = slot1._cards
		slot1 = slot1[slot0]
		slot2 = #slot1
		slot3 = 0

		if slot2 > slot3 then
			slot2 = 1
			slot3 = #slot1
			slot4 = 1

			for slot5 = slot2, slot3, slot4 do
				slot6 = slot1[slot5]
				slot6 = slot6.tr
				slot7 = slot6
				slot6 = slot6.SetSiblingIndex
				slot8 = slot5

				slot6(slot7, slot8)
			end
		end
	end

	slot5(slot6, slot7)
end

slot0.sortSiblingIndex = slot1

function slot1(slot0)
	slot1 = SetActive
	slot2 = slot0._prevPage
	slot4 = slot0
	slot3 = slot0.selectFleetByStep
	slot5 = -1

	slot1(slot2, slot3(slot4, slot5))

	slot1 = SetActive
	slot2 = slot0._nextPage
	slot4 = slot0
	slot3 = slot0.selectFleetByStep
	slot5 = 1

	slot1(slot2, slot3(slot4, slot5))

	slot1 = setActive
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "gear_score"
	slot2 = slot2(slot3, slot4)
	slot3 = true

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0._vanguardGS
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0._mainGS
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0._subGS
	slot3 = false

	slot1(slot2, slot3)

	slot1 = slot0._currentFleetVO
	slot2 = slot1
	slot1 = slot1.GetPropertiesSum
	slot1 = slot1(slot2)
	slot2 = slot0._currentFleetVO
	slot3 = slot2
	slot2 = slot2.GetGearScoreSum
	slot4 = Fleet
	slot4 = slot4.VANGUARD
	slot2 = slot2(slot3, slot4)
	slot3 = slot0._currentFleetVO
	slot4 = slot3
	slot3 = slot3.GetGearScoreSum
	slot5 = Fleet
	slot5 = slot5.MAIN
	slot3 = slot3(slot4, slot5)
	slot4 = slot0._currentFleetVO
	slot5 = slot4
	slot4 = slot4.GetGearScoreSum
	slot6 = Fleet
	slot6 = slot6.SUBMARINE
	slot4 = slot4(slot5, slot6)
	slot5 = slot0._currentFleetVO
	slot6 = slot5
	slot5 = slot5.GetCostSum
	slot5 = slot5(slot6)
	slot6 = slot0.tweenNumText
	slot7 = slot0._cannonPower
	slot8 = slot1.cannon

	slot6(slot7, slot8)

	slot6 = slot0.tweenNumText
	slot7 = slot0._torpedoPower
	slot8 = slot1.torpedo

	slot6(slot7, slot8)

	slot6 = slot0.tweenNumText
	slot7 = slot0._AAPower
	slot8 = slot1.antiAir

	slot6(slot7, slot8)

	slot6 = slot0.tweenNumText
	slot7 = slot0._airPower
	slot8 = slot1.air

	slot6(slot7, slot8)

	slot6 = slot0.tweenNumText
	slot7 = slot0._cost
	slot8 = slot5.oil

	slot6(slot7, slot8)

	slot6 = OPEN_AIR_DOMINANCE

	if slot6 then
		slot6 = setActive
		slot7 = slot0._airDominance
		slot7 = slot7.parent
		slot8 = true

		slot6(slot7, slot8)

		slot6 = slot0.tweenNumText
		slot7 = slot0._airDominance
		slot8 = slot0._currentFleetVO
		slot9 = slot8
		slot8 = slot8.getFleetAirDominanceValue

		slot6(slot7, slot8(slot9))
	else
		slot6 = setActive
		slot7 = slot0._airDominance
		slot7 = slot7.parent
		slot8 = false

		slot6(slot7, slot8)
	end

	slot6 = slot0._currentFleetVO
	slot7 = slot6
	slot6 = slot6.getFleetType
	slot6 = slot6(slot7)
	slot7 = FleetType
	slot7 = slot7.Normal

	if slot6 == slot7 then
		slot7 = setActive
		slot8 = slot0._vanguardGS
		slot9 = true

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot0._mainGS
		slot9 = true

		slot7(slot8, slot9)

		slot7 = slot0.tweenNumText
		slot8 = slot0._vanguardGS
		slot9 = slot8
		slot8 = slot8.Find
		slot10 = "Text"
		slot8 = slot8(slot9, slot10)
		slot9 = slot2

		slot7(slot8, slot9)

		slot7 = slot0.tweenNumText
		slot8 = slot0._mainGS
		slot9 = slot8
		slot8 = slot8.Find
		slot10 = "Text"
		slot8 = slot8(slot9, slot10)
		slot9 = slot3

		slot7(slot8, slot9)
	else
		slot7 = FleetType
		slot7 = slot7.Submarine

		if slot6 == slot7 then
			slot7 = setActive
			slot8 = slot0._subGS
			slot9 = true

			slot7(slot8, slot9)

			slot7 = slot0.tweenNumText
			slot8 = slot0._subGS
			slot9 = slot8
			slot8 = slot8.Find
			slot10 = "Text"
			slot8 = slot8(slot9, slot10)
			slot9 = slot4

			slot7(slot8, slot9)
		end
	end

	slot8 = slot0
	slot7 = slot0.SetFleetNameLabel

	slot7(slot8)

	slot7 = setText
	slot8 = slot0._fleetNumText
	slot9 = slot0._currentFleetVO
	slot10 = slot9
	slot9 = slot9.getIndex

	slot7(slot8, slot9(slot10))
end

slot0.displayFleetInfo = slot1

function slot1(slot0, slot1)
	slot2 = SetActive
	slot3 = slot0._renamePanel
	slot4 = slot1

	slot2(slot3, slot4)

	if slot1 then
		slot2 = pg
		slot2 = slot2.UIMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.BlurPanel
		slot4 = slot0._renamePanel
		slot5 = false

		slot2(slot3, slot4, slot5)

		slot2 = getText
		slot3 = slot0._fleetNameText
		slot2 = slot2(slot3)
		slot3 = setInputText
		slot4 = findTF
		slot5 = slot0._renamePanel
		slot6 = "frame/name_field"
		slot4 = slot4(slot5, slot6)
		slot5 = slot2

		slot3(slot4, slot5)
	else
		slot2 = pg
		slot2 = slot2.UIMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.UnblurPanel
		slot4 = slot0._renamePanel
		slot5 = slot0._tf

		slot2(slot3, slot4, slot5)
	end
end

slot0.DisplayRenamePanel = slot1

function slot1(slot0)
	slot1 = SetActive
	slot2 = slot0._attrFrame
	slot3 = false

	slot1(slot2, slot3)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnblurPanel
	slot3 = slot0._blurLayer
	slot4 = slot0._tf

	slot1(slot2, slot3, slot4)
end

slot0.hideAttrFrame = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.BlurPanel
	slot3 = slot0._blurLayer
	slot4 = false

	slot1(slot2, slot3, slot4)

	slot1 = SetActive
	slot2 = slot0._attrFrame
	slot3 = true

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.initAttrFrame

	slot1(slot2)
end

slot0.displayAttrFrame = slot1

function slot1(slot0)
	slot1 = {}
	slot2 = Fleet
	slot2 = slot2.MAIN
	slot3 = slot0._currentFleetVO
	slot3 = slot3.mainShips
	slot1[slot2] = slot3
	slot2 = Fleet
	slot2 = slot2.VANGUARD
	slot3 = slot0._currentFleetVO
	slot3 = slot3.vanguardShips
	slot1[slot2] = slot3
	slot2 = Fleet
	slot2 = slot2.SUBMARINE
	slot3 = slot0._currentFleetVO
	slot3 = slot3.subShips
	slot1[slot2] = slot3
	slot2 = false
	slot3 = pairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0._cards
		slot8 = slot8[slot6]
		slot9 = #slot8

		if slot9 == 0 then
			slot10 = slot0
			slot9 = slot0.findTF
			slot11 = slot6
			slot12 = "/list"
			slot11 = slot11 .. slot12
			slot12 = slot0._attrFrame
			slot9 = slot9(slot10, slot11, slot12)
			slot10 = 1
			slot11 = 3
			slot12 = 1

			for slot13 = slot10, slot11, slot12 do
				slot14 = cloneTplTo
				slot15 = slot0._cardTpl
				slot16 = slot9
				slot14 = slot14(slot15, slot16)
				slot14 = slot14.gameObject
				slot15 = table
				slot15 = slot15.insert
				slot16 = slot8
				slot17 = FormationCard
				slot17 = slot17.New
				slot18 = slot14

				slot15(slot16, slot17(slot18))
			end

			slot2 = true
		end
	end

	if slot2 then
		slot4 = slot0
		slot3 = slot0.updateAttrFrame

		slot3(slot4)
	end
end

slot0.initAttrFrame = slot1

function slot1(slot0)
	slot1 = {}
	slot2 = Fleet
	slot2 = slot2.MAIN
	slot3 = slot0._currentFleetVO
	slot3 = slot3.mainShips
	slot1[slot2] = slot3
	slot2 = Fleet
	slot2 = slot2.VANGUARD
	slot3 = slot0._currentFleetVO
	slot3 = slot3.vanguardShips
	slot1[slot2] = slot3
	slot2 = Fleet
	slot2 = slot2.SUBMARINE
	slot3 = slot0._currentFleetVO
	slot3 = slot3.subShips
	slot1[slot2] = slot3
	slot2 = slot0._currentFleetVO
	slot3 = slot2
	slot2 = slot2.getFleetType
	slot2 = slot2(slot3)
	slot3 = pairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0._cards
		slot8 = slot8[slot6]
		slot9 = #slot8
		slot10 = 0

		if slot9 > slot10 then
			slot9 = FleetType
			slot9 = slot9.Submarine

			if slot2 == slot9 then
				slot9 = slot6 == Fleet.VANGUARD
				slot10 = 1
				slot11 = 3
				slot12 = 1

				for slot13 = slot10, slot11, slot12 do
					slot14 = #slot7

					if slot13 <= slot14 then
						slot14 = slot0.shipVOs
						slot15 = slot7[slot13]
						slot14 = slot14[slot15]
						slot15 = slot8[slot13]
						slot16 = slot15
						slot15 = slot15.update
						slot17 = slot14
						slot18 = slot9

						slot15(slot16, slot17, slot18)

						slot15 = slot8[slot13]
						slot16 = slot15
						slot15 = slot15.updateProps
						slot18 = slot0
						slot17 = slot0.getCardAttrProps
						slot19 = slot14

						slot15(slot16, slot17(slot18, slot19))
					else
						slot14 = slot8[slot13]
						slot15 = slot14
						slot14 = slot14.update
						slot16 = nil
						slot17 = slot9

						slot14(slot15, slot16, slot17)
					end

					slot15 = slot0
					slot14 = slot0.detachOnCardButton
					slot16 = slot8[slot13]

					slot14(slot15, slot16)

					if not slot9 then
						slot15 = slot0
						slot14 = slot0.attachOnCardButton
						slot16 = slot8[slot13]
						slot17 = slot6

						slot14(slot15, slot16, slot17)
					end
				end
			end
		end
	end

	setActive(slot0:findTF(Fleet.MAIN, slot0._attrFrame), slot2 == FleetType.Normal)
	setActive(slot0:findTF(Fleet.SUBMARINE, slot0._attrFrame), slot2 == FleetType.Submarine)
	setActive(slot0:findTF(Fleet.VANGUARD .. "/d", slot0._attrFrame), slot2 == FleetType.Normal)
	slot0:updateUltimateTitle()
end

slot0.updateAttrFrame = slot1

function slot1(slot0)
	slot1 = slot0._cards
	slot2 = Fleet
	slot2 = slot2.MAIN
	slot1 = slot1[slot2]
	slot2 = slot0._currentFleetVO
	slot2 = slot2.mainShips
	slot3 = #slot1
	slot4 = 0

	if slot3 > slot4 then
		slot3 = 1
		slot4 = #slot1
		slot5 = 1

		for slot6 = slot3, slot4, slot5 do
			slot1[slot6].shipState:SetActive(slot6 == 1)
		end
	end
end

slot0.updateUltimateTitle = slot1

function slot1(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getProperties
	slot2 = slot2(slot3)
	slot4 = slot1
	slot3 = slot1.getShipCombatPower
	slot3 = slot3(slot4)
	slot5 = slot1
	slot4 = slot1.getBattleTotalExpend
	slot4 = slot4(slot5)
	slot5 = {}
	slot6 = {}
	slot7 = i18n
	slot8 = "word_attr_durability"
	slot7 = slot7(slot8)
	slot6[1] = slot7
	slot7 = tostring
	slot8 = math
	slot8 = slot8.floor
	slot9 = slot2.durability
	slot6[MULTRES] = slot7(slot8(slot9))
	slot5[1] = slot6
	slot6 = {}
	slot7 = i18n
	slot8 = "word_attr_luck"
	slot7 = slot7(slot8)
	slot6[1] = slot7
	slot7 = ""
	slot8 = tostring
	slot9 = math
	slot9 = slot9.floor
	slot10 = slot4
	slot8 = slot8(slot9(slot10))
	slot7 = slot7 .. slot8
	slot6[2] = slot7
	slot5[2] = slot6
	slot6 = {}
	slot7 = i18n
	slot8 = "word_synthesize_power"
	slot7 = slot7(slot8)
	slot6[1] = slot7
	slot7 = "<color=#ffff00>"
	slot8 = math
	slot8 = slot8.floor
	slot9 = slot3
	slot8 = slot8(slot9)
	slot9 = "</color>"
	slot7 = slot7 .. slot8 .. slot9
	slot6[2] = slot7
	slot5[3] = slot6

	return slot5
end

slot0.getCardAttrProps = slot1

function slot1(slot0, slot1)
	slot2 = GetOrAddComponent
	slot3 = slot1.go
	slot4 = "EventTriggerListener"
	slot2 = slot2(slot3, slot4)
	slot4 = slot2
	slot3 = slot2.RemovePointDownFunc

	slot3(slot4)

	slot4 = slot2
	slot3 = slot2.RemovePointUpFunc

	slot3(slot4)

	slot4 = slot2
	slot3 = slot2.RemoveBeginDragFunc

	slot3(slot4)

	slot4 = slot2
	slot3 = slot2.RemoveDragFunc

	slot3(slot4)

	slot4 = slot2
	slot3 = slot2.RemoveDragEndFunc

	slot3(slot4)
end

slot0.detachOnCardButton = slot1

function slot1(slot0, slot1, slot2)
	slot3 = GetOrAddComponent
	slot4 = slot1.go
	slot5 = "EventTriggerListener"
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.eventTriggers
	slot5 = true
	slot4[slot3] = slot5
	slot4 = Vector2
	slot4 = slot4.zero
	slot6 = slot3
	slot5 = slot3.AddPointDownFunc

	function slot7(slot0, slot1)
		slot2 = slot1.position
		slot0 = slot2
	end

	slot5(slot6, slot7)

	slot6 = slot3
	slot5 = slot3.AddPointUpFunc

	function slot7(slot0, slot1)
		slot2 = slot0
		slot2 = slot2.carddrag

		if not slot2 then
			slot2 = slot1
			slot2 = slot2.go

			if slot0 == slot2 then
				slot2 = Vector2
				slot2 = slot2.Magnitude
				slot3 = slot2
				slot4 = slot1.position
				slot3 = slot3 - slot4
				slot2 = slot2(slot3)
				slot3 = 1

				if slot2 < slot3 then
					slot2 = slot1
					slot2 = slot2.shipVO

					if slot2 then
						slot2 = slot0
						slot3 = slot2
						slot2 = slot2.emit
						slot4 = FormationMediator
						slot4 = slot4.OPEN_SHIP_INFO
						slot5 = slot1
						slot5 = slot5.shipVO
						slot5 = slot5.id
						slot6 = slot0
						slot6 = slot6._currentFleetVO
						slot7 = slot3
						slot7 = slot7.TOGGLE_DETAIL

						slot2(slot3, slot4, slot5, slot6, slot7)
					else
						slot2 = slot0
						slot3 = slot2
						slot2 = slot2.emit
						slot4 = FormationMediator
						slot4 = slot4.CHANGE_FLEET_SHIP
						slot5 = slot1
						slot5 = slot5.shipVO
						slot6 = slot0
						slot6 = slot6._currentFleetVO
						slot7 = slot3
						slot7 = slot7.TOGGLE_DETAIL
						slot8 = slot4

						slot2(slot3, slot4, slot5, slot6, slot7, slot8)
					end

					slot2 = playSoundEffect
					slot3 = SFX_PANEL

					slot2(slot3)
				end
			end
		end

		slot2 = Vector2
		slot2 = slot2.zero
		slot2 = slot2
	end

	slot5(slot6, slot7)

	slot5 = slot1.shipVO

	if slot5 then
		slot5 = slot0._cards
		slot5 = slot5[slot2]
		slot6 = slot1.tr
		slot6 = slot6.parent
		slot7 = slot6
		slot6 = slot6.GetComponent
		slot8 = "ContentSizeFitter"
		slot6 = slot6(slot7, slot8)
		slot7 = slot1.tr
		slot7 = slot7.parent
		slot8 = slot7
		slot7 = slot7.GetComponent
		slot9 = "HorizontalLayoutGroup"
		slot7 = slot7(slot8, slot9)
		slot8 = slot1.tr
		slot8 = slot8.rect
		slot8 = slot8.width
		slot8 = slot8 * 0.5
		slot9 = nil
		slot10 = 0
		slot11 = {}

		function slot12()
			slot0 = 1
			slot1 = slot0
			slot1 = #slot1
			slot2 = 1

			for slot3 = slot0, slot1, slot2 do
				slot4 = slot0
				slot4 = slot4[slot3]

				if slot4 then
					slot4 = slot0
					slot4 = slot4[slot3]
					slot5 = slot1

					if slot4 ~= slot5 then
						slot4 = slot0
						slot4 = slot4[slot3]
						slot4 = slot4.tr
						slot5 = slot0
						slot5 = slot5[slot3]
						slot5 = slot5.tr
						slot5 = slot5.anchoredPosition
						slot5 = slot5 * 0.5
						slot6 = Vector2
						slot7 = slot2
						slot7 = slot7[slot3]
						slot7 = slot7.x
						slot8 = slot2
						slot8 = slot8[slot3]
						slot8 = slot8.y
						slot6 = slot6(slot7, slot8)
						slot6 = slot6 * 0.5
						slot5 = slot5 + slot6
						slot4.anchoredPosition = slot5
					end
				end
			end

			slot0 = slot3

			if slot0 then
				slot0 = slot4
				slot1 = Time
				slot1 = slot1.realtimeSinceStartup

				if slot0 <= slot1 then
					slot0 = slot5
					slot1 = slot0
					slot0 = slot0.OnDrag
					slot2 = slot3

					slot0(slot1, slot2)

					slot3 = nil
				end
			end
		end

		function slot13()
			slot0 = 1
			slot1 = slot0
			slot1 = #slot1
			slot2 = 1

			for slot3 = slot0, slot1, slot2 do
				slot4 = slot0
				slot4 = slot4[slot3]
				slot4 = slot4.tr
				slot5 = slot1
				slot5 = slot5[slot3]
				slot4.anchoredPosition = slot5
			end
		end

		slot14 = Timer
		slot14 = slot14.New
		slot15 = slot12
		slot16 = 0.03333333333333333
		slot17 = -1
		slot14 = slot14(slot15, slot16, slot17)
		slot16 = slot3
		slot15 = slot3.AddBeginDragFunc

		function slot17()
			slot0 = slot0
			slot0 = slot0.carddrag

			if slot0 then
				return
			end

			slot0 = slot0
			slot1 = slot1
			slot0._currentDragDelegate = slot1
			slot0 = slot0
			slot1 = slot2
			slot0.carddrag = slot1
			slot0 = slot3
			slot1 = false
			slot0.enabled = slot1
			slot0 = slot4
			slot1 = false
			slot0.enabled = slot1
			slot0 = slot2
			slot0 = slot0.tr
			slot1 = slot0
			slot0 = slot0.SetSiblingIndex
			slot2 = slot5
			slot2 = #slot2

			slot0(slot1, slot2)

			slot0 = 1
			slot1 = slot5
			slot1 = #slot1
			slot2 = 1

			for slot3 = slot0, slot1, slot2 do
				slot4 = slot5
				slot4 = slot4[slot3]
				slot5 = slot2

				if slot4 == slot5 then
					slot4 = slot0
					slot4._shiftIndex = slot3
				end

				slot4 = slot6
				slot5 = slot5
				slot5 = slot5[slot3]
				slot5 = slot5.tr
				slot5 = slot5.anchoredPosition
				slot4[slot3] = slot5
			end

			slot0 = slot7
			slot1 = slot0
			slot0 = slot0.Start

			slot0(slot1)

			slot0 = LeanTween
			slot0 = slot0.scale
			slot1 = slot2
			slot1 = slot1.paintingTr
			slot2 = Vector3
			slot3 = 1.1
			slot4 = 1.1
			slot5 = 0
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = 0.3

			slot0(slot1, slot2, slot3)
		end

		slot15(slot16, slot17)

		slot16 = slot3
		slot15 = slot3.AddDragFunc

		function slot17(slot0, slot1)
			slot2 = slot0
			slot2 = slot2.carddrag
			slot3 = slot1

			if slot2 ~= slot3 then
				return
			end

			slot2 = slot1
			slot2 = slot2.tr
			slot2 = slot2.localPosition
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.change2ScrPos
			slot5 = slot1
			slot5 = slot5.tr
			slot5 = slot5.parent
			slot6 = slot1.position
			slot3 = slot3(slot4, slot5, slot6)
			slot3 = slot3.x
			slot2.x = slot3
			slot3 = slot1
			slot3 = slot3.tr
			slot3.localPosition = slot2
			slot3 = slot2
			slot4 = Time
			slot4 = slot4.realtimeSinceStartup

			if slot4 < slot3 then
				slot3 = slot1

				return
			end

			slot3 = 1
			slot4 = 1
			slot5 = slot4
			slot5 = #slot5
			slot6 = 1

			for slot7 = slot4, slot5, slot6 do
				slot8 = slot4
				slot8 = slot8[slot7]
				slot9 = slot1

				if slot8 ~= slot9 then
					slot8 = slot4
					slot8 = slot8[slot7]
					slot8 = slot8.shipVO

					if slot8 and slot1.tr.localPosition.x > slot4[slot7].tr.localPosition.x + ((slot3 < slot0._shiftIndex and 1.1) or -1.1) * slot5 then
						slot3 = slot3 + 1
					end
				end
			end

			slot4 = slot0
			slot4 = slot4._shiftIndex

			if slot4 ~= slot3 then
				slot4 = slot0
				slot5 = slot4
				slot4 = slot4.shift
				slot6 = slot0
				slot6 = slot6._shiftIndex
				slot7 = slot3
				slot8 = slot6

				slot4(slot5, slot6, slot7, slot8)

				slot4 = Time
				slot4 = slot4.realtimeSinceStartup
				slot4 = slot4 + 0.15
				slot2 = slot4
			end
		end

		slot15(slot16, slot17)

		slot16 = slot3
		slot15 = slot3.AddDragEndFunc

		function slot17(slot0, slot1)
			slot2 = slot0
			slot2 = slot2.carddrag
			slot3 = slot1

			if slot2 ~= slot3 then
				return
			end

			function slot2()
				slot0 = slot0

				slot0()

				slot0 = slot1
				slot1 = true
				slot0.enabled = slot1
				slot0 = slot2
				slot1 = true
				slot0.enabled = slot1
				slot0 = slot3
				slot1 = nil
				slot0._shiftIndex = slot1
				slot0 = slot4
				slot1 = slot0
				slot0 = slot0.Stop

				slot0(slot1)

				slot0 = slot3
				slot1 = slot0
				slot0 = slot0.updateUltimateTitle

				slot0(slot1)

				slot0 = slot3
				slot1 = slot0
				slot0 = slot0.sortSiblingIndex

				slot0(slot1)

				slot0 = slot3
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = FormationMediator
				slot2 = slot2.CHANGE_FLEET_SHIPS_ORDER
				slot3 = slot3
				slot3 = slot3._currentFleetVO

				slot0(slot1, slot2, slot3)

				slot0 = slot5
				slot1 = true
				slot0.enabled = slot1
				slot0 = slot3
				slot1 = nil
				slot0.carddrag = slot1
			end

			resetCard = slot2
			slot2 = slot0
			slot2 = slot2._forceDropCharacter
			slot3 = slot0
			slot4 = nil
			slot3._forceDropCharacter = slot4
			slot3 = slot0
			slot4 = nil
			slot3._currentDragDelegate = slot4
			slot3 = slot6
			slot4 = false
			slot3.enabled = slot4

			if slot2 then
				slot3 = resetCard

				slot3()

				slot3 = slot1
				slot3 = slot3.paintingTr
				slot4 = Vector3
				slot5 = 1
				slot6 = 1
				slot7 = 0
				slot4 = slot4(slot5, slot6, slot7)
				slot3.localScale = slot4
			else
				slot3 = math
				slot3 = slot3.min
				slot4 = math
				slot4 = slot4.abs
				slot5 = slot1
				slot5 = slot5.tr
				slot5 = slot5.anchoredPosition
				slot5 = slot5.x
				slot6 = slot7
				slot7 = slot0
				slot7 = slot7._shiftIndex
				slot6 = slot6[slot7]
				slot6 = slot6.x
				slot5 = slot5 - slot6
				slot4 = slot4(slot5)
				slot4 = slot4 / 200
				slot5 = 1
				slot3 = slot3(slot4, slot5)
				slot3 = slot3 * 0.3
				slot4 = LeanTween
				slot4 = slot4.value
				slot5 = slot1
				slot5 = slot5.go
				slot6 = slot1
				slot6 = slot6.tr
				slot6 = slot6.anchoredPosition
				slot6 = slot6.x
				slot7 = slot7
				slot8 = slot0
				slot8 = slot8._shiftIndex
				slot7 = slot7[slot8]
				slot7 = slot7.x
				slot8 = slot3
				slot4 = slot4(slot5, slot6, slot7, slot8)
				slot5 = slot4
				slot4 = slot4.setEase
				slot6 = LeanTweenType
				slot6 = slot6.easeOutCubic
				slot4 = slot4(slot5, slot6)
				slot5 = slot4
				slot4 = slot4.setOnUpdate
				slot6 = System
				slot6 = slot6.Action_float

				function slot7(slot0)
					slot1 = slot0
					slot1 = slot1.tr
					slot1 = slot1.anchoredPosition
					slot1.x = slot0
					slot2 = slot0
					slot2 = slot2.tr
					slot2.anchoredPosition = slot1
				end

				slot4 = slot4(slot5, slot6(slot7))
				slot5 = slot4
				slot4 = slot4.setOnComplete
				slot6 = System
				slot6 = slot6.Action

				function slot7()
					slot0 = resetCard

					slot0()

					slot0 = LeanTween
					slot0 = slot0.scale
					slot1 = slot0
					slot1 = slot1.paintingTr
					slot2 = Vector3
					slot3 = 1
					slot4 = 1
					slot5 = 0
					slot2 = slot2(slot3, slot4, slot5)
					slot3 = 0.3

					slot0(slot1, slot2, slot3)
				end

				slot4(slot5, slot6(slot7))
			end
		end

		slot15(slot16, slot17)
	end
end

slot0.attachOnCardButton = slot1

function slot1(slot0, slot1, slot2)
	slot3 = GameObject
	slot3 = slot3.Find
	slot4 = "OverlayCamera"
	slot3 = slot3(slot4)
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = "Camera"
	slot3 = slot3(slot4, slot5)
	slot4 = LuaHelper
	slot4 = slot4.ScreenToLocal
	slot5 = slot1
	slot6 = slot2
	slot7 = slot3
	slot4 = slot4(slot5, slot6, slot7)

	return slot4
end

slot0.change2ScrPos = slot1

function slot1(slot0, slot1, slot2)
	LeanTween.value(go(slot0), 0, math.floor(slot1), slot2 or 0.7):setOnUpdate(System.Action_float(function (slot0)
		setText(slot0, math.floor(slot0))
	end))
end

slot0.tweenNumText = slot1

function slot1(slot0)
	slot1 = slot0.name

	if slot1 ~= "" then
		slot1 = slot0.name

		if slot1 == nil then
			slot1 = Fleet
			slot1 = slot1.DEFAULT_NAME
			slot2 = slot0.id
			slot1 = slot1[slot2]

			return slot1
		else
			slot1 = slot0.name

			return slot1
		end
	end
end

slot0.defaultFleetName = slot1

function slot1(slot0)
	slot1 = 0
	slot2 = pairs
	slot3 = slot0._fleetVOs
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot1 = slot1 + 1
	end

	return slot1
end

slot0.GetFleetCount = slot1

function slot1(slot0, slot1)
	slot2 = slot0.btnRegular
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "title_selected/arrow"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.btnSub
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "title_selected/arrow"
	slot3 = slot3(slot4, slot5)
	slot4 = setActive
	slot5 = slot2
	slot6 = slot1

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot3
	slot6 = slot1

	slot4(slot5, slot6)

	if slot1 then
		slot4 = LeanTween
		slot4 = slot4.moveLocalY
		slot5 = go
		slot6 = slot2
		slot5 = slot5(slot6)
		slot6 = slot2.localPosition
		slot6 = slot6.y
		slot6 = slot6 + 8
		slot7 = 0.8
		slot4 = slot4(slot5, slot6, slot7)
		slot5 = slot4
		slot4 = slot4.setEase
		slot6 = LeanTweenType
		slot6 = slot6.easeInOutSine
		slot4 = slot4(slot5, slot6)
		slot5 = slot4
		slot4 = slot4.setLoopPingPong
		slot6 = -1

		slot4(slot5, slot6)

		slot4 = LeanTween
		slot4 = slot4.moveLocalY
		slot5 = go
		slot6 = slot3
		slot5 = slot5(slot6)
		slot6 = slot3.localPosition
		slot6 = slot6.y
		slot6 = slot6 + 8
		slot7 = 0.8
		slot4 = slot4(slot5, slot6, slot7)
		slot5 = slot4
		slot4 = slot4.setEase
		slot6 = LeanTweenType
		slot6 = slot6.easeInOutSine
		slot4 = slot4(slot5, slot6)
		slot5 = slot4
		slot4 = slot4.setLoopPingPong
		slot6 = -1

		slot4(slot5, slot6)
	else
		slot4 = LeanTween
		slot4 = slot4.cancel
		slot5 = go
		slot6 = slot2

		slot4(slot5(slot6))

		slot4 = LeanTween
		slot4 = slot4.cancel
		slot5 = go
		slot6 = slot3

		slot4(slot5(slot6))

		slot4 = slot2.localPosition
		slot5 = 46
		slot4.y = slot5
		slot2.localPosition = slot4
		slot5 = slot3.localPosition
		slot6 = 46
		slot5.y = slot6
		slot3.localPosition = slot5
	end
end

slot0.tweenTabArrow = slot1

function slot1(slot0, slot1, slot2)
	slot3 = ipairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot2[slot6]

		if slot8 then
			slot8 = findTF
			slot9 = slot2[slot6]
			slot10 = "model"
			slot8 = slot8(slot9, slot10)

			if slot8 then
				slot9 = slot0.shipVOs
				slot9 = slot9[slot7]
				slot10 = slot9
				slot9 = slot9.getPrefab
				slot9 = slot9(slot10)
				slot10 = PoolMgr
				slot10 = slot10.GetInstance
				slot10 = slot10()
				slot11 = slot10
				slot10 = slot10.ReturnSpineChar
				slot12 = slot9
				slot13 = slot8.gameObject

				slot10(slot11, slot12, slot13)
			end

			slot9 = nil
			slot2[slot6] = slot9
		end
	end
end

slot0.recycleCharacterList = slot1

function slot1(slot0)
	slot1 = pairs
	slot2 = slot0._cards
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = ipairs
		slot7 = slot5
		slot6, slot7, slot8 = slot6(slot7)

		for slot9, slot10 in slot6, slot7, slot8 do
			slot12 = slot10
			slot11 = slot10.clear

			slot11(slot12)
		end
	end
end

slot0.recyclePainting = slot1

function slot1(slot0)
	slot1 = playSoundEffect
	slot2 = SFX_CANCEL

	slot1(slot2)

	slot1 = triggerButton
	slot2 = slot0.backBtn

	slot1(slot2)
end

slot0.onBackPressed = slot1

function slot1(slot0)
	slot1 = slot0.commanderFormationPanel
	slot2 = slot1
	slot1 = slot1.detach

	slot1(slot2)

	slot1 = slot0._attrFrame
	slot1 = slot1.gameObject
	slot1 = slot1.activeSelf

	if slot1 then
		slot1 = pg
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.UnblurPanel
		slot3 = slot0._blurLayer
		slot4 = slot0._tf

		slot1(slot2, slot3, slot4)
	end

	slot2 = slot0
	slot1 = slot0.recycleCharacterList
	slot3 = slot0._currentFleetVO
	slot3 = slot3.mainShips
	slot4 = slot0._characterList
	slot5 = Fleet
	slot5 = slot5.MAIN
	slot4 = slot4[slot5]

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.recycleCharacterList
	slot3 = slot0._currentFleetVO
	slot3 = slot3.vanguardShips
	slot4 = slot0._characterList
	slot5 = Fleet
	slot5 = slot5.VANGUARD
	slot4 = slot4[slot5]

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.recycleCharacterList
	slot3 = slot0._currentFleetVO
	slot3 = slot3.subShips
	slot4 = slot0._characterList
	slot5 = Fleet
	slot5 = slot5.SUBMARINE
	slot4 = slot4[slot5]

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.recyclePainting

	slot1(slot2)

	slot1 = ipairs
	slot2 = slot0._attachmentList
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = Object
		slot6 = slot6.Destroy
		slot7 = slot5

		slot6(slot7)
	end

	slot1 = nil
	slot0._attachmentList = slot1
	slot2 = slot0
	slot1 = slot0.tweenTabArrow
	slot3 = false

	slot1(slot2, slot3)

	slot1 = slot0.tweens

	if slot1 then
		slot1 = cancelTweens
		slot2 = slot0.tweens

		slot1(slot2)
	end

	slot1 = slot0.eventTriggers

	if slot1 then
		slot1 = pairs
		slot2 = slot0.eventTriggers
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot6 = ClearEventTrigger
			slot7 = slot4

			slot6(slot7)
		end

		slot1 = nil
		slot0.eventTriggers = slot1
	end
end

slot0.willExit = slot1

return slot0
