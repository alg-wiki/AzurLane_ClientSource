slot0 = class("FormationMediator", import("..base.ContextMediator"))
slot0.OPEN_SHIP_INFO = "FormationMediator:OPEN_SHIP_INFO"
slot0.ON_CHANGE_FLEET = "FormationMediator:ON_CHANGE_FLEET"
slot0.CHANGE_FLEET_NAME = "FormationMediator:CHANGE_FLEET_NAME"
slot0.CHANGE_FLEET_SHIP = "FormationMediator:CHANGE_FLEET_SHIP"
slot0.REMOVE_SHIP = "FormationMediator:REMOVE_SHIP"
slot0.CHANGE_FLEET_FORMATION = "FormationMediator:CHANGE_FLEET_FORMATION"
slot0.CHANGE_FLEET_SHIPS_ORDER = "FormationMediator:CHANGE_FLEET_SHIPS_ORDER"
slot0.COMMIT_FLEET = "FormationMediator:COMMIT_FLEET"
slot0.ON_SELECT_COMMANDER = "FormationMediator:ON_SELECT_COMMANDER"
slot0.ON_CMD_SKILL = "FormationMediator:ON_CMD_SKILL"

function slot0.register(slot0)
	slot1 = getProxy(BayProxy)

	slot1:setSelectShipId(nil)

	slot0.ships = slot1:getRawData()

	slot0.viewComponent:setShips(slot0.ships)

	slot2 = getProxy(FleetProxy)
	slot3 = slot2:getData()

	if slot2.EdittingFleet ~= nil then
		slot3[slot2.EdittingFleet.id] = slot2.EdittingFleet
	end

	slot0.viewComponent:SetFleets(slot3)
	slot0:bind(slot0.ON_CMD_SKILL, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				skill = slot1
			}
		}))
	end)
	slot0:bind(slot0.COMMIT_FLEET, function (slot0, slot1)
		slot0.commitEdit(slot1)
	end)
	slot0:bind(slot0.CHANGE_FLEET_NAME, function (slot0, slot1, slot2)
		slot0.commitEdit(function ()
			slot0:sendNotification(GAME.RENAME_FLEET, {
				id = slot1,
				name = GAME.RENAME_FLEET
			})
		end)
	end)
	slot0:bind(slot0.OPEN_SHIP_INFO, function (slot0, slot1, slot2, slot3)
		slot0.commitEdit(function ()
			slot0.contextData.number = slot1.id
			slot0.contextData.contextData.toggle = slot2
			slot0 = {}

			for slot4, slot5 in ipairs(slot1:getShipIds()) do
				table.insert(slot0, slot0.ships[slot5])
			end

			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				shipId = GAME.GO_SCENE,
				shipVOs = slot0
			})
		end)
	end)
	slot0:bind(slot0.ON_CHANGE_FLEET, function (slot0, slot1)
		slot0.commitEdit(function ()
			slot0.viewComponent:SetFleets(slot1:getData())
			slot0.viewComponent.SetFleets.viewComponent:SetCurrentFleetID(slot1.getData)
			slot0.viewComponent.SetFleets.viewComponent.SetCurrentFleetID.viewComponent:UpdateFleetView(true)
		end)
	end)
	slot0:bind(slot0.CHANGE_FLEET_FORMATION, function (slot0, slot1, slot2)
		slot2.formation = slot1

		slot0:refreshEdit(slot2)
	end)
	slot0:bind(slot0.CHANGE_FLEET_SHIPS_ORDER, function (slot0, slot1)
		slot0:refreshEdit(slot1)
	end)
	slot0:bind(slot0.REMOVE_SHIP, function (slot0, slot1, slot2)
		slot0.removeShipFromFleet(slot2, slot1)
		slot1:refreshEdit(slot2)
	end)
	slot0:bind(slot0.CHANGE_FLEET_SHIP, function (slot0, slot1, slot2, slot3, slot4)
		slot0.contextData.number = slot2.id
		slot0.contextData.toggle = slot3

		slot0.saveEdit()

		slot5 = 0

		if slot2.id == 1 and #slot2.ships <= 1 and slot1 ~= nil then
			slot5 = 1
		end

		slot6, slot7 = nil

		if slot1 == nil then
			slot6 = false
			slot7 = nil
		else
			slot6 = slot5 ~= 1
			slot7 = slot1.id
		end

		slot8 = {
			inExercise = true,
			inChapter = true,
			inPvp = false,
			inFleet = true,
			inClass = false,
			inTactics = false,
			inBackyard = false,
			inSham = true,
			inEvent = true,
			inAdmiral = true
		}
		slot9 = {}
		slot11 = getProxy(BayProxy).getRawData(slot10)

		if slot2:getFleetType() == FleetType.Submarine then
			for slot16, slot17 in pairs(slot11) do
				if table.contains(TeamType.SubShipType, slot17:getShipType()) then
					table.insert(slot9, slot17)
				end
			end
		else
			for slot16, slot17 in pairs(slot11) do
				if not table.contains(TeamType.SubShipType, slot17:getShipType()) then
					table.insert(slot9, slot17)
				end
			end
		end

		slot20.onShip, slot20.confirmSelect, slot20.onSelected = slot1.getDockCallbackFuncs(slot0, slot1, slot2, slot4)

		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMax = 1,
			shipVOs = Clone(slot9),
			activeShipId = slot7,
			selectedMin = slot5,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = slot6,
			teamFilter = slot4,
			leftTopInfo = i18n("word_formation"),
			onShip = slot13,
			confirmSelect = slot14,
			onSelected = slot15,
			flags = slot8,
			preView = slot0.viewComponent.__cname
		})
	end)
	slot0:bind(slot0.ON_SELECT_COMMANDER, function (slot0, slot1, slot2)
		slot0.contextData.toggle = FormationUI.TOGGLE_FORMATION
		slot0.contextData.number = slot2

		slot1:onSelectCommander(slot2)
	end)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
