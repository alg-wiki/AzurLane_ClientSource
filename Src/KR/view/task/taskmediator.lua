slot0 = class("TaskMediator", import("..base.ContextMediator"))
slot0.ON_TASK_SUBMIT = "TaskMediator:ON_TASK_SUBMIT"
slot0.ON_TASK_GO = "TaskMediator:ON_TASK_GO"
slot0.TASK_FILTER = "TaskMediator:TASK_FILTER"

function slot0.register(slot0)
	slot0:bind(slot0.ON_TASK_SUBMIT, function (slot0, slot1)
		if getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID) and slot1.id == _.flatten(slot4)[#_.flatten(slot4)] then
			pg.StoryMgr.GetInstance():Play("YIXIAN8", function ()
				slot0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
			end)

			return
		end

		slot0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
	end)
	slot0:bind(slot0.ON_TASK_GO, function (slot0, slot1)
		slot0:sendNotification(GAME.TASK_GO, {
			taskVO = slot1
		})
	end)

	slot3 = getProxy(BagProxy)

	for slot7, slot8 in pairs(slot2) do
		if slot8:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot8.progress = slot3:getItemCountById(tonumber(slot8:getConfig("target_id_for_client")))
		elseif slot8:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot8.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot8:getConfig("target_id_for_client"))
		end
	end

	slot0.viewComponent:setTaskVOs(slot2)
end

function slot0.enterLevel(slot0, slot1)
	if getProxy(ChapterProxy):getChapterById(slot1) then
		slot4 = {
			mapIdx = slot3:getConfig("map")
		}

		if slot3.active then
			slot4.chapterId = slot3.id
		else
			slot4.openChapterId = slot1
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot4)
	end
end

function slot0.remove(slot0)
	slot0.viewComponent:unPartialBlur()
end

function slot0.listNotificationInterests(slot0)
	return {
		TaskProxy.TASK_ADDED,
		TaskProxy.TASK_UPDATED,
		TaskProxy.TASK_REMOVED,
		GAME.SUBMIT_TASK_DONE,
		slot0.TASK_FILTER,
		GAME.BEGIN_STAGE_DONE,
		GAME.CHAPTER_OP_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == TaskProxy.TASK_ADDED then
		if slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot3.progress = getProxy(BagProxy):getItemCountById(tonumber(slot3:getConfig("target_id_for_client")))
		elseif slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot3.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot3:getConfig("target_id_for_client"))
		end

		slot0.viewComponent:addTask(slot3)
	elseif slot2 == GAME.CHAPTER_OP_DONE then
		if slot0.chapterId then
			slot0:enterLevel(slot0.chapterId)

			slot0.chapterId = nil
		end
	elseif slot2 == TaskProxy.TASK_UPDATED then
		if slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot3.progress = getProxy(BagProxy):getItemCountById(tonumber(slot3:getConfig("target_id_for_client")))
		elseif slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot3.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot3:getConfig("target_id_for_client"))
		end

		slot0.viewComponent:updateTask(slot3)
	elseif slot2 == TaskProxy.TASK_REMOVED then
		slot0.viewComponent:removeTask(slot3)
	elseif slot2 == slot0.TASK_FILTER then
		slot0.viewComponent:GoToFilter(slot3)
	else
		if slot2 == GAME.SUBMIT_TASK_DONE then
			getProxy(TaskProxy).setOnAchieved(slot4, true)

			slot0.viewComponent.onShowAwards = true

			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
				slot0:setOnAchieved(false)
				slot0.setOnAchieved:addTmpToTask()

				slot1.viewComponent.onShowAwards = nil

				nil:accepetActivityTask()
			end)

			return
		end

		if slot2 == GAME.BEGIN_STAGE_DONE then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
		end
	end
end

function slot0.accepetActivityTask(slot0)
	slot0:sendNotification(GAME.ACCEPT_ACTIVITY_TASK)
end

return slot0
