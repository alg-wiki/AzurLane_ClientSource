slot0 = class("NavalTacticsMediator", import("..base.ContextMediator"))
slot0.OPEN_DOCKYARD = "NavalTacticsMediator:OPEN_DOCKYARD"
slot0.ON_START = "NavalTacticsMediator:ON_START"
slot0.ON_CANCEL = "NavalTacticsMediator:ON_CANCEL"
slot0.ON_SHOPPING = "NavalTacticsMediator:ON_SHOPPING"
slot1 = 10

function slot0.register(slot0)
	slot0.viewComponent:setShips(slot2)

	slot0.bagProxy = getProxy(BagProxy)

	slot0.viewComponent:setItemVOs(slot3)

	slot4 = {}
	slot4 = getProxy(NavalAcademyProxy):getStudents()

	if slot0.contextData.students then
		for slot9, slot10 in pairs(slot0.contextData.students) do
			slot4[slot10.id] = slot10
		end

		slot0.contextData.students = nil
	end

	slot0.viewComponent:setStudents(slot4)
	slot0:bind(slot1.OPEN_DOCKYARD, function (slot0, slot1, slot2, slot3)
		slot0.contextData.students = slot2
		slot4 = {}

		for slot8, slot9 in pairs(slot1:getStudents()) do
			table.insert(slot4, slot9.shipId)
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMax = 1,
			ignoredIds = slot4,
			activeShipId = activeShipId,
			prevPage = slot0.__cname,
			flags = {
				inExercise = true,
				inChapter = false,
				inPvp = false,
				inFleet = false,
				inClass = false,
				inTactics = false,
				inBackyard = false,
				inSham = false,
				inEvent = false,
				inAdmiral = true
			},
			onShip = function (slot0, slot1, slot2)
				slot3, slot4 = Ship.ShipStateConflict("inTactics", slot0)

				if slot3 == Ship.STATE_CHANGE_FAIL then
					return false, i18n(slot4)
				elseif slot3 == Ship.STATE_CHANGE_CHECK then
					return Ship.ChangeStateCheckBox(slot4, slot0, slot1)
				end

				return true
			end,
			onSelected = function (slot0)
				if slot0 and slot0[1] then
					for slot4, slot5 in pairs(pairs) do
						if slot0 == slot5 then
							slot2.contextData.students[slot4] = nil
						end
					end
				end

				slot2.contextData.shipToLesson = {
					shipId = slot0[1],
					index = slot0[1]
				}
			end
		})
	end)
	slot0:bind(slot1.ON_START, function (slot0, slot1)
		slot0:sendNotification(GAME.START_TO_LEARN_TACTICS, slot1)
	end)
	slot0:bind(slot1.ON_CANCEL, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.CANCEL_LEARN_TACTICS, {
			shipId = slot1,
			type = slot2
		})
	end)
	slot0:bind(slot1.ON_SHOPPING, function (slot0, slot1)
		slot0:sendNotification(GAME.SHOPPING, {
			count = 1,
			id = slot1
		})
	end)

	if slot0.contextData.shipToLesson then
		slot0.viewComponent:addStudent(slot0.contextData.shipToLesson.shipId, slot0.contextData.shipToLesson.index, slot0.contextData.shipToLesson.skillIndex)

		slot0.contextData.shipToLesson = nil
	end

	slot0.viewComponent:setSKillClassNum(slot6)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
end

function slot0.listNotificationInterests(slot0)
	return {
		NavalAcademyProxy.START_LEARN_TACTICS,
		GAME.CANCEL_LEARN_TACTICS_DONE,
		BagProxy.ITEM_UPDATED,
		NavalAcademyProxy.SKILL_CLASS_POS_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == NavalAcademyProxy.START_LEARN_TACTICS then
		slot0.viewComponent:updateStudentVO(slot3)
	elseif slot2 == GAME.CANCEL_LEARN_TACTICS_DONE then
		slot0.viewComponent:updateShipVO(slot3.newShipVO)
		slot0.viewComponent:addDeleteStudentQueue(slot3.id, slot3.totalExp, slot3.oldSkill, slot3.newSkill)
	elseif slot2 == BagProxy.ITEM_UPDATED then
		slot0.viewComponent:setItemVOs(slot0.bagProxy:getItemsByType(slot0))
	elseif slot2 == NavalAcademyProxy.SKILL_CLASS_POS_UPDATED then
		slot0.viewComponent:setSKillClassNum(slot3)
		slot0.viewComponent:updateLockStudentPos(slot3, true)
	end
end

return slot0