end

function slot0.onSelectCommander(slot0, slot1)
	slot2 = getProxy(FleetProxy)
	slot3 = getProxy(FleetProxy):getFleetById(slot1)
	slot4 = slot3:getCommanderByPos(slot0)
	slot5 = slot3:getCommanders()

	for slot10, slot11 in ipairs(slot6) do
		if slot4 and slot11 == slot4.id then
			table.remove(slot6, slot10)

			break
		end
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
		maxCount = 1,
		mode = CommandRoomScene.MODE_SELECT,
		activeCommanderId = slot4 and slot4.id,
		ignoredIds = slot6,
		onCommander = function (slot0)
			return true
		end,
		onSelected = function (slot0, slot1)
			slot2 = slot0[1]

			if not slot0 or slot0.id ~= slot2 then
				slot3 = getProxy(CommanderProxy):getCommanderById(slot2)

				for slot7, slot8 in pairs(slot1) do
					if slot8.groupId == slot3.groupId and slot7 ~= slot2 and slot2 ~= slot8.id then
						pg.TipsMgr:GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

						return
					end
				end
			end

			function slot4(slot0)
				if (slot0 == 2 and 1) or 2[] and slot2.id == slot0 then
					return true, slot1
				end

				return false
			end

			slot5 = {}
			slot6 = true
			slot7, slot8 = slot3(slot2)

			if slot7 then
				table.insert(slot5, function (slot0)
					pg.MsgboxMgr:GetInstance():ShowMsgBox({
						content = i18n("comander_repalce_tip", Fleet.DEFAULT_NAME[slot0.fleetId], (slot0.pos == 1 and i18n("commander_main_pos")) or i18n("commander_assistant_pos")),
						onYes = function ()
							pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
								commanderId = 0,
								fleetId = slot0.fleetId,
								pos = slot0.pos,
								callback = pg.m02
							})
						end,
						onNo = function ()
							slot0 = false

							slot1()
						end
					})
				end)
			end

			slot9, slot10 = slot4(slot2)

			if slot9 then
				table.insert(slot5, function (slot0)
					pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
						commanderId = 0,
						fleetId = slot0,
						pos = pg.m02.sendNotification,
						callback = slot0
					})
				end)
			end

			table.insert(slot5, function (slot0)
				if slot0 then
					pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
						fleetId = slot1,
						pos = slot2,
						commanderId = slot3,
						callback = function (slot0)
							if slot0.EdittingFleet then
								slot0.EdittingFleet.commanderIds = slot0.commanderIds
							end

							slot1()
						end
					})
				else
					slot0()
				end
			end)
			seriesAsync(slot5, slot1)
		end,
		onQuit = function (slot0)
			pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
				commanderId = 0,
				fleetId = slot0,
				pos = slot1,
				callback = function (slot0)
					if slot0.EdittingFleet then
						slot0.EdittingFleet.commanderIds = slot0.commanderIds
					end

					slot1()
				end
			})
		end
	})
end

