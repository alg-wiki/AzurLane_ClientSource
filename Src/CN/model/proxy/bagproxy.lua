slot0 = class("BagProxy", import(".NetProxy"))
slot0.ITEM_ADDED = "item added"
slot0.ITEM_UPDATED = "item updated"

function slot0.register(slot0)
	slot0:on(15001, function (slot0)
		slot0.data = {}

		for slot4, slot5 in ipairs(slot0.item_list) do
			slot6 = Item.New(slot5)

			slot6:display("loaded")

			slot0.data[slot6.id] = slot6
		end
	end)
end

function slot0.addItem(slot0, slot1)
	slot0.data[slot1.id] = slot1:clone()

	slot0.data[slot1.id]:display("added")
	slot0.facade:sendNotification(slot0.ITEM_ADDED, slot1:clone())
end

function slot0.addItemById(slot0, slot1, slot2)
	if slot0.data[slot1] == nil then
		slot0:addItem(Item.New({
			id = slot1,
			count = slot2
		}))
	else
		slot3.count = slot3.count + slot2

		slot0:updateItem(slot3)
	end
end

function slot0.getItems(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		table.insert(slot1, slot6)
	end

	return Clone(slot1)
end

function slot0.getItemsByExclude(slot0)
	slot1 = Item.INVISIBLE_TYPE
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if not table.contains(slot1, slot7:getConfig("type")) and slot7.count ~= 0 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getItemsByType(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if slot7:getConfig("type") == slot1 and slot7.count ~= 0 then
			table.insert(slot2, slot7)
		end
	end

	return Clone(slot2)
end

function slot0.getItemById(slot0, slot1)
	if slot0.data[slot1] ~= nil then
		return slot0.data[slot1]:clone()
	end

	return nil
end

function slot0.getItemCountById(slot0, slot1)
	return (slot0:getItemById(slot1) and slot2.count) or 0
end

function slot0.getBoxCount(slot0)
	return table.getCount(slot0:getItemsByType(5))
end

function slot0.getCanComposeCount(slot0)
	slot1 = 0

	for slot6, slot7 in pairs(pg.compose_data_template.all) do
		slot9 = slot2[slot7].material_num

		if slot0:getItemById(slot2[slot7].material_id) and slot9 <= slot10.count then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function slot0.updateItem(slot0, slot1)
	slot0.data[slot1.id] = slot1:clone()

	slot0.data[slot1.id]:display("updated")
	slot0.facade:sendNotification(slot0.ITEM_UPDATED, slot1:clone())
end

function slot0.canUpgradeFlagShipEquip(slot0)
	if getProxy(BayProxy):getEquipment2ByflagShip() then
		for slot7, slot8 in pairs(pg.equip_data_template[slot2.id].trans_use_item) do
			if not slot0:getItemById(slot8[1]) or slot9.count < slot8[2] then
				return false
			end
		end

		return true
	end
end

function slot0.removeItemById(slot0, slot1, slot2)
	slot0.data[slot1].consume(slot3, slot2)
	slot0:updateItem(slot0.data[slot1])
end

return slot0
