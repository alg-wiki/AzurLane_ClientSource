slot0 = class("ItemRarity")
slot0.Gray = 1
slot0.Blue = 2
slot0.Purple = 3
slot0.Gold = 4
slot0.SSR = 5

function slot0.Rarity2Print(slot0)
	if not slot0.prints then
		slot0.prints = {
			"1",
			"2",
			"3",
			"4",
			"5",
			nil,
			nil,
			"8",
			"9"
		}
	end

	return slot0.prints[slot0]
end

return slot0