function slot0.refreshEdit(slot0, slot1)
	slot2 = getProxy(FleetProxy)
	slot2.EdittingFleet = slot1
	slot2:getData()[slot1.id] = slot1

	slot0.viewComponent:SetFleets(slot3)
	slot0.viewComponent:UpdateFleetView(false)
end

function slot0.commitEdit(slot0)
	if getProxy(FleetProxy).EdittingFleet == nil or slot2:isFirstFleet() or slot2:isLegalToFight() == true or #slot2.ships == 0 then
		slot1:commitEdittingFleet(slot0)
	else
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_formationMediaror_trash_warning", slot2.defaultName),
			onYes = function ()
				slot0 = getProxy(BayProxy)
				slot1 = slot0:getRawData()
				slot3 = #slot0.ships

				for slot7 = #slot0.ships, 1, -1 do
					slot0:removeShip(slot1[slot2[slot7]])
				end

				slot1:commitEdittingFleet(slot2)

				getProxy(PlayerProxy).combatFleetId = 1
			end,
			onNo = function ()
				return
			end
		})
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		FleetProxy.FLEET_UPDATED,
		FleetProxy.FLEET_RENAMED,
		FleetProxy.FLEET_COMMIT,
		GAME.UPDATE_FLEET_DONE,
		PlayerProxy.UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == FleetProxy.FLEET_UPDATED then
		slot0.viewComponent:SetFleets(getProxy(FleetProxy).getData(slot4))
	elseif slot2 == FleetProxy.FLEET_RENAMED then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_formationMediator_changeNameSuccess"))
		slot0.viewComponent:SetFleets(slot5)
		slot0.viewComponent:UpdateFleetView(true)
		slot0.viewComponent:DisplayRenamePanel(false)
	end
end

function slot0.checkChangeShip(slot0, slot1, slot2)
	slot5 = getProxy(BayProxy).getRawData(slot3)
	slot6 = slot2.configId
	slot8 = getProxy(FleetProxy):getFleetByShip(slot2) and slot7.id == slot0.id

	if not slot8 and (not slot1 or not slot1:isSameKind(slot2)) then
		for slot12, slot13 in ipairs(slot0.ships) do
			if slot5[slot13]:isSameKind(slot2) then
				return false, i18n("ship_formationMediator_changeNameError_sameShip")
			end
		end
	end

	return true
end

function slot0.removeShipFromFleet(slot0, slot1)
	if not slot0:canRemove(slot1) then
		slot2, slot3 = slot0:getShipPos(slot1)

		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", slot1:getConfigTable().name, slot0.name, Fleet.C_TEAM_NAME[slot3]))

		return false
	end

	slot0:removeShip(slot1)

	getProxy(FleetProxy).EdittingFleet = slot0

	return true
end

function slot0.saveEdit()
	getProxy(FleetProxy):saveEdittingFleet()
end

