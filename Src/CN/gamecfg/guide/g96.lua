return {
	id = 96,
	nextId = 27,
	events = {
		MainUI = {
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			openUI = true,
			redundancys = {
				"MainUI"
			},
			action = {
				say = {
					text = "啊~作战失败！点击确定退出当前关卡",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.6,
						posY = 217,
						posX = -323
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
				}
			}
		},
		13104 = {
			finish = true,
			condition = {
				{
					"result",
					"=",
					0,
					2
				}
			},
			action = {
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2"
				}
			}
		}
	}
}
