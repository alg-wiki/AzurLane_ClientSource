return {
	time = 0,
	name = "2019年2月世界BOSS四阶段易伤",
	init_effect = "",
	id = 8606,
	picture = "",
	desc = "航空易伤",
	stack = 1,
	color = "yellow",
	icon = 2120,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = 0.3,
				attr = "damageGetRatioByAir"
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = -0.3,
				attr = "damageGetRatioByCannon"
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = -0.3,
				attr = "damageGetRatioByBulletTorpedo"
			}
		}
	}
}
