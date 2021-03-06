slot0 = class("PlayerProxy", import(".NetProxy"))
slot0.UPDATED = "player updated"

function slot0.register(slot0)
	slot0._flags = {}
	slot0._fishCfg = {}
	slot0.combatFleetId = 1
	slot0.mainBGShiftFlag = false
	slot0.inited = false
	slot0.botHelp = false
	slot0.playerAssists = {}
	slot0.playerGuildAssists = {}
	slot0.summaryInfo = nil

	slot0:on(11000, function (slot0)
		slot0:sendNotification(GAME.TIME_SYNCHRONIZATION, slot0)
	end)
	slot0:on(11003, function (slot0)
		Player.New(slot0).resUpdateTm = pg.TimeMgr.GetInstance():GetServerTime()

		slot0:updatePlayer(slot1)
		print("days from regist time to new :" .. slot0.data:GetDaysFromRegister())

		if slot0.data:GetDaysFromRegister() == 1 then
			SendAiriJPTracking(AIRIJP_TRACKING_2D_RETENTION, slot1.id)
		elseif slot0.data:GetDaysFromRegister() == 6 then
			SendAiriJPTracking(AIRIJP_TRACKING_7D_RETENTION, slot1.id)
		end

		slot0:flushTimesListener()
	end)
	slot0:on(11004, function (slot0)
		if not slot0.data then
			return
		end

		slot1 = slot0.data:clone()

		slot1:updateResources(slot0.resource_list)

		slot1.resUpdateTm = pg.TimeMgr.GetInstance():GetServerTime()

		slot0:updatePlayer(slot1)

		if slot0.data:isFull() then
		end
	end)
	slot0:on(10999, function (slot0)
		slot0:sendNotification(GAME.LOGOUT, {
			code = slot0.reason
		})
	end)
	slot0:on(11015, function (slot0)
		slot0.data:clone().buff_list = {}

		for slot5, slot6 in ipairs(slot0.buff_list) do
			table.insert(slot1.buff_list, {
				id = slot6.id,
				timestamp = slot6.timestamp
			})
		end

		slot0:updatePlayer(slot1)
	end)
	slot0:on(11503, function (slot0)
		getProxy(ShopsProxy).removeChargeTimer(slot1, slot0.pay_id)
		slot0:sendNotification(GAME.CHARGE_SUCCESS, {
			shopId = slot0.shop_id,
			payId = slot0.pay_id,
			gem = slot0.gem,
			gem_free = slot0.gem_free
		})
	end)
end

function slot0.getSummaryInfo(slot0)
	return slot0.summaryInfo
end

function slot0.setSummaryInfo(slot0, slot1)
	slot0.summaryInfo = slot1
end

function slot0.flushTimesListener(slot0)
	if slot0.clockId then
		slot0:remove()
	end

	slot1 = pg.TimeMgr.GetInstance()
	slot0.clockId = slot1:AddTimer("daily", slot1:GetNextTime(0, 0, 0) - slot1:GetServerTime(), 86400, function ()
		slot0:sendNotification(GAME.ZERO_HOUR)
	end)
end

function slot0.remove(slot0)
	if slot0.clockId then
		pg.TimeMgr.GetInstance():RemoveTimer(slot0.clockId)

		slot0.clockId = nil
	end
end

function slot0.updatePlayer(slot0, slot1)
	slot0.data = slot1:clone()

	slot0.data:display("updated")
	slot0:sendNotification(slot0.UPDATED, slot1:clone())
end

function slot0.SetFishRes(slot0, slot1)
	slot0._fishCfg = slot1
end

function slot0.GetFishRes(slot0)
	return slot0._fishCfg
end

function slot0.getPlayerId(slot0)
	return slot0.data.id
end

function slot0.setFlag(slot0, slot1, slot2)
	slot0._flags[slot1] = slot2
end

function slot0.getFlag(slot0, slot1)
	return slot0._flags[slot1]
end

function slot0.isSelf(slot0, slot1)
	return slot0.data.id == slot1
end

function slot0.setInited(slot0, slot1)
	slot0.inited = slot1
end

function slot0.getInited(slot0)
	return slot0.inited
end

return slot0
