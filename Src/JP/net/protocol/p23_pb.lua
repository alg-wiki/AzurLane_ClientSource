slot0 = require("protobuf")
slot1 = require("common_pb")

module("p23_pb")

SC_23001 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
slot5 = slot0.FieldDescriptor()
slot6 = slot0.FieldDescriptor()
slot7 = slot0.FieldDescriptor()
CS_23002 = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
slot10 = slot0.FieldDescriptor()
slot11 = slot0.FieldDescriptor()
slot12 = slot0.FieldDescriptor()
SC_23003 = slot0.Descriptor()
slot13 = slot0.FieldDescriptor()
slot14 = slot0.FieldDescriptor()
CS_23004 = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
slot16 = slot0.FieldDescriptor()
slot17 = slot0.FieldDescriptor()
slot18 = slot0.FieldDescriptor()
SC_23005 = slot0.Descriptor()
slot19 = slot0.FieldDescriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
slot23 = slot0.FieldDescriptor()
CS_23006 = slot0.Descriptor()
slot24 = slot0.FieldDescriptor()
SC_23007 = slot0.Descriptor()
slot25 = slot0.FieldDescriptor()
SC_23009 = slot0.Descriptor()
slot26 = slot0.FieldDescriptor()
CS_23010 = slot0.Descriptor()
slot27 = slot0.FieldDescriptor()
slot28 = slot0.FieldDescriptor()
SC_23011 = slot0.Descriptor()
slot29 = slot0.FieldDescriptor()
SHAMSHOP = slot0.Descriptor()
slot30 = slot0.FieldDescriptor()
slot31 = slot0.FieldDescriptor()
CURRENTSHAMINFO = slot0.Descriptor()
slot32 = slot0.FieldDescriptor()
slot33 = slot0.FieldDescriptor()
slot34 = slot0.FieldDescriptor()
slot35 = slot0.FieldDescriptor()
slot36 = slot0.FieldDescriptor()
slot37 = slot0.FieldDescriptor()
SHAMCELLINFO = slot0.Descriptor()
slot38 = slot0.FieldDescriptor()
slot39 = slot0.FieldDescriptor()
slot40 = slot0.FieldDescriptor()
slot41 = slot0.FieldDescriptor()
slot42 = slot0.FieldDescriptor()
slot43 = slot0.FieldDescriptor()
SHAMCELLPOS = slot0.Descriptor()
slot44 = slot0.FieldDescriptor()
slot45 = slot0.FieldDescriptor()
GROUPINSHAM = slot0.Descriptor()
slot46 = slot0.FieldDescriptor()
slot47 = slot0.FieldDescriptor()
slot48 = slot0.FieldDescriptor()
slot49 = slot0.FieldDescriptor()
SHIPINSHAM = slot0.Descriptor()
slot50 = slot0.FieldDescriptor()
slot51 = slot0.FieldDescriptor()
slot52 = slot0.FieldDescriptor()
slot53 = slot0.FieldDescriptor()
STRATEGYINFO = slot0.Descriptor()
slot54 = slot0.FieldDescriptor()
slot55 = slot0.FieldDescriptor()
HPINFO = slot0.Descriptor()
slot56 = slot0.FieldDescriptor()
slot57 = slot0.FieldDescriptor()
SHAMTARGETINFO = slot0.Descriptor()
slot58 = slot0.FieldDescriptor()
slot59 = slot0.FieldDescriptor()
slot60 = slot0.FieldDescriptor()
slot61 = slot0.FieldDescriptor()
slot62 = slot0.FieldDescriptor()
slot63 = slot0.FieldDescriptor()
slot64 = slot0.FieldDescriptor()
slot65 = slot0.FieldDescriptor()
slot2.name = "sham_count"
slot2.full_name = ".p23.sc_23001.sham_count"
slot2.number = 1
slot2.index = 0
slot2.label = 2
slot2.has_default_value = false
slot2.default_value = 0
slot2.type = 13
slot2.cpp_type = 3
slot3.name = "assist_ship"
slot3.full_name = ".p23.sc_23001.assist_ship"
slot3.number = 2
slot3.index = 1
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
slot4.name = "daily_repair_count"
slot4.full_name = ".p23.sc_23001.daily_repair_count"
slot4.number = 3
slot4.index = 2
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
slot5.name = "sim_id"
slot5.full_name = ".p23.sc_23001.sim_id"
slot5.number = 4
slot5.index = 3
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
slot6.name = "shop_list"
slot6.full_name = ".p23.sc_23001.shop_list"
slot6.number = 5
slot6.index = 4
slot6.label = 3
slot6.has_default_value = false
slot6.default_value = {}
slot6.message_type = SHAMSHOP
slot6.type = 11
slot6.cpp_type = 10
slot7.name = "current_sham"
slot7.full_name = ".p23.sc_23001.current_sham"
slot7.number = 6
slot7.index = 5
slot7.label = 1
slot7.has_default_value = false
slot7.default_value = nil
slot7.message_type = CURRENTSHAMINFO
slot7.type = 11
slot7.cpp_type = 10
SC_23001.name = "sc_23001"
SC_23001.full_name = ".p23.sc_23001"
SC_23001.nested_types = {}
SC_23001.enum_types = {}
SC_23001.fields = {
	slot2,
	slot3,
	slot4,
	slot5,
	slot6,
	slot7
}
SC_23001.is_extendable = false
SC_23001.extensions = {}
slot8.name = "id"
slot8.full_name = ".p23.cs_23002.id"
slot8.number = 1
slot8.index = 0
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
slot9.name = "group_id_list"
slot9.full_name = ".p23.cs_23002.group_id_list"
slot9.number = 2
slot9.index = 1
slot9.label = 3
slot9.has_default_value = false
slot9.default_value = {}
slot9.type = 13
slot9.cpp_type = 3
slot10.name = "formation_list"
slot10.full_name = ".p23.cs_23002.formation_list"
slot10.number = 3
slot10.index = 2
slot10.label = 3
slot10.has_default_value = false
slot10.default_value = {}
slot10.type = 13
slot10.cpp_type = 3
slot11.name = "friend_id"
slot11.full_name = ".p23.cs_23002.friend_id"
slot11.number = 4
slot11.index = 3
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
slot12.name = "friend_ship_id"
slot12.full_name = ".p23.cs_23002.friend_ship_id"
slot12.number = 5
slot12.index = 4
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
CS_23002.name = "cs_23002"
CS_23002.full_name = ".p23.cs_23002"
CS_23002.nested_types = {}
CS_23002.enum_types = {}
CS_23002.fields = {
	slot8,
	slot9,
	slot10,
	slot11,
	slot12
}
CS_23002.is_extendable = false
CS_23002.extensions = {}
slot13.name = "result"
slot13.full_name = ".p23.sc_23003.result"
slot13.number = 1
slot13.index = 0
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
slot14.name = "current_sham"
slot14.full_name = ".p23.sc_23003.current_sham"
slot14.number = 2
slot14.index = 1
slot14.label = 1
slot14.has_default_value = false
slot14.default_value = nil
slot14.message_type = CURRENTSHAMINFO
slot14.type = 11
slot14.cpp_type = 10
SC_23003.name = "sc_23003"
SC_23003.full_name = ".p23.sc_23003"
SC_23003.nested_types = {}
SC_23003.enum_types = {}
SC_23003.fields = {
	slot13,
	slot14
}
SC_23003.is_extendable = false
SC_23003.extensions = {}
slot15.name = "act"
slot15.full_name = ".p23.cs_23004.act"
slot15.number = 1
slot15.index = 0
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
slot16.name = "group_id"
slot16.full_name = ".p23.cs_23004.group_id"
slot16.number = 2
slot16.index = 1
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
slot17.name = "act_arg_1"
slot17.full_name = ".p23.cs_23004.act_arg_1"
slot17.number = 3
slot17.index = 2
slot17.label = 1
slot17.has_default_value = false
slot17.default_value = 0
slot17.type = 13
slot17.cpp_type = 3
slot18.name = "act_arg_2"
slot18.full_name = ".p23.cs_23004.act_arg_2"
slot18.number = 4
slot18.index = 3
slot18.label = 1
slot18.has_default_value = false
slot18.default_value = 0
slot18.type = 13
slot18.cpp_type = 3
CS_23004.name = "cs_23004"
CS_23004.full_name = ".p23.cs_23004"
CS_23004.nested_types = {}
CS_23004.enum_types = {}
CS_23004.fields = {
	slot15,
	slot16,
	slot17,
	slot18
}
CS_23004.is_extendable = false
CS_23004.extensions = {}
slot19.name = "result"
slot19.full_name = ".p23.sc_23005.result"
slot19.number = 1
slot19.index = 0
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
slot20.name = "move_path"
slot20.full_name = ".p23.sc_23005.move_path"
slot20.number = 2
slot20.index = 1
slot20.label = 3
slot20.has_default_value = false
slot20.default_value = {}
slot20.message_type = SHAMCELLPOS
slot20.type = 11
slot20.cpp_type = 10
slot21.name = "drop_list"
slot21.full_name = ".p23.sc_23005.drop_list"
slot21.number = 3
slot21.index = 2
slot21.label = 3
slot21.has_default_value = false
slot21.default_value = {}
slot21.message_type = slot1.DROPINFO
slot21.type = 11
slot21.cpp_type = 10
slot22.name = "map_update"
slot22.full_name = ".p23.sc_23005.map_update"
slot22.number = 4
slot22.index = 3
slot22.label = 3
slot22.has_default_value = false
slot22.default_value = {}
slot22.message_type = SHAMCELLINFO
slot22.type = 11
slot22.cpp_type = 10
slot23.name = "ship_update"
slot23.full_name = ".p23.sc_23005.ship_update"
slot23.number = 5
slot23.index = 4
slot23.label = 3
slot23.has_default_value = false
slot23.default_value = {}
slot23.message_type = HPINFO
slot23.type = 11
slot23.cpp_type = 10
SC_23005.name = "sc_23005"
SC_23005.full_name = ".p23.sc_23005"
SC_23005.nested_types = {}
SC_23005.enum_types = {}
SC_23005.fields = {
	slot19,
	slot20,
	slot21,
	slot22,
	slot23
}
SC_23005.is_extendable = false
SC_23005.extensions = {}
slot24.name = "formation_list"
slot24.full_name = ".p23.cs_23006.formation_list"
slot24.number = 1
slot24.index = 0
slot24.label = 3
slot24.has_default_value = false
slot24.default_value = {}
slot24.type = 13
slot24.cpp_type = 3
CS_23006.name = "cs_23006"
CS_23006.full_name = ".p23.cs_23006"
CS_23006.nested_types = {}
CS_23006.enum_types = {}
CS_23006.fields = {
	slot24
}
CS_23006.is_extendable = false
CS_23006.extensions = {}
slot25.name = "result"
slot25.full_name = ".p23.sc_23007.result"
slot25.number = 1
slot25.index = 0
slot25.label = 2
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
SC_23007.name = "sc_23007"
SC_23007.full_name = ".p23.sc_23007"
SC_23007.nested_types = {}
SC_23007.enum_types = {}
SC_23007.fields = {
	slot25
}
SC_23007.is_extendable = false
SC_23007.extensions = {}
slot26.name = "cell_list"
slot26.full_name = ".p23.sc_23009.cell_list"
slot26.number = 1
slot26.index = 0
slot26.label = 3
slot26.has_default_value = false
slot26.default_value = {}
slot26.message_type = SHAMCELLINFO
slot26.type = 11
slot26.cpp_type = 10
SC_23009.name = "sc_23009"
SC_23009.full_name = ".p23.sc_23009"
SC_23009.nested_types = {}
SC_23009.enum_types = {}
SC_23009.fields = {
	slot26
}
SC_23009.is_extendable = false
SC_23009.extensions = {}
slot27.name = "id"
slot27.full_name = ".p23.cs_23010.id"
slot27.number = 1
slot27.index = 0
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
slot28.name = "count"
slot28.full_name = ".p23.cs_23010.count"
slot28.number = 2
slot28.index = 1
slot28.label = 2
slot28.has_default_value = false
slot28.default_value = 0
slot28.type = 13
slot28.cpp_type = 3
CS_23010.name = "cs_23010"
CS_23010.full_name = ".p23.cs_23010"
CS_23010.nested_types = {}
CS_23010.enum_types = {}
CS_23010.fields = {
	slot27,
	slot28
}
CS_23010.is_extendable = false
CS_23010.extensions = {}
slot29.name = "result"
slot29.full_name = ".p23.sc_23011.result"
slot29.number = 1
slot29.index = 0
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
SC_23011.name = "sc_23011"
SC_23011.full_name = ".p23.sc_23011"
SC_23011.nested_types = {}
SC_23011.enum_types = {}
SC_23011.fields = {
	slot29
}
SC_23011.is_extendable = false
SC_23011.extensions = {}
slot30.name = "shop_id"
slot30.full_name = ".p23.shamshop.shop_id"
slot30.number = 1
slot30.index = 0
slot30.label = 2
slot30.has_default_value = false
slot30.default_value = 0
slot30.type = 13
slot30.cpp_type = 3
slot31.name = "count"
slot31.full_name = ".p23.shamshop.count"
slot31.number = 2
slot31.index = 1
slot31.label = 2
slot31.has_default_value = false
slot31.default_value = 0
slot31.type = 13
slot31.cpp_type = 3
SHAMSHOP.name = "shamshop"
SHAMSHOP.full_name = ".p23.shamshop"
SHAMSHOP.nested_types = {}
SHAMSHOP.enum_types = {}
SHAMSHOP.fields = {
	slot30,
	slot31
}
SHAMSHOP.is_extendable = false
SHAMSHOP.extensions = {}
slot32.name = "id"
slot32.full_name = ".p23.currentshaminfo.id"
slot32.number = 1
slot32.index = 0
slot32.label = 2
slot32.has_default_value = false
slot32.default_value = 0
slot32.type = 13
slot32.cpp_type = 3
slot33.name = "progress"
slot33.full_name = ".p23.currentshaminfo.progress"
slot33.number = 2
slot33.index = 1
slot33.label = 2
slot33.has_default_value = false
slot33.default_value = 0
slot33.type = 13
slot33.cpp_type = 3
slot34.name = "cell_list"
slot34.full_name = ".p23.currentshaminfo.cell_list"
slot34.number = 3
slot34.index = 2
slot34.label = 3
slot34.has_default_value = false
slot34.default_value = {}
slot34.message_type = SHAMCELLINFO
slot34.type = 11
slot34.cpp_type = 10
slot35.name = "group_list"
slot35.full_name = ".p23.currentshaminfo.group_list"
slot35.number = 4
slot35.index = 3
slot35.label = 3
slot35.has_default_value = false
slot35.default_value = {}
slot35.message_type = SHIPINSHAM
slot35.type = 11
slot35.cpp_type = 10
slot36.name = "group"
slot36.full_name = ".p23.currentshaminfo.group"
slot36.number = 5
slot36.index = 4
slot36.label = 2
slot36.has_default_value = false
slot36.default_value = nil
slot36.message_type = GROUPINSHAM
slot36.type = 11
slot36.cpp_type = 10
slot37.name = "assist_ship"
slot37.full_name = ".p23.currentshaminfo.assist_ship"
slot37.number = 6
slot37.index = 5
slot37.label = 1
slot37.has_default_value = false
slot37.default_value = nil
slot37.message_type = slot1.SHIPINFO
slot37.type = 11
slot37.cpp_type = 10
CURRENTSHAMINFO.name = "currentshaminfo"
CURRENTSHAMINFO.full_name = ".p23.currentshaminfo"
CURRENTSHAMINFO.nested_types = {}
CURRENTSHAMINFO.enum_types = {}
CURRENTSHAMINFO.fields = {
	slot32,
	slot33,
	slot34,
	slot35,
	slot36,
	slot37
}
CURRENTSHAMINFO.is_extendable = false
CURRENTSHAMINFO.extensions = {}
slot38.name = "pos"
slot38.full_name = ".p23.shamcellinfo.pos"
slot38.number = 1
slot38.index = 0
slot38.label = 2
slot38.has_default_value = false
slot38.default_value = nil
slot38.message_type = SHAMCELLPOS
slot38.type = 11
slot38.cpp_type = 10
slot39.name = "item_type"
slot39.full_name = ".p23.shamcellinfo.item_type"
slot39.number = 2
slot39.index = 1
slot39.label = 2
slot39.has_default_value = false
slot39.default_value = 0
slot39.type = 13
slot39.cpp_type = 3
slot40.name = "item_id"
slot40.full_name = ".p23.shamcellinfo.item_id"
slot40.number = 3
slot40.index = 2
slot40.label = 1
slot40.has_default_value = false
slot40.default_value = 0
slot40.type = 13
slot40.cpp_type = 3
slot41.name = "item_info"
slot41.full_name = ".p23.shamcellinfo.item_info"
slot41.number = 4
slot41.index = 3
slot41.label = 1
slot41.has_default_value = false
slot41.default_value = nil
slot41.message_type = SHAMTARGETINFO
slot41.type = 11
slot41.cpp_type = 10
slot42.name = "item_state"
slot42.full_name = ".p23.shamcellinfo.item_state"
slot42.number = 5
slot42.index = 4
slot42.label = 3
slot42.has_default_value = false
slot42.default_value = {}
slot42.message_type = HPINFO
slot42.type = 11
slot42.cpp_type = 10
slot43.name = "item_flag"
slot43.full_name = ".p23.shamcellinfo.item_flag"
slot43.number = 6
slot43.index = 5
slot43.label = 1
slot43.has_default_value = false
slot43.default_value = 0
slot43.type = 13
slot43.cpp_type = 3
SHAMCELLINFO.name = "shamcellinfo"
SHAMCELLINFO.full_name = ".p23.shamcellinfo"
SHAMCELLINFO.nested_types = {}
SHAMCELLINFO.enum_types = {}
SHAMCELLINFO.fields = {
	slot38,
	slot39,
	slot40,
	slot41,
	slot42,
	slot43
}
SHAMCELLINFO.is_extendable = false
SHAMCELLINFO.extensions = {}
slot44.name = "row"
slot44.full_name = ".p23.shamcellpos.row"
slot44.number = 1
slot44.index = 0
slot44.label = 2
slot44.has_default_value = false
slot44.default_value = 0
slot44.type = 13
slot44.cpp_type = 3
slot45.name = "column"
slot45.full_name = ".p23.shamcellpos.column"
slot45.number = 2
slot45.index = 1
slot45.label = 2
slot45.has_default_value = false
slot45.default_value = 0
slot45.type = 13
slot45.cpp_type = 3
SHAMCELLPOS.name = "shamcellpos"
SHAMCELLPOS.full_name = ".p23.shamcellpos"
SHAMCELLPOS.nested_types = {}
SHAMCELLPOS.enum_types = {}
SHAMCELLPOS.fields = {
	slot44,
	slot45
}
SHAMCELLPOS.is_extendable = false
SHAMCELLPOS.extensions = {}
slot46.name = "formation_list"
slot46.full_name = ".p23.groupinsham.formation_list"
slot46.number = 2
slot46.index = 0
slot46.label = 3
slot46.has_default_value = false
slot46.default_value = {}
slot46.type = 13
slot46.cpp_type = 3
slot47.name = "pos"
slot47.full_name = ".p23.groupinsham.pos"
slot47.number = 3
slot47.index = 1
slot47.label = 2
slot47.has_default_value = false
slot47.default_value = nil
slot47.message_type = SHAMCELLPOS
slot47.type = 11
slot47.cpp_type = 10
slot48.name = "strategy_list"
slot48.full_name = ".p23.groupinsham.strategy_list"
slot48.number = 4
slot48.index = 2
slot48.label = 3
slot48.has_default_value = false
slot48.default_value = {}
slot48.message_type = STRATEGYINFO
slot48.type = 11
slot48.cpp_type = 10
slot49.name = "strategy_id"
slot49.full_name = ".p23.groupinsham.strategy_id"
slot49.number = 5
slot49.index = 3
slot49.label = 2
slot49.has_default_value = false
slot49.default_value = 0
slot49.type = 13
slot49.cpp_type = 3
GROUPINSHAM.name = "groupinsham"
GROUPINSHAM.full_name = ".p23.groupinsham"
GROUPINSHAM.nested_types = {}
GROUPINSHAM.enum_types = {}
GROUPINSHAM.fields = {
	slot46,
	slot47,
	slot48,
	slot49
}
GROUPINSHAM.is_extendable = false
GROUPINSHAM.extensions = {}
slot50.name = "id"
slot50.full_name = ".p23.shipinsham.id"
slot50.number = 1
slot50.index = 0
slot50.label = 2
slot50.has_default_value = false
slot50.default_value = 0
slot50.type = 13
slot50.cpp_type = 3
slot51.name = "hp_rant"
slot51.full_name = ".p23.shipinsham.hp_rant"
slot51.number = 2
slot51.index = 1
slot51.label = 2
slot51.has_default_value = false
slot51.default_value = 0
slot51.type = 13
slot51.cpp_type = 3
slot52.name = "strategy_list"
slot52.full_name = ".p23.shipinsham.strategy_list"
slot52.number = 3
slot52.index = 2
slot52.label = 3
slot52.has_default_value = false
slot52.default_value = {}
slot52.message_type = STRATEGYINFO
slot52.type = 11
slot52.cpp_type = 10
slot53.name = "ship_info"
slot53.full_name = ".p23.shipinsham.ship_info"
slot53.number = 4
slot53.index = 3
slot53.label = 2
slot53.has_default_value = false
slot53.default_value = nil
slot53.message_type = slot1.SHIPINFO
slot53.type = 11
slot53.cpp_type = 10
SHIPINSHAM.name = "shipinsham"
SHIPINSHAM.full_name = ".p23.shipinsham"
SHIPINSHAM.nested_types = {}
SHIPINSHAM.enum_types = {}
SHIPINSHAM.fields = {
	slot50,
	slot51,
	slot52,
	slot53
}
SHIPINSHAM.is_extendable = false
SHIPINSHAM.extensions = {}
slot54.name = "id"
slot54.full_name = ".p23.strategyinfo.id"
slot54.number = 1
slot54.index = 0
slot54.label = 2
slot54.has_default_value = false
slot54.default_value = 0
slot54.type = 13
slot54.cpp_type = 3
slot55.name = "count"
slot55.full_name = ".p23.strategyinfo.count"
slot55.number = 2
slot55.index = 1
slot55.label = 2
slot55.has_default_value = false
slot55.default_value = 0
slot55.type = 13
slot55.cpp_type = 3
STRATEGYINFO.name = "strategyinfo"
STRATEGYINFO.full_name = ".p23.strategyinfo"
STRATEGYINFO.nested_types = {}
STRATEGYINFO.enum_types = {}
STRATEGYINFO.fields = {
	slot54,
	slot55
}
STRATEGYINFO.is_extendable = false
STRATEGYINFO.extensions = {}
slot56.name = "id"
slot56.full_name = ".p23.hpinfo.id"
slot56.number = 1
slot56.index = 0
slot56.label = 2
slot56.has_default_value = false
slot56.default_value = 0
slot56.type = 13
slot56.cpp_type = 3
slot57.name = "hp_rant"
slot57.full_name = ".p23.hpinfo.hp_rant"
slot57.number = 2
slot57.index = 1
slot57.label = 2
slot57.has_default_value = false
slot57.default_value = 0
slot57.type = 13
slot57.cpp_type = 3
HPINFO.name = "hpinfo"
HPINFO.full_name = ".p23.hpinfo"
HPINFO.nested_types = {}
HPINFO.enum_types = {}
HPINFO.fields = {
	slot56,
	slot57
}
HPINFO.is_extendable = false
HPINFO.extensions = {}
slot58.name = "id"
slot58.full_name = ".p23.shamtargetinfo.id"
slot58.number = 1
slot58.index = 0
slot58.label = 2
slot58.has_default_value = false
slot58.default_value = 0
slot58.type = 13
slot58.cpp_type = 3
slot59.name = "level"
slot59.full_name = ".p23.shamtargetinfo.level"
slot59.number = 2
slot59.index = 1
slot59.label = 2
slot59.has_default_value = false
slot59.default_value = 0
slot59.type = 13
slot59.cpp_type = 3
slot60.name = "icon"
slot60.full_name = ".p23.shamtargetinfo.icon"
slot60.number = 3
slot60.index = 2
slot60.label = 2
slot60.has_default_value = false
slot60.default_value = 0
slot60.type = 13
slot60.cpp_type = 3
slot61.name = "name"
slot61.full_name = ".p23.shamtargetinfo.name"
slot61.number = 4
slot61.index = 3
slot61.label = 2
slot61.has_default_value = false
slot61.default_value = ""
slot61.type = 9
slot61.cpp_type = 9
slot62.name = "ship_list"
slot62.full_name = ".p23.shamtargetinfo.ship_list"
slot62.number = 5
slot62.index = 4
slot62.label = 3
slot62.has_default_value = false
slot62.default_value = {}
slot62.message_type = slot1.SHIPINFO
slot62.type = 11
slot62.cpp_type = 10
slot63.name = "skin_id"
slot63.full_name = ".p23.shamtargetinfo.skin_id"
slot63.number = 6
slot63.index = 5
slot63.label = 2
slot63.has_default_value = false
slot63.default_value = 0
slot63.type = 13
slot63.cpp_type = 3
slot64.name = "propose"
slot64.full_name = ".p23.shamtargetinfo.propose"
slot64.number = 7
slot64.index = 6
slot64.label = 2
slot64.has_default_value = false
slot64.default_value = 0
slot64.type = 13
slot64.cpp_type = 3
slot65.name = "remoulded"
slot65.full_name = ".p23.shamtargetinfo.remoulded"
slot65.number = 8
slot65.index = 7
slot65.label = 2
slot65.has_default_value = false
slot65.default_value = 0
slot65.type = 13
slot65.cpp_type = 3
SHAMTARGETINFO.name = "shamtargetinfo"
SHAMTARGETINFO.full_name = ".p23.shamtargetinfo"
SHAMTARGETINFO.nested_types = {}
SHAMTARGETINFO.enum_types = {}
SHAMTARGETINFO.fields = {
	slot58,
	slot59,
	slot60,
	slot61,
	slot62,
	slot63,
	slot64,
	slot65
}
SHAMTARGETINFO.is_extendable = false
SHAMTARGETINFO.extensions = {}
cs_23002 = slot0.Message(CS_23002)
cs_23004 = slot0.Message(CS_23004)
cs_23006 = slot0.Message(CS_23006)
cs_23010 = slot0.Message(CS_23010)
currentshaminfo = slot0.Message(CURRENTSHAMINFO)
groupinsham = slot0.Message(GROUPINSHAM)
hpinfo = slot0.Message(HPINFO)
sc_23001 = slot0.Message(SC_23001)
sc_23003 = slot0.Message(SC_23003)
sc_23005 = slot0.Message(SC_23005)
sc_23007 = slot0.Message(SC_23007)
sc_23009 = slot0.Message(SC_23009)
sc_23011 = slot0.Message(SC_23011)
shamcellinfo = slot0.Message(SHAMCELLINFO)
shamcellpos = slot0.Message(SHAMCELLPOS)
shamshop = slot0.Message(SHAMSHOP)
shamtargetinfo = slot0.Message(SHAMTARGETINFO)
shipinsham = slot0.Message(SHIPINSHAM)
strategyinfo = slot0.Message(STRATEGYINFO)

return
