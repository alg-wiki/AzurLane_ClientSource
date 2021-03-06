slot0 = class("SubAIAction", import(".BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.line = {
		row = slot1.ai_pos.row,
		column = slot1.ai_pos.column
	}

	if slot1.target_pos and slot1.target_pos.row < 9999 and slot1.target_pos.column < 9999 then
		slot0.target = {
			row = slot1.target_pos.row,
			column = slot1.target_pos.column
		}
	end

	slot0.movePath = _.map(slot1.move_path, function (slot0)
		return {
			row = slot0.row,
			column = slot0.column
		}
	end)
	slot0.cellUpdates = {}

	_.each(slot1.map_update, function (slot0)
		if slot0.item_type ~= ChapterConst.AttachNone and slot0.item_type ~= ChapterConst.AttachBorn and slot0.item_type ~= ChapterConst.AttachBorn_Sub and (slot0.item_type ~= ChapterConst.AttachStory or slot0.item_data ~= ChapterConst.StoryTrigger) then
			table.insert(slot0.cellUpdates, (slot0.item_type == ChapterConst.AttachChampion and ChapterChampion.New(slot0)) or ChapterCell.New(slot0))
		end
	end)
end

function slot0.applyTo(slot0, slot1, slot2)
	if slot1:getFleet(FleetType.Submarine, slot0.line.row, slot0.line.column) then
		return slot0:applyToFleet(slot1, slot3, slot2)
	end

	return false, "can not find any submarine at: [" .. slot0.line.row .. ", " .. slot0.line.column .. "]"
end

function slot0.applyToFleet(slot0, slot1, slot2, slot3)
	slot4 = 0

	if not slot2:isValid() then
		return false, "fleet " .. slot2.id .. " is invalid."
	end

	slot5 = 0

	if slot0.target then
		if slot2.restAmmo <= 0 then
			return false, "lack ammo of fleet."
		end

		if not _.detect(slot0.cellUpdates, function (slot0)
			return slot0.row == slot0.target.row and slot0.column == slot0.target.column
		end) then
			return false, "can not find cell update at: [" .. slot0.target.row .. ", " .. slot0.target.column .. "]"
		end

		if not slot3 then
			if isa(slot6, ChapterChampion) then
				slot1:mergeChampion(slot6)

				slot5 = bit.bor(slot5, ChapterConst.DirtyChampion)
			else
				slot1:mergeChapterCell(slot6)

				slot5 = bit.bor(slot5, ChapterConst.DirtyAttachment)
			end

			slot2.restAmmo = slot2.restAmmo - 1
			slot5 = bit.bor(slot5, ChapterConst.DirtyFleet)
		end
	elseif #slot0.movePath > 0 then
		if _.any(slot0.movePath, function (slot0)
			return not slot0:getChapterCell(slot0.row, slot0.column) or not slot1.walkable
		end) then
			return false, "invalide move path"
		end

		if not slot3 then
			slot2.line = {
				row = slot0.movePath[#slot0.movePath].row,
				column = slot0.movePath[#slot0.movePath].column
			}
			slot5 = bit.bor(slot5, ChapterConst.DirtyFleet)
		end
	end

	return true, slot5
end

return slot0
