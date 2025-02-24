private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasJets = "jets" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
private _hasKart = "kart" in A3A_enabledDLC;
private _hasGM = "gm" in A3A_enabledDLC;
private _hasCSLA = "csla" in A3A_enabledDLC;
private _hasRF = "rf" in A3A_enabledDLC;

////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "Remnants"] call _fnc_saveToTemplate;
["nameLeader", "Georgious Akhanteros"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["faces", [
	"GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "GreekHead_A3_07",
    "GreekHead_A3_08",
    "GreekHead_A3_09",
	"GreekHead_A3_10_l",
	"GreekHead_A3_10_sa",
	"GreekHead_A3_10_a",
    "GreekHead_A3_11",
    "GreekHead_A3_12",
    "GreekHead_A3_13",
    "GreekHead_A3_14",
    "Ioannou",
    "Mavros"
]] call _fnc_saveToTemplate; 
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_Syndicate_Wps_F"] call _fnc_saveToTemplate;

private _lightArmedVehicles = ["I_MRAP_03_gmg_F","I_MRAP_03_hmg_F"];
private _lightUnarmedVehicles = ["I_MRAP_03_F"];
private _apc = ["I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F"];
private _tanks = ["I_UGV_01_rcws_F","I_MBT_03_cannon_F"];
private _helis = ["I_Heli_Transport_02_F","I_Heli_light_03_dynamicLoadout_F","I_Heli_light_03_unarmed_F"];
private _uav = ["I_UAV_01_F"];
private _trucks = ["I_UGV_01_F","I_Truck_02_covered_F","I_Truck_02_transport_F"];

private _staticLowWeapons = ["I_G_HMG_02_high_F","I_G_HMG_02_F"];
private _staticAT = ["B_static_AT_F"];
private _staticMortars = ["I_G_Mortar_01_F"];

if (_hasApex) then {
	_lightArmedVehicles append ["I_C_Offroad_02_AT_F", "I_C_Offroad_02_LMG_F", "I_G_Offroad_01_AT_F", "I_G_Offroad_01_armed_F"];
	_lightUnarmedVehicles append ["I_C_Offroad_02_unarmed_F","B_G_Offroad_01_F"];
} else {
	_lightArmedVehicles append ["I_G_Offroad_01_AT_F", "I_G_Offroad_01_armed_F"];
	_lightUnarmedVehicles pushBack "I_G_Offroad_01_F";
};

if (_hasWs) then {
	_lightArmedVehicles append ["I_G_Offroad_01_armor_AT_lxWS", "I_G_Offroad_01_armor_armed_lxWS"];
	_lightUnarmedVehicles pushBack "I_G_Offroad_01_armor_base_lxWS";
	_apc append ["O_SFIA_APC_Wheeled_02_hmg_lxWS","O_SFIA_APC_Wheeled_02_unarmed_lxWS"];
    _uav append ["I_UAV_02_lxWS","O_Tura_UAV_02_IED_lxWS"];
};

if (_hasLawsOfWar) then {
	_trucks append ["I_G_Van_02_transport_F", "I_G_Van_02_vehicle_F"];
    _uav append ["O_UAV_06_F","O_UAV_06_medical_F","C_IDAP_UAV_06_antimine_F"];
};

if (_hasTanks) then {
	_tanks append ["I_LT_01_cannon_F","I_LT_01_AT_F"];
};

if (isClass (configFile >> "cfgVehicles" >> "gmx_aaf_m113a2dk_wdl") && _hasGM) then {
	_staticLowWeapons append ["gm_dk_army_mg3_aatripod", "gm_gc_army_dshkm_aatripod"];
	_staticAT append ["gm_ge_army_milan_launcher_tripod", "gm_gc_army_fagot_launcher_tripod", "gm_gc_army_spg9_tripod"];
	_lightArmedVehicles append ["gmx_aaf_iltis_milan_wdl","gm_ge_army_iltis_mg3"];
	_lightUnarmedVehicles pushBack "gmx_aaf_iltis_cargo_wdl";
	_trucks append ["gmx_aaf_kat1_451_container_wdl","gmx_aaf_kat1_451_cargo_wdl","gmx_aaf_kat1_454_cargo_wdl","gmx_aaf_u1300l_container_wdl","gmx_aaf_u1300l_cargo_wdl"];
	_tanks append ["gmx_aaf_leopard1a1a1_wdl","gmx_aaf_leopard1a3_wdl","gmx_aaf_leopard1a5_wdl"];
	_helis append ["gmx_aaf_ch53g_wdl","gmx_aaf_ch53gs_wdl","gmx_aaf_bo105p_pah1_wdl","gmx_aaf_bo105p_pah1a1_wdl","gmx_aaf_bo105m_vbh_wdl","gmx_aaf_bo105p1m_vbh_wdl","gmx_aaf_bo105p1m_vbh_swooper_wdl"];
	_apc append ["gmx_aaf_bpz2a0_wdl","gmx_aaf_m113a1g_apc_wdl","gmx_aaf_m113a1g_apc_milan_wdl","gmx_aaf_m113a1g_command_wdl","gmx_aaf_m113a2dk_wdl","gmx_aaf_luchsa2_wdl","gmx_aaf_luchsa1_wdl","gmx_aaf_marder1a1plus_wdl","gmx_aaf_marder1a1a_wdl","gmx_aaf_marder1a2_wdl","gmx_aaf_fuchsa0_command_wdl","gmx_aaf_fuchsa0_engineer_wdl","gmx_aaf_fuchsa0_reconnaissance_wdl"];
};

if (_hasCSLA) then {
	_staticLowWeapons append ["AFMC_infFALf", "AFMC_M2l","CSLA_UK59L_Stat","CSLA_UK59T_Stat"];
	_staticAT append ["AFMC_TOW_Stat", "CSLA_rT21","CSLA_9K113_Stat"];
	_staticMortars append ["US85_M252_Stat","CSLA_M52_Stat"];
	_lightArmedVehicles append ["US85_M1025_M2","US85_M1025_M60","US85_M1043_M2","US85_M1043_M60","US85_M998SFGT","FIA_AZU_DSKM","FIA_AZU_T21"];
	_lightUnarmedVehicles append  ["US85_M1008c","US85_M1008","US85_M1025_ua","US85_M1043_ua","FIA_AZU_para","CSLA_AZU_R2","CSLA_AZU"];
	_tanks append ["US85_M1A1","US85_M1IP","CSLA_T72","CSLA_T72M","CSLA_T72M1"];
	_helis append ["US85_MH60M134","US85_UH60M240","US85_AH1F"];
	_apc append ["US85_LAV25","AFMC_M113A2ext","US85_M113"];
};

if (_hasRF) then {
	_lightArmedVehicles append ["I_Pickup_mmg_rf","I_Pickup_hmg_rf","I_G_Pickup_hmg_rf"];
	_lightUnarmedVehicles append ["I_Pickup_rf","I_Pickup_Comms_rf"];
	_uav append ["I_UAV_RC40_SENSOR_RF","I_UAV_RC40_HE_RF","I_UAV_RC40_SmokeWhite_RF"];
	_helis append ["I_Heli_EC_01A_military_RF","I_Heli_EC_02_RF","a3a_green_Heli_light_03_unarmed_RF","a3a_AAF_Heli_light_03_unarmed_RF","a3a_AAF_Heli_light_03_dynamicLoadout_RF"];
	_staticMortars append ["I_CommandoMortar_RF","I_TwinMortar_RF"]
};

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["handGrenadeAmmo", ["GrenadeHand"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

["staticLowWeapons", _staticLowWeapons] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["vehiclesRivalsLightArmed", _lightArmedVehicles] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", _trucks] call _fnc_saveToTemplate;
["vehiclesRivalsCars", _lightUnarmedVehicles] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", _apc] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", _helis] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", _uav] call _fnc_saveToTemplate;			

["animations", [
    ["O_SFIA_APC_Wheeled_02_hmg_lxWS", ["mg_hide_armor_front",0.3,"mg_hide_armor_rear",0.3,"mg_Hide_Rail",0.3,"showBags",0.3,"showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["O_SFIA_APC_Wheeled_02_unarmed_lxWS", ["showBags",0.3,"showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["a3a_AAF_Heli_light_03_unarmed_RF", ["door_1",0.3,"door_2",0.3,"hide_radar",0.3,"hide_antenna",0.3,"hide_float_bags",0,"hide_tread",0.3]],
    ["a3a_green_Heli_light_03_unarmed_RF", ["door_1",0.3,"door_2",0.3,"hide_radar",0.3,"hide_antenna",0.3,"hide_float_bags",0.3,"hide_tread",0.3]],
    ["a3a_AAF_Heli_light_03_dynamicLoadout_RF", ["door_1",0.3,"door_2",0.3,"hide_radar",0.3,"hide_antenna",0.3,"hide_float_bags",0.3]],
    ["a3a_Heli_EC_02_RF", ["hide_antenna",0.3,"hide_ir_small",0.3,"hide_ir_large",0.3,"hide_engfilters_01",0.3,"hide_engfilters_02",0.3,"hide_rotordome",0.3,"hide_hook",0.3,"hide_chin_plate",0.3,"hide_ceiling_blanket",0.3,"hide_cm_dispenser",0.3,"door_copilot",0,"door_pilot",0,"door_cargo_left",0.3,"door_cargo_right",0.3]],
    ["I_Heli_EC_01A_military_RF", ["hide_winch",0.3,"hide_mirror",0.3,"hide_antenna",0.3,"hide_ir_small",0.3,"hide_ir_large",0.3,"hide_engfilters_01",0.3,"hide_engfilters_02",0.3,"hide_rotordome",0.3,"hide_hook",0.3,"hide_chin_plate",0.3,"hide_ceiling_blanket",0.3,"hide_cm_dispenser",0.3,"door_copilot",0,"door_pilot",0,"door_cargo_left",0.3,"door_cargo_right",0.3]],
    ["B_Heli_EC_04_military_RF", ["hide_ir_large",0.3,"hide_radar",0.3,"hide_searchlamp",0.3,"hide_winch",0.3,"hide_float_bags",0.3,"hide_antenna",0.3,"hide_refuelprobe",0.3,"hide_sensor",0.3,"hide_ir_small",0.3,"hide_fueltanks",0.3,"hide_engfilters_01",0.3,"hide_engfilters_02",0.3,"hide_rotordome",0.3,"hide_hook",0.3,"hide_chin_plate",0.3,"hide_ceiling_blanket",0.3,"hide_cm_dispenser",0.3,"door_copilot",0,"door_pilot",0,"door_cargo_left",0.3,"door_cargo_right",0.3]],
    ["B_Heli_EC_03_RF", ["hide_radar",0.3,"hide_float_bags",0.3,"hide_antenna",0.3,"hide_refuelprobe",0.3,"hide_sensor",0.3,"hide_ir_small",0.3,"hide_ir_large",0.3,"hide_engfilters_01",0.3,"hide_engfilters_02",0.3,"hide_rotordome",0.3,"hide_hook",0.3,"hide_chin_plate",0.3,"hide_ceiling_blanket",0.3,"hide_cm_dispenser",0.3,"door_copilot",0,"door_pilot",0,"door_cargo_left",0.3,"door_cargo_right",0.3]],
    ["I_Pickup_aat_rf", ["hide_frame",0.3,"hide_frame_full",0.3,"hide_bullbar",0.3,"hide_snorkel",0.3,"hide_antenna",0.3,"hide_trunk_door",0.3,"trunk_door_open",0.3,"hide_armor_window_armor_top",1,"window_armor_hatch_L_rot",0,"window_armor_hatch_R_rot",0,"door_F_L_open",0,"door_F_R_open",0,"door_R_L_open",0,"door_R_R_open",0,"hide_rack",0.3,"hide_rack_spotlights",0.3,"hide_sidesteps",0.3]],
    ["I_Pickup_rf", ["hide_bullbar",0.3,"hide_fuel_tank",1,"hide_snorkel",0.3,"hide_antenna",0.3,"hide_trunk_cover",1,"hide_trunk_door",0.3,"trunk_door_open",0.3,"hide_armor_window_armor_top",1,"window_armor_hatch_L_rot",0.3,"window_armor_hatch_R_rot",0,"door_F_L_open",0,"door_F_R_open",0,"door_R_L_open",0,"door_R_R_open",0,"hide_rack",0.3,"hide_rack_spotlights",0.3,"hide_frame",0.3,"hide_sidesteps",0.3]],
    ["I_Pickup_Comms_rf", ["hide_rack",0.3,"hide_rack_antenna",0.3,"hide_frame",0.3,"hide_frame_full",0.3,"hide_frame_full_panel",0.3,"hide_box",0.3,"hide_box_door",0.3,"hide_trunk_door",0.3,"trunk_door_open",0,"box_door_open",0,"hide_police",1,"hide_Services",1,"BeaconsServicesStart",0,"hide_bullbar",0.3,"hide_snorkel",0.3,"hide_antenna",0.3,"hide_armor_window_armor_top",1,"window_armor_hatch_L_rot",0,"window_armor_hatch_R_rot",0,"door_F_L_open",0,"door_F_R_open",0,"door_R_L_open",0,"door_R_R_open",0,"hide_rack_spotlights",0.3,"hide_sidesteps",0.3]],
    ["I_Pickup_mmg_rf", ["hide_trunk_cover",1,"hide_frame_full",0.3,"hide_bullbar",0.3,"hide_snorkel",0.3,"hide_antenna",0.3,"hide_trunk_door",0.3,"trunk_door_open",0.3,"hide_armor_window_armor_top",1,"window_armor_hatch_L_rot",0,"window_armor_hatch_R_rot",0,"door_F_L_open",0,"door_F_R_open",0,"door_R_L_open",0,"door_R_R_open",0,"hide_frame",0.3,"hide_sidesteps",0.3]],
    ["I_TwinMortar_RF", ["hide_door_l",0.3,"hide_door_r",0.3]],
    ["I_APC_Wheeled_03_cannon_F", ["showCamonetHull", 0.3, "showSLATHull", 0.3]],
    ["I_MBT_03_cannon_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.25, "HideTurret", 0.3, "HideHull", 0.3]],
    ["I_APC_tracked_03_cannon_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3, "showTools", 0.3, "showSLATHull", 0.3, "showSLATTurret", 0.3]],
    ["I_LT_01_AA_F", ["showTools", 0.3,"showCamonetHull", 0.3,"showBags",0.3,"showSLATHull", 0.3]],
    ["I_LT_01_AT_F", ["showTools", 0.3,"showCamonetHull", 0.3,"showBags", 0.3,"showSLATHull", 0.3]],
    ["I_LT_01_scout_F", ["showTools", 0.3,"showCamonetHull", 0.3,"showBags", 0.3,"showSLATHull", 0.3]],
    ["I_LT_01_cannon_F", ["showTools", 0.3,"showCamonetHull", 0.3,"showBags", 0.3,"showSLATHull", 0.3]],
    ["I_C_Offroad_02_unarmed_F", ["hideLeftDoor",0.3,"hideRightDoor",0.3,"hideRearDoor",0.3,"hideBullbar",0.3,"hideFenders",0.3,"hideHeadSupportRear",0.3,"hideHeadSupportFront",0.3,"hideRollcage",0.3,"hideSeatsRear",0,"hideSpareWheel",0.3]],
    ["a3a_Offroad_02_LMG_black_F", ["hideLeftDoor",0.3,"hideRightDoor",0.3,"hideRearDoor",0.3,"hideFenders",0.3,"hideHeadSupportFront",0.3,"hideSpareWheel",0.3]],
    ["gmx_aaf_leopard1a1a1_wdl", ["CamoNet_01_unhide",0.3,"CamoNet_05_unhide",0.3,"CamoNet_03_unhide",0.3,"SpareWheel_02_unhide",0.3,"AmmoBox_01_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"sideskirt_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3]],
    ["gmx_aaf_leopard1a3_wdl", ["CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_03_unhide",0.3,"sideskirt_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3]],
    ["gmx_aaf_leopard1a5_wdl", ["CamoNet_04_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_03_unhide",0.3,"SpareWheel_02_unhide",0.3,"AmmoBox_01_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"sideskirt_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3]],
    ["gmx_aaf_m113a1g_medic_wdl", ["IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"storageBox_01_unhide",0.3,"generator_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gmx_aaf_u1300l_medic_wdl", ["sign_mlc_unhide",0.3,"sign_medic_unhide",0.3,"camonetpoles_1_1_unhide",0.3,"CamoNet_01_rack_unhide",0.3,"CamoNet_01_unhide",0.3]],
    ["gmx_aaf_kat1_451_reammo_wdl", ["cover_hoops_unhide",0.3,"cover_down_unhide",0.3,"cover_up_unhide",0.3]],
    ["gmx_aaf_u1300l_cargo_wdl", ["BoardWall_2_1_unhide",0.3,"cover_hoops_unhide",0.3,"cover_down_unhide",0.3,"cover_up_unhide",0.3,"BoardWall_1_1_extension_unhide",0.3,"camonetpoles_1_1_unhide",0.3,"CamoNet_01_rack_unhide",0.3,"CamoNet_01_unhide",0.3,"generator_unhide",0.3,"sign_mlc_unhide",0.3,"sign_medic_unhide",0]],
    ["gmx_aaf_kat1_451_cargo_wdl", ["cover_hoops_unhide",0.3,"cover_down_unhide",0.3,"cover_up_unhide",0.3]],
    ["gmx_aaf_u1300l_container_wdl", ["BoardWall_2_1_unhide",0.3,"cover_hoops_unhide",0.3,"cover_down_unhide",0.3,"cover_up_unhide",0.3,"BoardWall_1_1_extension_unhide",0.3,"camonetpoles_1_1_unhide",0.3,"CamoNet_01_rack_unhide",0.3,"CamoNet_01_unhide",0.3,"generator_unhide",0.3,"sign_mlc_unhide",0.3,"sign_medic_unhide",0.3]],
    ["gmx_aaf_kat1_451_container_wdl", ["gmx_aaf_wdl",0.3], ["cover_hoops_unhide",0.3,"cover_down_unhide",0.3,"cover_up_unhide",0.3]],
    ["gmx_aaf_u1300l_repair_wdl", ["beacon_01_org_unhide",0.3,"CamoNet_01_rack_unhide",0.3,"CamoNet_01_unhide",0.3,"generator_unhide",0.3,"sign_mlc_unhide",0.3,"sign_medic_unhide",0]],
    ["gmx_aaf_bpz2a0_wdl", ["beacon_01_org_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gmx_aaf_brpz1_wdl", ["beacon_01_org_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_dk_army_typ247_cargo", ["cover_01_hoops_unhide",0.3,"sirenLights_02_unhide",0,"sirenLights_03_unhide",0,"sirenLights_01_unhide",0,"sirenLights_05_unhide",0,"cargo_rack_01_unhide",0.3,"cargo_rack_03_unhide",0.3,"wheel_1_1_cap_unhide",0.3]],
    ["gmx_aaf_m113a1g_apc_wdl", ["IceCleats_01_unhide",0.3,"IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"storageBox_01_unhide",0.3,"CamoNet_02_unhide",0.3,"generator_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gmx_aaf_m113a1g_apc_milan_wdl", ["IceCleats_01_unhide",0.3,"IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"storageBox_01_unhide",0.3,"CamoNet_02_unhide",0.3,"generator_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gmx_aaf_m113a1g_command_wdl", ["antennaMast_01_unhide",0.3,"antennamast_01_elev_trigger",0.3,"generator_01_unhide",0.3,"storageBox_01_unhide",0.3,"IceCleats_01_unhide",0.3,"IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gmx_aaf_m113a2dk_wdl", ["camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3]],
    ["gmx_aaf_luchsa1_wdl", ["CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"radio_03_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gmx_aaf_luchsa2_wdl", ["radio_03_unhide",0.3,"SignsExtraWide_unhide",0.3,"TurretBox_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gmx_aaf_marder1a1plus_wdl", ["beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"CamoNet_01_unhide",0.3,"supply_01_unhide",0.3,"supply_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gmx_aaf_marder1a1a_wdl", ["beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"CamoNet_01_unhide",0.3,"supply_01_unhide",0.3,"supply_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gmx_aaf_marder1a2_wdl", ["beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"CamoNet_01_unhide",0.3,"supply_01_unhide",0.3,"supply_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gmx_aaf_fuchsa0_command_wdl", ["radio_04_unhide",0.3,"antennamast_01_elev_trigger",0.3,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"CamoNet_01_unhide",0.3,"CamoNet_02_rack_unhide",0.3,"StowingBox_01_unhide",0.3,"SignsExtraWide_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gmx_aaf_fuchsa0_engineer_wdl", ["ringbuoy_01_unhide",0.3,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"CamoNet_01_unhide",0.3,"CamoNet_02_rack_unhide",0.3,"SignsExtraWide_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gmx_aaf_fuchsa0_reconnaissance_wdl", ["beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"CamoNet_01_unhide",0.3,"CamoNet_02_rack_unhide",0.3,"StowingBox_01_unhide",0.3,"SignsExtraWide_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["US85_M1A1", ["ADD_smallAmmobox",0.3,"ADD_medAmmoBox",0.3,"ADD_topStuff",0.3,"ADD_cardBoardBox",0.3,"ADD_trackLink",0.3,"ADD_spareWheel",0.3,"ADD_frontTowRings",0.3,"ADD_rearTowRings",0.3,"ADD_frontTowBar",0.3,"ADD_rearTowBar",0.3,"ADD_leftTowCable",0.3,"ADD_rightTowCable",0.3,"ADD_alice",0.3,"ADD_fuelCan",0.3,"ADD_camoNet",0.3]],
    ["US85_M1IP", ["ADD_topStuff",0.3,"ADD_cardBoardBox",0.3,"ADD_trackLink",0.3,"ADD_spareWheel",0.3,"ADD_frontTowRings",0.3,"ADD_rearTowRings",0.3,"ADD_frontTowBar",0.3,"ADD_rearTowBar",0.3,"ADD_leftTowCable",0.3,"ADD_rightTowCable",0.3,"ADD_alice",0.3,"ADD_fuelCan",0.3,"ADD_camoNet",0.3]]
]] call _fnc_saveToTemplate;

["variants", [
    ["B_Heli_EC_03_RF", ["AAF", 0.5, "AAF_Olive", 0.5]],
    ["I_Heli_EC_01A_military_RF", ["AAF", 0.5, "AAF_Olive", 0.5]],
    ["B_Heli_EC_04_military_RF", ["AAF", 0.5, "AAF_Olive", 0.5]],
    ["a3a_Heli_EC_02_RF", ["AAF", 0.5, "AAF_Olive", 0.5]],
    ["I_LT_01_AA_F", ["Indep_Olive", 0, "Indep_01", 0.5]],
    ["I_LT_01_cannon_F", ["Indep_Olive", 0, "Indep_01", 0.5]],
    ["I_LT_01_AT_F", ["Indep_Olive", 0, "Indep_01", 0.5]],
    ["I_LT_01_scout_F",["Indep_Olive", 0, "Indep_01", 0.5]],
    ["I_Plane_Fighter_04_F", ["CamoGrey",0.1, "DigitalCamoGrey", 0.4, "DigitalCamoGreen",0.5]],
    ["I_Heli_light_03_unarmed_F", ["Indep", 0.5]],
    ["a3a_Offroad_02_LMG_black_F", ["Olive",1]],
    ["I_C_Offroad_02_unarmed_F", ["Olive",1]],
    ["gm_ge_pol_w123", ["gm_darklblue",1]],
    ["gm_ge_pol_typ1200",["gm_saphireblue",1]],
    ["gm_gc_pol_p601", ["gm_kosmosblau",1]],
    ["gm_ge_pol_typ253",["gm_navyblue_damusowhite",1]],
    ["CSLA_AZU_VB", ["vb2",1]],
    ["US85_UH60M240", ["NATO",1]],
    ["US85_UH60", ["NATO",1]],
    ["US85_MH60FFAR", ["NATO",1]],
    ["US85_MH60M134", ["NATO",1]],
    ["US85_AH1F", ["AFMC",1]],
    ["CSLA_Mi24V", ["camo6",1]],
    ["US85_M1IP", ["NATOg",1]],
    ["US85_M1A1", ["NATOg",1]],
    ["US85_LAV25", ["NATOg",1]],
    ["US85_M113", ["NATOg",1]],
    ["US85_M163", ["NATOg",1]],
    ["AFMC_M113A2ext",["NATOg",1]],
    ["US85_M113_DTP", ["NATOg",1]],
    ["US85_M923r", ["NATOg",1]],
    ["US85_M113_AMB", ["NATOg",1]],
    ["US85_M923f", ["NATOg",1]],
    ["US85_M923a1_f", ["NATOg",1]],
    ["US85_M923a", ["NATOg",1]],
    ["US85_M923a1_a", ["NATOg",1]],
    ["US85_M923a1c", ["NATOg",1]],
    ["US85_M923o", ["NATOg",1]],
    ["US85_M923c", ["NATOg",1]],
    ["US85_M923a1o", ["NATOg",1]],
    ["US85_M923a1cm2", ["NATOg",1]],
    ["US85_M923a1om2", ["NATOg",1]],
    ["US85_M923cargo", ["NATOg",1]],
    ["US85_M923a1_cargo", ["NATOg",1]],
    ["US85_M1008c", ["NATOg",1]],
    ["US85_M1008", ["NATOg",1]],
    ["US85_M1025_ua", ["NATOg",1]],
    ["US85_M1043_ua", ["NATOg",1]],
    ["US85_M1025_M2", ["NATOg",1]],
    ["US85_M1025_M60", ["NATOg",1]],
    ["US85_M1043_M2", ["NATOg",1]],
    ["US85_M1043_M60", ["NATOg",1]],
    ["US85_M998SFGT", ["NATOg",1]]
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
private _rifles = [
	["arifle_TRG21_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
	["arifle_Mk20_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
	["arifle_SDAR_F","","","", ["20Rnd_556x45_UW_mag","20Rnd_556x45_UW_mag","20Rnd_556x45_UW_mag"], [], ""]
];
private _tunedRifles = [
	["arifle_TRG21_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
	["arifle_Mk20_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
	["arifle_TRG21_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
	["arifle_Mk20_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
];
private _enforcerRifles = [
	["arifle_TRG21_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
	["arifle_Mk20_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
];
private _carbines = [
	["arifle_TRG20_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
	["arifle_Mk20C_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
];
private _gls = [
	["arifle_TRG21_GL_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
	["arifle_Mk20_GL_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""]
];
private _mgs = [
	["LMG_Zafir_F", "", "", "", ["150Rnd_762x54_Box", "150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
	["LMG_Mk200_F", "", "", "", ["200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer"], [],""]
];
private _marksmanRifles = [
	["srifle_EBR_F", "", "", "optic_MRCO", ["20Rnd_762x51_Mag"], [], ""]
];

private _rpgs = [
	["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
	["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
	["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""]  //dlc check for tanks
];

private _pistols = ["hgun_ACPC2_F"];

_loadoutData set ["lightHELaunchers", [
["launch_NLAW_F","","","",["NLAW_F"],[],""]
]];
_loadoutData set ["AALaunchers", [
["launch_I_Titan_F","","","",["Titan_AA"],[],""]
]];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["IEDLandSmall_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

if (_hasGM) then {
    (_loadoutData get "antiInfantryGrenades") append [
        "gm_handgrenade_conc_dm51","gm_handgrenade_conc_dm51a1","gm_handgrenade_frag_dm41","gm_handgrenade_frag_dm41a1","gm_handgrenade_frag_dm51","gm_handgrenade_frag_dm51a1","gm_handgrenade_frag_m26",
        "gm_handgrenade_frag_m26a1", "gm_handgrenade_frag_rgd5"
    ];
	(_loadoutData get "smokeGrenades") append [
        "gm_smokeshell_wht_gc",
        "gm_smokeshell_wht_dm25"
    ];
	(_loadoutData get "signalsmokeGrenades") append [
        "gm_smokeshell_blk_gc","gm_smokeshell_blu_gc","gm_smokeshell_grn_gc","gm_smokeshell_org_gc","gm_smokeshell_red_gc","gm_smokeshell_yel_gc","gm_smokeshell_grn_dm21",
        "gm_smokeshell_red_dm23","gm_smokeshell_yel_dm26","gm_smokeshell_org_dm32"
    ];
	(_loadoutData get "lightExplosives") append [
        "gm_explosive_plnp_charge"
    ];
	(_loadoutData get "heavyExplosives") append [
        "gm_explosive_petn_charge"
    ];
	(_loadoutData get "ATMines") append [
        "gm_mine_at_dm21","gm_mine_at_tm46"
    ];
	(_loadoutData get "APMines") append [
        "gm_mine_ap_dm31"
    ];
};

if (_hasCSLA) then {
    (_loadoutData get "antiInfantryGrenades") append [
        "CSLA_F1","CSLA_RG4o","CSLA_RG4u","CSLA_URG86u","CSLA_URG86o"
    ];
	(_loadoutData get "lightExplosives") append [
        "CSLA_TNT0100g"
    ];
	(_loadoutData get "APMines") append [
        "CSLA_F1m_mag","US85_M67m_mag","CSLA_NO2","CSLA_RG4m_mag","CSLA_URG86m_mag","CSLA_PPMiNa_mag"
    ];
	(_loadoutData get "ATMines") append [
        "CSLA_PtMiBa3_mag"
    ];
};

if (_hasRF) then {
	_marksmanRifles pushBack ["srifle_DMR_01_black_RF", "", "acc_flashlight", "optic_VRCO_RF", ["10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag"], [], ""];
	_rifles pushBack ["arifle_ash12_blk_RF", "", "", "", ["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], [], ""];
	_enforcerRifles pushBack ["arifle_ash12_LR_blk_RF", "", "optic_VRCO_RF", "", ["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], [], ""];
	_tunedRifles pushBack ["arifle_ash12_LR_blk_RF", "", "", "optic_VRCO_RF", ["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], [], ""];
	_gls pushBack ["arifle_ash12_GL_blk_RF", "", "acc_flashlight", "optic_VRCO_khk_RF", ["10Rnd_127x55_Mag_RF", "20Rnd_127x55_Mag_RF"], ["1Rnd_HE_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "UGL_FlareGreen_F"], ""];
	_pistols append ["hgun_Glock19_RF", "hgun_Glock19_auto_RF", "hgun_DEagle_RF", "hgun_Glock19_auto_khk_RF", "hgun_DEagle_classic_RF"];

	if (random 100 <= 45) then {
		_tunedRifles pushBack ["srifle_h6_gold_rf", "muzzle_snds_M", "", "optic_VRCO_RF", ["30Rnd_556x45_AP_Stanag_green_RF"], [], ""];
		_pistols append ["hgun_DEagle_gold_RF"];
	};
};

if (_hasContact) then {
	_carbines pushBack ["arifle_AK12U_F", "", "", "", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""];
	_tunedRifles pushBack ["arifle_AK12U_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""];
	_marksmanRifles = [
		["srifle_DMR_06_hunter_F", "", "", "optic_DMS_weathered_F", ["10Rnd_Mk14_762x51_Mag"], [], ""]
	];
};

if (_hasMarksman) then {
	_tunedRifles pushBack ["srifle_DMR_03_F", "", "acc_flashlight", "optic_MRCO", ["20Rnd_762x51_Mag"], [], "bipod_02_F_blk"]
};

if (_hasApex) then {
	_rifles pushBack ["arifle_AKM_F", "", "", "", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""];
	_tunedRifles append [
		["arifle_AK12_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], "bipod_02_F_blk"],
		["arifle_AK12_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], "bipod_02_F_blk"]
	];
	_carbines pushBack ["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""];
	_gls pushBack ["arifle_AK12_GL_F", "", "", "", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""];
	_mgs = [
		["LMG_03_F", "", "acc_flashlight", "", ["200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_Red_F"], [], ""]
	];
	_rpgs = [
		["launch_RPG7_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
		["launch_RPG7_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
		["launch_RPG7_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
		["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
	];
	_enforcerRifles pushBack ["arifle_AKM_F", "", "", "", ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], [], ""];
	_pistols pushBack "hgun_Pistol_01_F";
};

if (_hasWs) then {
	_rifles append [
		["arifle_Galat_lxWS", "", "", "",  ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
		["arifle_Velko_lxWS", "", "", "",  ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]
	];
	_tunedRifles append [
		["arifle_AK12_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], "bipod_02_F_blk"],
		["arifle_AK12_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], "bipod_02_F_blk"]
	];
	_carbines pushBack ["arifle_VelkoR5_lxWS", "", "", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""];
	_gls append [
		["arifle_VelkoR5_GL_lxWS", "", "", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
		["arifle_SLR_GL_lxWS", "", "", "", ["20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS", "1Rnd_40mm_HE_lxWS", "1Rnd_58mm_AT_lxWS", "1Rnd_50mm_Smoke_lxWS"], ""]
	];
	_mgs pushBack ["LMG_S77_lxWS", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""];
	_marksmanRifles pushBack ["arifle_SLR_lxWS", "", "", "", ["20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""];
	_enforcerRifles append [
		["arifle_VelkoR5_lxWS", "", "", "", ["50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
		["arifle_Galat_lxWS", "", "", "", ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], [], ""],
		["sgun_aa40_lxWS", "", "", "", ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "20Rnd_12Gauge_AA40_HE_lxWS"], [], ""]
	];
};

if (_hasGM) then {
    _rpgs append [
        ["gm_m72a3_oli", "", "", "", ["gm_1Rnd_66mm_heat_m72a3"], [], ""],
        ["gm_rpg18_oli", "", "", "", ["gm_1Rnd_64mm_heat_pg18"], [], ""],
        ["gm_pzf44_2_oli", "", "", "gm_feroz2x17_pzf44_2_blk", ["gm_1Rnd_44x537mm_heat_dm32_pzf44_2", "gm_1Rnd_44x537mm_heat_dm32_pzf44_2"], [], ""]
    ];
    (_loadoutData get "lightHELaunchers") append [
        ["gm_pzf3_blk", "", "", "", ["gm_1Rnd_60mm_heat_dm22_pzf3", "gm_1Rnd_60mm_heat_dm32_pzf3"], [], ""],
        ["gm_pzf84_oli", "", "", "gm_feroz2x17_pzf84_blk", ["gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf"], [], ""]
    ];
    (_loadoutData get "AALaunchers") append [
        ["gm_fim43_oli", "", "", "", ["gm_1Rnd_70mm_he_m585_fim43"], [], ""]
    ];
	_gls append [
		["gm_g3a4a1_ris_oli", "", "", "optic_MRCO", ["gm_40Rnd_762x51mm_B_T_DM21_g3_blk","gm_40Rnd_762x51mm_B_T_DM21A1_g3_blk","gm_40Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk"], ["gm_1rnd_67mm_heat_dm22a1_g3"], ""],
		["gm_akm_pallad_wud", "", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk","gm_30Rnd_762x39mm_B_57N231_ak47_blk","gm_30Rnd_762x39mm_B_57N231_ak47_blk"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""]
	];
	_rifles append [
		["gm_ak74n_wud", "", "", "",  ["gm_30Rnd_545x39mm_B_7N6_ak74_org", "gm_30Rnd_545x39mm_B_7N6_ak74_org", "gm_30Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
		["gm_akm_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
		["gm_akmn_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
		["gm_akms_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
		["gm_akmsl_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
		["gm_akmsn_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
		["gm_hk33a2_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
		["gm_hk33a3_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
		["gm_hk33ka2_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
		["gm_hk33ka3_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
		["gm_hk33sg1_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],//
		["gm_g3a3a1_ris_blk", "", "", "",  ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""],
		["gm_g3a4a1_ris_blk", "", "", "",  ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""],
		["gm_g3a4a1_ris_blk", "", "", "",  ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""],
		["gm_m16a1_blk", "","","",["gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""],
		["gm_m16a2_blk", "","","",["gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""]
	];
    _carbines append [
        ["gm_mp5n_surefire_blk", "", "gm_surefire_l60_wht_surefire_blk", "gm_rv_stanagClaw_blk", ["gm_60Rnd_9x19mm_B_DM11_mp5a3_blk","gm_60Rnd_9x19mm_AP_DM91_mp5a3_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk"], [], ""],
        ["gm_mp5sd6_blk", "", "gm_surefire_l60_ir_hoseclamp_blk", "gm_rv_stanagClaw_blk", ["gm_60Rnd_9x19mm_B_DM11_mp5a3_blk","gm_60Rnd_9x19mm_AP_DM91_mp5a3_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk"], [], ""],
		["gm_mp5a2_blk", "", "", "gm_rv_stanagClaw_blk", ["gm_30Rnd_9x19mm_B_DM51_mp5_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk","gm_30Rnd_9x19mm_B_DM11_mp5_blk","gm_30Rnd_9x19mm_AP_DM91_mp5_blk"], [], ""],
        ["gm_mp2a1_blk", "", "", "", ["gm_32Rnd_9x19mm_B_DM51_mp2_blk","gm_32Rnd_9x19mm_B_DM11_mp2_blk","gm_32Rnd_9x19mm_AP_DM91_mp2_blk"], [], ""],
		["gm_g3ka4a1_ris_blk", "", "", "optic_ACO_grn_smg",  ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""],
		["gm_hk53a2_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
		["gm_hk53a3_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
		["gm_mpm85_blk", "", "gm_surefire_l60_wht_surefire_blk", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
		["gm_mpiaks74nk_brn", "", "", "",  ["gm_30Rnd_545x39mm_B_7N6_ak74_org", "gm_30Rnd_545x39mm_B_7N6_ak74_org", "gm_30Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
		["gm_mpikms72k_brn", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_mpikm_blk", "gm_30Rnd_762x39mm_B_57N231_mpikm_blk", "gm_30Rnd_762x39mm_B_57N231_mpikm_blk"], [], ""]
    ];
    _tunedRifles append [
        ["gm_g11k2_ris_blk","","acc_pointer_IR","optic_Nightstalker",["gm_50Rnd_473x33mm_B_DM11_g11_blk","gm_50Rnd_473x33mm_B_DM11_g11_blk","gm_50Rnd_473x33mm_B_DM11_g11_blk"], [], ""],
        ["gm_sg551_swat_blk","","acc_pointer_IR","optic_Hamr",["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_T_DM21_sg550_brn"], [], ""],
		["gm_sg551_ris_blk", "","","optic_Hamr",["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_T_DM21_sg550_brn"], [], ""],
        ["gm_sg542_ris_blk", "","","optic_Hamr",["gm_20Rnd_762x51mm_B_T_DM21A2_sg542_blk","gm_20Rnd_762x51mm_AP_DM151_sg542_blk","gm_20Rnd_762x51mm_B_DM41_sg542_blk","gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""],
		["gm_m16a1_blk", "","","gm_colt4x20_ar15_blk",["gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""],
		["gm_m16a2_blk", "","","gm_colt4x20_ar15_blk",["gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""],
		["gm_mpikms72ksd_brn", "","gm_flashlightp2_wht_akkhandguard_blu","gm_pka_dovetail_blk",["gm_30Rnd_762x39mm_BSD_57N231U_mpikm_blk","gm_30Rnd_762x39mm_BSD_57N231U_mpikm_blk","gm_30Rnd_762x39mm_BSD_57N231U_mpikm_blk"], [], ""]
    ];
    _marksmanRifles append [
        ["gm_msg90_blk","","","gm_feroz24_stanagHK_blk",["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"],
        ["gm_msg90a1_blk","","","gm_feroz24_stanagHK_blk",["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"],
		["gm_psg1_blk","","","gm_zf6x42_psg1_stanag_blk",["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk"], [], "gm_msg90_bipod_blk"],
		["gm_svd_wud","","","gm_pso6x36_1_dovetail_blk",["gm_10Rnd_762x54mmR_AP_7N1_svd_blk","gm_10Rnd_762x54mmR_API_7bz3_svd_blk","gm_10Rnd_762x54mmR_B_T_7t2_svd_blk"], [], "gm_msg90_bipod_blk"]
    ];
    _enforcerRifles append [
        ["gm_c7a1_oli", "", "", "optic_Hamr", ["gm_30Rnd_556x45mm_B_M855_stanag_gry","gm_30Rnd_556x45mm_B_T_M856_stanag_gry","gm_30Rnd_556x45mm_B_M193_stanag_gry","gm_30Rnd_556x45mm_B_T_M196_stanag_gry"], [], ""],
        ["gm_g36a1_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk","gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk"], [], ""],
        ["gm_g36e_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk","gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk"], [], ""],
        ["gm_g3ka4a1_ris_blk", "", "", "gm_c79a1_blk", ["gm_40Rnd_762x51mm_AP_DM151_g3_blk","gm_40Rnd_762x51mm_B_DM41_g3_blk","gm_40Rnd_762x51mm_B_DM111_g3_blk","gm_40Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], ""],
		["gm_hk512_wud", "", "gm_surefire_l60_wht_hoseclamp_blk", "", ["gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug","gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug"], [], ""],
        ["gm_hk512_ris_wud", "", "gm_surefire_l60_wht_hoseclamp_blk", "optic_Aco", ["gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug","gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug"], [], ""]
    ];
    _mgs append [
        ["gm_mg3_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21_mg3_grn","gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn"], [], ""],
		["gm_mg8a1_blk", "", "", "gm_colt4x20_stanagClaw_blk", ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli","gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], "gm_g8_bipod_blk"],
        ["gm_mg8a2_blk", "", "", "gm_blits_stanagHK_blk", ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli","gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], "gm_g8_bipod_blk"],
		["gm_hmgpkm_prp", "", "", "", ["gm_100Rnd_762x54mmR_B_T_7t2_pk_grn","gm_100Rnd_762x54mmR_B_T_7t2_pk_grn"], [], ""],
		["gm_lmgrpk74n_blk", "gm_suppressor_pbs4_545mm_blk", "gm_flashlightp2_wht_akhandguard_blu", "gm_pka_dovetail_blk", ["gm_45Rnd_545x39mm_B_7N6_ak74_org","gm_45Rnd_545x39mm_B_7N6_ak74_org","gm_45Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
		["gm_lmgrpk_brn", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_wht_akkhandguard_blu", "gm_pka_dovetail_blk", ["gm_75Rnd_762x39mm_B_57N231_mpikm_blk","gm_75Rnd_762x39mm_B_57N231_mpikm_blk"], [], ""],
		["gm_rpk74n_wud", "gm_suppressor_pbs4_545mm_blk", "", "gm_zfk4x25_blk", ["gm_45Rnd_545x39mm_B_7N6_ak74_org","gm_45Rnd_545x39mm_B_7N6_ak74_org","gm_45Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
		["gm_rpk_wud", "gm_suppressor_pbs1_762mm_blk", "", "gm_zvn64_rpk", ["gm_75Rnd_762x39mm_B_57N231_ak47_blk","gm_75Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
		["gm_rpkn_wud", "gm_suppressor_pbs1_762mm_blk", "", "gm_zfk4x25_blk", ["gm_75Rnd_762x39mm_B_57N231_ak47_blk","gm_75Rnd_762x39mm_B_57N231_ak47_blk"], [], ""]
    ];
	_pistols append [
        ["gm_m49_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p210_blk","gm_8Rnd_9x19mm_B_DM11_p210_blk"], [], ""],
        ["gm_p1_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM11_p1_blk","gm_8Rnd_9x19mm_B_DM51_p1_blk","gm_8Rnd_9x19mm_BSD_DM81_p1_blk"], [], ""],
        ["gm_p1sd_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM11_p1_blk","gm_8Rnd_9x19mm_B_DM51_p1_blk","gm_8Rnd_9x19mm_BSD_DM81_p1_blk"], [], ""],
        ["gm_p210_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM11_p210_blk","gm_8Rnd_9x19mm_B_DM51_p210_blk"], [], ""],
        ["gm_pim_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""],
        ["gm_pimb_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""],
        ["gm_pm63_handgun_blk", "", "", "", ["gm_15Rnd_9x18mm_B_pst_pm63_blk","gm_25Rnd_9x18mm_B_pst_pm63_blk"], [], ""]
    ];
};

if (_hasCSLA) then {
    _rpgs append [
        ["US85_M136", "", "", "", ["US85_M136_Mag"], [], ""],
        ["US85_M47", "", "", "", ["US85_M47_Mag"], [], ""],
        ["CSLA_RPG7", "", "", "CSLA_PGO7", ["CSLA_PG7M110V", "CSLA_PG7M110V"], [], ""],
		["CSLA_RPG75", "", "", "", ["CSLA_RPG75_Mag", "CSLA_RPG75_Mag"], [], ""],
		["CSLA_RPG7", "", "", "CSLA_PGO7", ["CSLA_PG7M110V", "CSLA_PG7M110V"], [], ""]
    ];
    (_loadoutData get "lightHELaunchers") append [
        ["US85_LAW72", "", "", "", ["US85_LAW72_Mag", "US85_LAW72_Mag"], [], ""],
        ["US85_MAAWS", "", "", "", ["US85_MAAWS_HEDP","US85_MAAWS_HEDP","US85_MAAWS_HEAT"], [], ""],
		["US85_SMAW", "", "", "", ["US85_SMAW_HEAA","US85_SMAW_HEAA","US85_SMAW_HEDP"], [], ""]
    ];
    (_loadoutData get "AALaunchers") append [
        ["CSLA_9K32", "", "", "", ["CSLA_9M32M","CSLA_9M32M"], [], ""],
		["US85_FIM92", "", "", "", ["US85_FIM92_Mag","US85_FIM92_Mag"], [], ""]
    ];
	_gls append [
		["US85_M16A2CARGL", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], ["US85_M406","US85_M406","US85_M406"], ""],
		["US85_M16A2GL", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], ["US85_M406","US85_M406","US85_M406"], ""],
		["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], ["CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5sigZl1a"], "CSLA_Sa58bnt"]
	];
	_rifles append [
		["US85_FAL", "", "", "",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], ""],
		["US85_FALf", "", "", "",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], ""],
		["US85_M14", "", "", "",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], ""],
		["US85_M16A1", "", "", "",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["US85_M16A2", "", "", "",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["CSLA_Sa58P", "", "", "",  ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], ""],
		["CSLA_Sa58V", "", "", "",  ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
	];
    _carbines append [
        ["US85_M16A2CAR", "", "", "",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
        ["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""],
		["US85_MPVSD", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""],
        ["CSLA_rSa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_10rnd_7_65Pi27"], [], ""],
		["CSLA_Sa24", "", "", "",  ["CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52"], [], ""],
		["CSLA_Sa26", "", "", "",  ["CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
    ];
    _tunedRifles append [
        ["US85_FAL", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
        ["US85_FALf", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
		["US85_M16A2CAR", "US85_M16tlm","US85_M16fl","US85_sc4x20_M16",["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
        ["US85_M16A1", "US85_M16tlm", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["US85_M16A2", "US85_M16tlm", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["CSLA_Sa58P", "","","CSLA_ZD4x8",["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
    ];
    _marksmanRifles append [
        ["CSLA_HuntingRifle","","","",["CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt", "CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt"], [], "gm_msg90_bipod_blk"],
        ["US85_M14","","","US85_scM21",["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_M14bpd"],
		["US85_M21","","","US85_scM21",["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_M14bpd"],
		["CSLA_OP63","","","CSLA_PSO1_OP63",["CSLA_OP63_10rnd_7_62Odst59","CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62Odst59","CSLA_OP63_10rnd_7_62PZ59"], [], ""]
    ];
    _enforcerRifles append [
        ["US85_FAL", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
        ["US85_FALf", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
		["US85_M16A2CAR", "","US85_M16fl","US85_sc4x20_M16",["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
        ["US85_M16A1", "", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["US85_M16A2", "", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["CSLA_Sa58P", "","","CSLA_ZD4x8",["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"],
		["CSLA_Sa58V", "", "", "",  ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
    ];
    _mgs append [
        ["US85_M249", "", "", "US85_sc4x20M249", ["US85_200Rnd_556x45","US85_200Rnd_556x45"], [], ""],
		["US85_M60", "", "", "", ["US85_100Rnd_762x51","US85_100Rnd_762x51"], [], ""],
        ["CSLA_UK59L", "", "", "CSLA_UK59_ZD4x8", ["CSLA_UK59_50rnd_7_62vz59","CSLA_UK59_50rnd_7_62Sv59","CSLA_UK59_50rnd_7_62PZ59","CSLA_UK59_50rnd_7_62Tz59","CSLA_UK59_50rnd_7_62TzSv59"], [], ""]
    ];
	_pistols append [
        ["US85_1911", "", "", "", ["US85_1911_7Rnd_045ACP","US85_1911_7Rnd_045ACP","US85_1911_7Rnd_045ACP"], [], ""],
        ["US85_M9", "", "", "", ["US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger"], [], ""],
        ["CSLA_Pi52", "", "", "", ["CSLA_Pi52_8rnd_7_62Pi52","CSLA_Pi52_8rnd_7_62Pi52","CSLA_Pi52_8rnd_7_62Pi52"], [], ""],
        ["CSLA_Pi75lr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger"], [], ""],
        ["CSLA_Pi75sr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger"], [], ""],
        ["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82","CSLA_Pi82_12rnd_9Pi82","CSLA_Pi82_12rnd_9Pi82"], [], ""],
        ["CSLA_Sa61", "", "", "", ["CSLA_Sa61_10rnd_7_65Pi27","CSLA_Sa61_10rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
    ];
};

_loadoutData set ["rifles", _rifles];
_loadoutData set ["tunedRifles", _tunedRifles];
_loadoutData set ["enforcerRifles", _enforcerRifles];
_loadoutData set ["carbines", _carbines];
_loadoutData set ["grenadeLaunchers", _gls];
_loadoutData set ["machineGuns", _mgs];
_loadoutData set ["marksmanRifles", _marksmanRifles];
_loadoutData set ["lightATLaunchers", _rpgs];
_loadoutData set ["sidearms", _pistols];


_loadoutData set ["facewear", [
	"G_Aviator",
	"G_Combat",
	"G_Bandanna_aviator",
	"G_Bandanna_beast",
	"G_Bandanna_sport",
	"G_Bandanna_shades",
	"G_Bandanna_blk"
]];

if (_hasGM) then {
    (_loadoutData get "facewear") append [
        "gm_ge_facewear_acidgoggles",
        "gm_ge_facewear_dustglasses",
        "gm_gc_army_facewear_dustglasses",
        "gm_ge_facewear_m65",
        "gm_gc_army_facewear_schm41m",
        "gm_ge_facewear_glacierglasses",
        "gm_xx_facewear_scarf_01_trp",
        "gm_xx_facewear_scarf_01_flk",
        "gm_xx_facewear_scarf_01_blk",
        "gm_xx_facewear_scarf_01_blu",
        "gm_xx_facewear_scarf_01_pt1",
        "gm_xx_facewear_scarf_01_pt3",
        "gm_xx_facewear_scarf_01_frog",
        "gm_xx_facewear_scarf_01_grn",
        "gm_xx_facewear_scarf_01_gry",
        "gm_xx_facewear_scarf_01_m84",
        "gm_xx_facewear_scarf_02_blk",
        "gm_xx_facewear_scarf_01_grn",
        "gm_xx_facewear_scarf_01_oli",
        "gm_xx_facewear_scarf_01_wht",
        "gm_xx_facewear_scarf_01_moro",
        "gm_xx_facewear_scarf_01_oli",
        "gm_xx_facewear_scarf_01_red",
        "gm_xx_facewear_scarf_01_pt2",
        "gm_xx_facewear_scarf_01_str",
        "gm_xx_facewear_scarf_01_wht",
        "gm_ge_facewear_sunglasses"
    ];
};

if (_hasRF) then {
    (_loadoutData get "facewear") append [
        "G_Bandanna_yellow_RF",
        "G_Glasses_black_RF",
        "G_Glasses_white_RF"
    ];
}; 

_loadoutData set ["fullmask", [	"G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_blk"]];

if (_hasGM) then {
    (_loadoutData get "fullmask") append [
        "gm_ge_facewear_stormhood_blk",
        "gm_ge_facewear_stormhood_dustglasses_blk",
        "gm_ge_facewear_stormhood_brd"
    ];
} ;

_loadoutData set ["headgear", [
    "H_Shemag_olive",
    "H_Booniehat_oli",
    "H_Beret_blk",
    "H_Cap_oli",
    "H_Cap_headphones",
	"H_Watchcap_camo",
	"H_Cap_blk_Raven",
	"H_Cap_oli_hs",
	"H_Booniehat_khk_hs",
	"H_Booniehat_dgtl"
]];

if (_hasGM) then {
	(_loadoutData get "headgear") append [
        "gm_ge_headgear_beret_crew_blk",
        "gm_xx_headgear_headwrap_crew_01_grn",
        "gm_ge_headgear_hat_beanie_crew_blk",
        "gm_gc_headgear_fjh_model4_oli",
        "gm_ge_headgear_m92_cover_glasses_oli",
        "gm_ge_headgear_m92_cover_oli"
    ];
}; ///look at this later

if (_hasCSLA) then {
	(_loadoutData get "headgear") append [
        "US85_beanie",
        "CSLA_beretM",
        "CSLA_beretR",
        "AFMC_booniehatLizard",
		"US85_hat",
		"FIA_hat85Gn",
		"FIA_hat85bGn",
		"FIA_hat85Mlok",
		"FIA_hat85bMlok",
		"FIA_capBk",
		"FIA_capGn",
		"FIA_capMlok",
		"CSLA_BudajkaBk",
		"CSLA_BudajkaGy",
		"FIA_Budajka"
    ];
}; ///look at this later

if (_hasContact) then {
	(_loadoutData get "headgear") append [
		"H_Booniehat_mgrn",
		"H_Booniehat_taiga", 
		"H_Booniehat_wdl", 
		"H_Booniehat_eaf", 
		"H_MilCap_grn", 
		"H_MilCap_taiga", 
		"H_MilCap_wdl", 
		"H_MilCap_eaf"
	];
}; ///look at this later

if (_hasWs) then {
	(_loadoutData get "headgear") pushBack "lxWS_H_Headset";
};

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["Rangefinder"]];

/////Vests
private _vests = ["V_Chestrig_oli", "V_TacChestrig_oli_F", "V_TacVest_oli", "V_HarnessOGL_brn", "V_HarnessO_brn"];

if (_hasApex) then {
	_vests append ["V_TacChestrig_cbr_F", "V_TacChestrig_grn_F", "V_TacChestrig_oli_F"];
};

if (_hasWs) then {
	_vests pushback "V_lxWS_HarnessO_oli";
};

if (_hasContact) then {
	_vests append ["V_SmershVest_01_F", "V_SmershVest_01_radio_F"];
};

if (_hasLawsOfWar) then {
	_vests append ["V_Pocketed_black_F", "V_Pocketed_coyote_F", "V_Pocketed_olive_F"];
};

if (_hasGM) then {
	_vests append [
	"gm_ge_vest_90_crew_flk", 
	"gm_ge_vest_90_demolition_flk", 
	"gm_ge_vest_90_leader_flk", 
	"gm_ge_vest_90_machinegunner_flk", 
	"gm_ge_vest_90_medic_flk", 
	"gm_ge_vest_90_officer_flk" ,
	"gm_ge_vest_90_rifleman_flk",
	"gm_gc_vest_combatvest3_str",
	"gm_gc_army_vest_80_at_str",
	"gm_gc_bgs_vest_80_border_str",
	"gm_ge_bgs_vest_80_rifleman",
	"gm_dk_army_vest_54_crew",
	"gm_ge_army_vest_80_demolition",
	"gm_ge_army_vest_80_leader",
	"gm_gc_army_vest_80_leader_str",
	"gm_ge_army_vest_80_leader_smg",
	"gm_ge_army_vest_80_machinegunner",
	"gm_gc_army_vest_80_lmg_str",
	"gm_dk_army_vest_54_machinegunner",
	"gm_ge_army_vest_80_medic",
	"gm_ge_army_vest_80_rifleman",
	"gm_gc_army_vest_80_rifleman_str",
	"gm_dk_army_vest_54_rifleman",
	"gm_ge_vest_sov_80_blk",
	"gm_ge_vest_sov_80_oli",
	"gm_ge_vest_sov_80_wdl",
	"gm_pl_army_vest_80_at_gry",
	"gm_pl_army_vest_80_leader_gry",
	"gm_pl_army_vest_80_mg_gry",
	"gm_pl_army_vest_80_rifleman_gry",
	"gm_pl_army_vest_80_rifleman_smg_gry"
	];
};

if (_hasCSLA) then {
	_vests append [
	"CSLA_gr60brr", 
	"CSLA_gr60base", 
	"CSLA_gr60drv", 
	"CSLA_gr60crw", 
	"CSLA_gr60svc", 
	"CSLA_gr60medic" ,
	"CSLA_gr60ofc1",
	"CSLA_gr60OP63",
	"CSLA_gr60rfl",
	"CSLA_gr60RPG7",
	"CSLA_gr60RPG7r",
	"CSLA_gr60sgt",
	"CSLA_gr85ptMdc",
	"CSLA_gr85ptOP63",
	"CSLA_gr85ptBase",
	"CSLA_gr85lrrOP63",
	"CSLA_gr85lrrBase",
	"CSLA_gr85ptSgt",
	"CSLA_gr85Uah61",
	"AFMC_grY_FAL",
	"US85_grY_M16",
	"US85_grY_M24",
	"US85_grY_M9",
	"AFMC_grY_MG",
	"FIA_grY_MG",
	"US85_grY_MG",
	"FIA_grY_MPV",
	"US85_grY_MPV",
	"US85_grY_snp"
	];
};

private _heavyVests = ["V_TacVestIR_blk", "V_Press_F", "V_PlateCarrierIAGL_oli", "V_PlateCarrierIAGL_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIA1_dgtl", "V_I_G_resistanceLeader_F", "V_TacVest_blk_POLICE","V_PlateCarrier1_blk","V_PlateCarrier2_blk"];

if (_hasApex) then {
	_heavyVests append ["V_TacVest_gen_F","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F"];
};

if (_hasWs) then {
	_heavyVests pushBack "V_lxWS_TacVestIR_oli";
};

if (_hasRF) then {
	_heavyVests append ["V_PlateCarrierLite_black_noFlag_RF","V_TacVest_rig_oli_RF","V_TacVest_rig_khk_RF","V_TacVest_rig_blk_RF"];
};

if (_hasContact) then {
	_heavyVests append ["V_CarrierRigKBT_01_EAF_F", "V_CarrierRigKBT_01_Olive_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_heavy_Olive_F"];
};

if (_hasJets) then {
	_heavyVests pushBack "V_DeckCrew_brown_F";
};

if (_hasGM) then {
	_heavyVests append [
	"gm_ge_army_vest_pilot_oli", 
	"gm_ge_vest_armor_90_flk", 
	"gm_ge_vest_armor_90_crew_flk",
	"gm_ge_vest_armor_90_demolition_flk",
	"gm_ge_vest_armor_90_leader_flk",
	"gm_ge_vest_armor_90_machinegunner_flk",
	"gm_ge_vest_armor_90_medic_flk",
	"gm_ge_vest_armor_90_officer_flk",
	"gm_ge_vest_armor_90_rifleman_flk",
	"gm_dk_army_vest_m00_m84",
	"gm_dk_army_vest_m00_wdl",
	"gm_dk_army_vest_m00_m84_machinegunner",
	"gm_dk_army_vest_m00_m84_rifleman",
	"gm_dk_army_vest_m00_wdl_rifleman",
	"gm_ge_vest_sov_armor_80_blk",
	"gm_ge_vest_sov_armor_80_oli",
	"gm_ge_vest_sov_armor_80_wdl",
	"gm_ge_army_vest_type18_dpm",
	"gm_ge_bgs_vest_type18_blk",
	"gm_ge_bgs_vest_type18_grn",
	"gm_ge_bgs_vest_type3_oli",
	"gm_ge_bgs_vest_type3_gry",
	"gm_ge_bgs_vest_type3a1_oli",
	"gm_ge_bgs_vest_type3a1_gry"
	];
};

if (_hasCSLA) then {
	_heavyVests append [
	"AFMC_grVest", 
	"AFMC_grV_M16", 
	"AFMC_grV_M24",
	"AFMC_grV_MG",
	"AFMC_grV_ofc",
	"US85_grVest",
	"US85_grV_M16GL",
	"US85_grVm_M16GL",
	"US85_grV_M16",
	"US85_grV_M24",
	"US85_grV_M9",
	"US85_grV_MG",
	"US85_grV_MPV",
	"US85_grV_ofc",
	"US85_grSF_M16GL",
	"US85_grSF_M9",
	"US85_grSF_MG",
	"US85_grSF_TLBV",
	"US85_grSF_M16",
	"US85_grSF_M24"
	];
};

/////Uniforms
_loadoutData set ["uniforms", [
	"U_BG_leader",
    "U_BG_Guerilla1_1",
	"U_BG_Guerrilla_6_1",
	"U_I_CombatUniform_shortsleeve",
	"U_I_CombatUniform",
	"U_I_GhillieSuit"
]];

if (_hasWs) then {
	(_loadoutData get "uniforms") append [
		"U_SFIA_deserter_lxWS",
		"U_lxWS_SFIA_pilot_O",
		"U_lxWS_SFIA_Tanker_O"
    ];
};

if (_hasLawsOfWar) then {
	(_loadoutData get "uniforms") append [
        "U_BG_Guerilla1_2_F"
    ];
};

if (_hasTanks) then {
	(_loadoutData get "uniforms") append [
        "U_Tank_green_F"
    ];
};

if (_hasRF) then {
	(_loadoutData get "uniforms") append [
        "U_BG_Guerrilla_RF",
        "U_BG_leader_RF"
    ];
};

if (_hasContact) then {
	(_loadoutData get "uniforms") append [
		"U_I_CBRN_Suit_01_AAF_F"
    ];
};

if (_hasGM) then {
	(_loadoutData get "uniforms") append [
        "gm_xx_uniform_soldier_bdu_80_oli",
        "gm_xx_uniform_soldier_bdu_nogloves_80_oli",
        "gm_xx_uniform_soldier_bdu_rolled_80_oli",
        "gm_dk_army_uniform_soldier_84_oli",
		"gm_ge_uniform_soldier_tshirt_90_oli"
    ];
};

if (_hasCSLA) then {
	(_loadoutData get "uniforms") append [
        "US85_uniKHK",
		"AFMC_uniSF",
		"AFMC_uniWLD"
    ];
};

_loadoutData set ["heavyUniforms", []]; ///don't know why it's here but could be useful in the future

if (_hasContact) then {
	(_loadoutData get "heavyUniforms") append [
        "U_O_R_Gorka_01_F",
        "U_O_R_Gorka_01_brown_F",
        "U_O_R_Gorka_01_camo_F"
    ];
};

if (_hasGM) then {
	(_loadoutData get "heavyUniforms") append [
        "gm_dk_army_uniform_soldier_84_oli"
    ];
};

/////Helmets
private _helmets = ["H_HelmetIA"];

if (_hasWs) then {
	_helmets append [
		"lxWS_H_ssh40_black",
		"lxWS_H_ssh40_green",
		"lxWS_H_bmask_base",
		"lxWS_H_bmask_camo01",
		"H_bmask_snake_lxws",
		"lxWS_H_bmask_white", 
		"lxWS_H_bmask_camo02", 
		"lxWS_H_bmask_yellow", 
		"lxWS_H_PASGT_goggles_black_F", 
		"lxWS_H_PASGT_goggles_olive_F", 
		"lxWS_H_HelmetCrew_I"
	];
};

if (_hasRF) then {
	_helmets append [
		"H_HelmetHeavy_Olive_RF",
		"H_HelmetHeavy_Simple_Olive_RF",
		"H_HelmetHeavy_VisorUp_Olive_RF",
		"H_HelmetHeavy_Black_RF", 
		"H_HelmetHeavy_Simple_Black_RF", 
		"H_HelmetHeavy_VisorUp_Black_RF",
		"H_HelmetIA_sb_digital_RF",
		"H_HelmetAggressor_sb_taiga_RF"
	];
};

if (_hasLawsOfWar) then {
	_helmets append ["H_PASGT_basic_black_F", "H_PASGT_basic_olive_F", "H_PASGT_neckprot_blue_press_F","H_HeadBandage_clean_F", "H_HeadBandage_stained_F", "H_HeadBandage_bloody_F"];
};

if (_hasContact) then {
	_helmets append ["H_HelmetAggressor_F", "H_HelmetAggressor_cover_F", "H_HelmetAggressor_cover_taiga_F","H_HelmetHBK_headset_F","H_HelmetHBK_chops_F","H_HelmetHBK_ear_F","H_HelmetHBK_F"];
};

if (_hasCSLA) then {
	_helmets append [
        "US85_helmetPASGT",
		"US85_helmetPASGTr",
		"US85_helmetPASGTG",
		"US85_helmetSFL",
		"US85_helmetSFLG",
		"US85_helmetSFLG_on"
	];
};

if (_hasGM) then {
	_helmets append [
        "gm_ge_headgear_psh77_oli",
        "gm_ge_headgear_psh77_up_oli",
        "gm_ge_headgear_psh77_down_oli"
    ]; 
};

private _crewhelmets = ["H_HelmetCrew_I"];

if (_hasWs) then {
	_crewhelmets append ["lxWS_H_Tank_tan_F", "lxWS_H_HelmetCrew_I"];
};

if (_hasContact) then {
	_crewhelmets append ["H_Tank_eaf_F", "H_HelmetCrew_I_E", "H_Booniehat_wdl", "H_Booniehat_eaf"];
};

if (_hasLawsOfWar) then {
	_crewhelmets pushBack "H_Construction_headset_black_F";
};

if (_hasGM) then {
	_crewhelmets pushBack "gm_ge_headgear_headset_crew_oli";
};

if (_hasCSLA) then {
	_crewhelmets append ["US85_helmetDH132", "US85_helmetDH132G", "US85_helmetDH132G_on"];
};

/////
private _offuniforms = ["U_I_OfficerUniform"];
private _backpacks = ["B_AssaultPack_dgtl","B_TacticalPack_oli", "B_Carryall_oli","B_Kitbag_sgg","B_FieldPack_oli"];

if (_hasApex) then {
	_backpacks append ["B_ViperHarness_oli_F","B_ViperLightHarness_oli_F"];
};

if (_hasArtOfWar) then {
	_backpacks append ["B_CivilianBackpack_01_Everyday_Black_F","B_CivilianBackpack_01_Everyday_Astra_F","B_CivilianBackpack_01_Everyday_Vrana_F","B_CivilianBackpack_01_Sport_Green_F","B_CivilianBackpack_01_Sport_Red_F","B_CivilianBackpack_01_Sport_Blue_F"];
};

if (_hasContact) then {
	_backpacks append ["B_FieldPack_green_F","B_RadioBag_01_digi_F","B_RadioBag_01_black_F","B_Carryall_green_F"];
};

if (_hasRF) then {
	_backpacks append ["B_DuffleBag_Olive_NoLogo_RF","B_DuffleBag_Black_NoLogo_RF","B_DuffleBag_Sand_RF","B_DuffleBag_Red_RF","B_DuffleBag_Olive_RF","B_DuffleBag_Blue_RF","B_DuffleBag_Black_RF","B_DuffleBag_VRANA_RF"];
};

if (_hasLawsOfWar) then {
	_backpacks append ["B_Messenger_Olive_F","B_Messenger_Black_F","B_LegStrapBag_olive_F","B_LegStrapBag_black_F"];
};

if (_hasGM) then {
	_backpacks append ["gm_dk_army_backpack_73_oli","gm_ge_army_backpack_90_blk","gm_ge_army_backpack_90_oli","gm_ge_army_backpack_80_oli","gm_ge_backpack_sem35_oli","gm_pl_army_backpack_at_80_gry"];
};

if (_hasCSLA) then {
	_backpacks append ["US85_bpSf","FIA_bpPack" ,"US85_bpAlice"];
};

_loadoutData set ["offuniforms", _offuniforms]; ///check offuniforms later 
_loadoutData set ["vests", _vests];
_loadoutData set ["heavyVests", _heavyVests];
_loadoutData set ["backpacks", _backpacks]; ///check for backpacks later
_loadoutData set ["helmets", _helmets];
_loadoutData set ["crewHelmets", _crewhelmets];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", _vests];
_crewLoadoutData set ["crewHelmets", _crewhelmets];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_I_HeliPilotCoveralls","U_I_pilotCoveralls"]];
_pilotLoadoutData set ["vests", _vests];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_I", "H_CrewHelmetHeli_I"]];

if (_hasRF) then {
	(_pilotLoadoutData get "uniforms") append [
        "U_C_PilotJacket_brown_RF",
        "U_C_PilotJacket_open_brown_RF",
        "U_C_PilotJacket_lbrown_RF",
        "U_C_PilotJacket_open_lbrown_RF",
        "U_C_PilotJacket_black_RF",
        "U_C_PilotJacket_open_black_RF",
        "U_C_HeliPilotCoveralls_Yellow_RF",
        "U_C_HeliPilotCoveralls_Green_RF",
        "U_C_HeliPilotCoveralls_Rescue_RF",
        "U_C_HeliPilotCoveralls_Blue_RF",
        "U_C_HeliPilotCoveralls_Black_RF"
    ];
};

if (_hasRF) then {
	(_pilotLoadoutData get "helmets") append [
        "H_PilotHelmetHeli_White_RF",
        "H_PilotHelmetHeli_Yellow_RF",
        "H_PilotHelmetHeli_Green_RF",
        "H_PilotHelmetHeli_Red_RF",
		"H_PilotHelmetHeli_MilGreen_RF",
		"H_PilotHelmetHeli_Orange_RF",
		"H_PilotHelmetHeli_Blue_RF",
		"H_PilotHelmetHeli_Black_RF"
    ];
};

// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	if (random 100 > 60) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
	["heavyVests"] call _fnc_setVest;
	[["heavyUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "tunedRifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["backpacks"] call _fnc_setBackpack;
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 3] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _minutemanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	["carbines"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_medic"] call _fnc_addItemSet;
	["items_medic_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _saboteurTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	[["heavyUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 2] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["heavyVests"] call _fnc_setVest;
	[["heavyUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_explosivesExpert_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["lightExplosives", 2] call _fnc_addItem;
	if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_at_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_aa_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _oppressorTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_machineGunner_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _sharpshooterTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	["marksmanRifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_marksman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _crewTemplate = {
	["crewHelmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "fullmask", 1.25, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["carbines"] call _fnc_setPrimary;
	["primary", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_crew_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _commanderTemplate = {
	[selectRandomWeighted ["helmets", 0.3, "headgear", 0.7]] call _fnc_setHelmet;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["vests"] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

///////////////////////
//  Rivals Units     //
///////////////////////
private _prefix = "militia";
private _unitTypes = [
	["CellLeader", _cellLeaderTemplate, [], [_prefix, true]],
	["Mercenary", _mercenaryTemplate, [], [_prefix, true]],
	["Minuteman", _minutemanTemplate, [], [_prefix, true]],
	["Enforcer", _enforcerTemplate, [], [_prefix, true]],
	["Partisan", _partisanTemplate, [], [_prefix, true]],
	["Saboteur", _saboteurTemplate, [], [_prefix, true]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix, true]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix, true]],
	["SpecialistAT", _atTemplate, [], [_prefix, true]],
	["SpecialistAA", _aaTemplate, [], [_prefix, true]],
	["Oppressor", _oppressorTemplate, [], [_prefix, true]],
	["Sharpshooter", _sharpshooterTemplate, [], [_prefix, true]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
