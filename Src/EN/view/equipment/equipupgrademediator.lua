slot0 = class("EquipUpgradeMediator", import("..base.ContextMediator"))
slot0.EQUIPMENT_UPGRDE = "EquipUpgradeMediator:EQUIPMENT_UPGRDE"
slot0.REPLACE_EQUIP = "EquipUpgradeMediator:REPLACE_EQUIP"

function slot0.register(slot0)
	slot0.bagProxy = getProxy(BagProxy)

	slot0.viewComponent:setItems(slot1)
	slot0.viewComponent:updateRes(getProxy(PlayerProxy).getData(slot2))
	slot0:bind(slot0.EQUIPMENT_UPGRDE, function (slot0)
		slot0:sendNotification(GAME.UPGRADE_EQUIPMENTS, {
			shipId = slot0.contextData.shipId,
			pos = slot0.contextData.pos,
			equipmentId = slot0.contextData.equipmentId
		})
	end)

	if slot0.contextData.shipId ~= nil then
		slot5 = getProxy(BayProxy).getShipById(slot4, slot3)
		slot0.contextData.shipVO = slot5
		slot0.contextData.equipmentVO = slot5:getEquip(slot0.contextData.pos)
	elseif slot0.contextData.equipmentId ~= nil then
		slot0.contextData.equipmentVO = getProxy(EquipmentProxy):getEquipmentById(slot4)
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.UPGRADE_EQUIPMENTS_DONE,
		BagProxy.ITEM_UPDATED,
		PlayerProxy.UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.UPGRADE_EQUIPMENTS_DONE then
		slot0.contextData.shipVO = slot3.ship
		slot0.contextData.equipmentVO = slot3.newEquip

		slot0.viewComponent:updateAll()
		slot0.viewComponent:upgradeFinish(slot3.equip, slot3.newEquip)
	elseif slot2 == BagProxy.ITEM_UPDATED then
		slot0.viewComponent:setItems(slot0.bagProxy:getData())
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:updateRes(getProxy(PlayerProxy):getData())
	end
end

return slot0
