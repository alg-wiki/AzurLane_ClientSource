slot0 = class("Arenarank", import(".BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.level = slot1.level
	slot0.icon = slot1.icon
	slot0.name = slot1.name
	slot0.score = slot1.score or 0
	slot0.score = slot0.score + SeasonInfo.INIT_POINT
	slot0.rank = slot1.rank or 0
	slot0.skinId = slot1.skin_id or 0
	slot0.remoulded = false

	if slot1.remoulded and slot1.remoulded == 1 then
		slot0.remoulded = true
	end

	if slot0.skinId == 0 and pg.ship_data_statistics[slot0.icon] then
		slot0.skinId = slot2.skin_id
	end

	slot0.propose = slot1.propose and slot1.propose > 0
	slot0.proposeTime = slot1.propose
end

function slot0.getPainting(slot0)
	slot2 = nil

	if pg.ship_skin_template[slot0.skinId] then
		return ((HXSet.isHx() or slot1.painting) and ((slot1.painting_hx ~= "" and slot1.painting_hx) or slot1.painting)) or "unknown"
	end
end

function slot0.setRank(slot0, slot1)
	slot0.rank = slot1
end

return slot0
