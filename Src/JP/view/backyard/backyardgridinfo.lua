pg = pg or {}
slot1 = Vector2(39.2, 19.2)
slot2 = Vector2(0, -563.4)
slot3 = class("BackYardGridInfo")
pg.BackYardGridInfo = slot3

function slot3.Ctor(slot0, slot1)
	slot0.start_x = slot1.startX
	slot0.start_y = slot1.startY
	slot0.end_x = slot1.endX
	slot0.end_y = slot1.endY
	slot0.map = slot1.map
end

function slot3.createMapGrids(slot0)
	slot1 = GameObject.Find("UICamera/Canvas/UIMain/BackYardUI(Clone)/main")
	slot0.mapGrids = {}

	for slot5 = slot0.start_x, slot0.end_x, 1 do
		slot6 = {}

		for slot10 = slot0.start_y, slot0.end_y, 1 do
			cloneTplTo(findTF(slot1, "resources/gridtpl"), findTF(slot1, "bg/floorGrid"), slot5 .. "_" .. slot10).anchoredPosition = Vector2(slot0.x + (slot5 - 1) * slot1.x + (slot10 - 1) * -slot1.x, slot0.y + (slot5 - 1) * slot1.y + (slot10 - 1) * slot1.y)
			slot6[slot10] = cloneTplTo(findTF(slot1, "resources/gridtpl"), findTF(slot1, "bg/floorGrid"), slot5 .. "_" .. slot10)
		end

		slot0.mapGrids[slot5] = slot6
	end
end

function slot3.getMapGrid(slot0, slot1, slot2)
	return slot0.mapGrids[slot1][slot2]
end

function slot3.hasGrid(slot0, slot1, slot2)
	if slot0.mapGrids[slot1] and slot3[slot2] then
		return true
	end

	return false
end

function slot3.setAllGridText(slot0)
	for slot4 = 1, 24, 1 do
		for slot8 = 1, 24, 1 do
			slot9 = slot0.map.depths[slot0.map:GetIndex(slot4, slot8)]

			if slot0:hasGrid(slot4 - 1, slot8 - 1) then
				setText(slot0:getMapGrid(slot4 - 1, slot8 - 1).Find(slot10, "Text"), slot9)
			end
		end
	end
end

return slot3
