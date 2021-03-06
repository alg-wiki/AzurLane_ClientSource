pg = pg or {}
pg.expedition_daily_template = {
	[201] = {
		tips = "매주 월·목·일요일 개방!",
		pic = "daily1",
		limit_time = 3,
		id = 201,
		title = "상선호위",
		des = "아군 상선을 노리는 적 어뢰정을 처리하고, 보상으로 강화 재료를 손에 넣어라!",
		weekday = {
			1,
			4,
			7
		},
		expedition_and_lv_limit_list = {
			{
				2000,
				10
			},
			{
				2001,
				10
			},
			{
				2002,
				25
			},
			{
				2003,
				25
			},
			{
				2004,
				35
			},
			{
				2005,
				35
			},
			{
				2006,
				50
			},
			{
				2007,
				50
			},
			{
				2008,
				70
			},
			{
				2009,
				70
			}
		}
	},
	[301] = {
		tips = "매주 화·금·일요일 개방!",
		pic = "daily2",
		limit_time = 3,
		id = 301,
		title = "해역소탕",
		des = "해역에서 난동을 부리는 자폭선을 처리하고, 스킬 훈련용 교본을 찾아내라!",
		weekday = {
			2,
			5,
			7
		},
		expedition_and_lv_limit_list = {
			{
				3000,
				10
			},
			{
				3001,
				25
			},
			{
				3002,
				35
			},
			{
				3003,
				50
			},
			{
				3004,
				70
			}
		}
	},
	[401] = {
		tips = "매주 수·토·일요일 개방!",
		pic = "daily3",
		limit_time = 3,
		id = 401,
		title = "강습작전",
		des = "대량으로 출현한 적 주력함을 격파하고, 장비상자를 손에 넣어라!",
		weekday = {
			3,
			6,
			7
		},
		expedition_and_lv_limit_list = {
			{
				4000,
				10
			},
			{
				4001,
				25
			},
			{
				4002,
				35
			},
			{
				4003,
				50
			},
			{
				4004,
				70
			}
		}
	},
	[501] = {
		tips = "아직 개방되지 않았습니다. 기대해주세요!",
		pic = "daily4",
		limit_time = 0,
		id = 501,
		title = "기대해주세요",
		des = "아직 개방되지 않았습니다. 기대해주세요!",
		weekday = {},
		expedition_and_lv_limit_list = {}
	},
	[601] = {
		tips = "전술 리서치는 매일 개방됩니다.",
		pic = "daily6",
		limit_time = 3,
		id = 601,
		title = "전술 리서치",
		des = "강력한 적 특수함대가 출현했다! 격파 시 일정 확률로 전술 업그레이드 재료를 얻을 수 있다.",
		weekday = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		},
		expedition_and_lv_limit_list = {
			{
				6000,
				60
			},
			{
				6001,
				60
			},
			{
				6002,
				60
			}
		}
	},
	all = {
		201,
		301,
		401,
		501,
		601
	}
}

return
