slot0 = class("DailyLevelProxy", import(".NetProxy"))
slot0.ELITE_QUOTA_UPDATE = "DailyLevelProxy:ELITE_QUOTA_UPDATE"

function slot0.register(slot0)
	slot0.data = {}
	slot0.eliteCount = 0

	slot0:on(13201, function (slot0)
		slot0.data = {}

		for slot4, slot5 in ipairs(slot0.count_list) do
			slot0.data[slot5.id] = slot5.count
		end

		slot0.eliteCount = slot0.elite_expedition_count
		getProxy(ChapterProxy).escortChallengeTimes = slot0.escort_expedition_count
	end)
end

function slot0.resetDailyCount(slot0)
	for slot4, slot5 in pairs(slot0.data) do
		slot0.data[slot4] = 0
	end

	slot0.eliteCount = 0

	slot0:sendNotification(slot0.ELITE_QUOTA_UPDATE)
end

function slot0.IsEliteEnabled(slot0)
	return slot0.eliteCount < pg.gameset.elite_quota.key_value
end

function slot0.EliteCountPlus(slot0)
	slot0.eliteCount = math.min(slot0.eliteCount + 1, pg.gameset.elite_quota.key_value)

	slot0:sendNotification(slot0.ELITE_QUOTA_UPDATE)
end

return slot0