function slot0.getDockCallbackFuncs(slot0, slot1, slot2, slot3)
	slot4 = getProxy(FleetProxy)
	slot5 = getProxy(BayProxy)

	return function (slot0, slot1)
		slot2, slot3 = Ship.ShipStateConflict("inFleet", slot0)

		if slot2 == Ship.STATE_CHANGE_FAIL then
			return false, i18n(slot3)
		elseif slot2 == Ship.STATE_CHANGE_CHECK then
			return Ship.ChangeStateCheckBox(slot3, slot0, slot1)
		end

		slot4, slot5 = slot0.checkChangeShip(slot1, slot2, slot0)

		if not slot4 then
			return false, slot5
		end

		if slot3:getFleetByShip(slot0) ~= nil and slot6.id ~= slot1.id and slot6.id ~= FleetProxy.PVP_FLEET_ID then
			if slot2 == nil and not slot6:canRemove(slot0) then
				slot7, slot8 = slot6:getShipPos(slot0)

				return false, i18n("ship_formationMediator_replaceError_onlyShip", slot6.defaultName, Fleet.C_TEAM_NAME[slot8])
			end

			if slot2 == nil then
				return true
			else
				slot4, slot5 = slot0.checkChangeShip(slot6, slot0, slot2)

				if not slot7 then
					return false, slot5
				end
			end
		end

		return true
	end, function (slot0, slot1, slot2)
		if not slot0:getShipById(slot0[1]) then
			slot1()

			return
		end

		if not slot1:getFleetByShip(slot3) or slot4.id == slot2.id or slot4.id == FleetProxy.PVP_FLEET_ID then
			slot1()

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = false,
			content = i18n("ship_formationMediator_quest_replace", slot4.defaultName),
			onYes = slot1
		})
	end, function (slot0)
		if not slot0:getShipById(slot0[1]) then
			if slot1 == nil then
				return
			end

			slot2.removeShipFromFleet(slot3, slot1)

			return
		end

		slot3 = slot4:getShipPos(slot1)

		if slot4:getFleetByShip(slot1) == nil or slot2.id == FleetProxy.PVP_FLEET_ID then
			if slot1 == nil then
				slot3:insertShip(slot1, nil, slot3)
			else
				slot3:removeShip(slot1)
				slot3:insertShip(slot1, slot3, slot3)
			end

			slot4.EdittingFleet = slot3

			return
		end

		slot4 = slot2:getShipPos(slot1)

		if slot2.id == slot3.id then
			if slot1 == nil then
				slot3:removeShip(slot1)
				slot3:insertShip(slot1, nil, slot3.insertShip)

				slot4.EdittingFleet = slot3

				return
			end

			if slot1.id == slot1.id then
				return
			end

			slot3:removeShip(slot1)
			slot3:removeShip(slot1)

			if slot4 < slot3 then
				slot3:insertShip(slot1, slot4, slot3.insertShip)
				slot3:insertShip(slot1, slot3, slot3.insertShip)
			else
				slot3:insertShip(slot1, slot3, slot3.insertShip)
				slot3:insertShip(slot1, slot4, slot3.insertShip)
			end

			slot4.EdittingFleet = slot3

			return
		end

		if not slot2:canRemove(slot1) and slot1 == nil then
			slot5, slot6 = slot2:getShipPos(slot1)

			pg.TipsMgr:GetInstance():ShowTips(i18n("ship_formationMediator_replaceError_onlyShip", slot2.defaultName, Fleet.C_TEAM_NAME[slot6]))
		else
			slot2:removeShip(slot1)

			if slot1 then
				slot2:insertShip(slot1, slot4, slot2.insertShip)
				slot2:sendNotification(GAME.UPDATE_FLEET, {
					fleet = slot2
				})
				slot3:removeShip(slot1)
				slot3:insertShip(slot1, slot3, slot3.insertShip)

				slot4.EdittingFleet = slot3

				slot2.saveEdit()
				slot3:sendNotification(GAME.UPDATE_FLEET, {
					fleet = slot3
				})
			else
				slot6:sendNotification(GAME.UPDATE_FLEET, {
					fleet = slot2
				})
				slot3:insertShip(slot1, nil, slot3.insertShip)

				slot4.EdittingFleet = slot3

				slot2.saveEdit()
				slot3:sendNotification(GAME.UPDATE_FLEET, {
					fleet = slot3
				})
			end
		end
	end
end

function slot0.getDockCallbackFuncsForExercise(slot0, slot1, slot2, slot3)
	slot4 = getProxy(FleetProxy)
	slot5 = getProxy(BayProxy)

	return function (slot0, slot1)
		for slot6, slot7 in pairs(slot2) do
			if slot0.id == slot7 then
				return false, i18n("ship_vo_event")
			end
		end

		slot3, slot4 = slot0.checkChangeShip(slot1, slot2, slot0)

		if not slot3 then
			return false, slot4
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		if not slot0:getShipById(slot0[1]) then
			if slot1 == nil then
				return
			end

			slot2.removeShipFromFleet(slot3, slot1)

			return
		end

		slot3 = slot4:getShipPos(slot1)

		if slot4:inPvpFleet(slot1) then
			slot4 = slot3:getShipPos(slot1)

			if slot1 == nil then
				slot3:removeShip(slot1)
				slot3:insertShip(slot1, nil, slot3.insertShip)

				slot4.EdittingFleet = slot3

				return
			end

			if slot1.id == slot1.id then
				return
			end

			slot3:removeShip(slot1)
			slot3:removeShip(slot1)

			if slot4 < slot3 then
				slot3:insertShip(slot1, slot4, slot3.insertShip)
				slot3:insertShip(slot1, slot3, slot3.insertShip)
			else
				slot3:insertShip(slot1, slot3, slot3.insertShip)
				slot3:insertShip(slot1, slot4, slot3.insertShip)
			end

			slot4.EdittingFleet = slot3
		else
			if slot1 == nil then
				slot3:insertShip(slot1, nil, slot3)
			else
				slot3:removeShip(slot1)
				slot3:insertShip(slot1, slot3, slot3)
			end

			slot4.EdittingFleet = slot3

			return
		end
	end
end

return slot0
