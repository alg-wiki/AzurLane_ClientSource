return {
	uiEffect = "",
	name = "巡洋-战术-炮击I",
	cd = 0,
	picture = "0",
	aniEffect = "",
	desc = "巡洋-战术-炮击I",
	painting = 1,
	id = 422110,
	effect_list = {
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = {
				"TargetAllHelp",
				"TargetShipType"
			},
			arg_list = {
				buff_id = 422111,
				ship_type_list = {
					2,
					3,
					9,
					11
				}
			}
		}
	}
}
