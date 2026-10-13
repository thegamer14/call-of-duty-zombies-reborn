CoD.LoadingNames = {}

CoD.LoadingNames.Maps = {
	["zm_la"] = { "MPUI_LA_CAPS", "MPUI_LA_LOC" },
	["zm_dockside"] = { "MPUI_DOCKSIDE_CAPS", "MPUI_DOCKSIDE_LOC" },
	["zm_carrier"] = { "MPUI_CARRIER_CAPS", "MPUI_CARRIER_LOC" },
	["zm_castaway"] = { "MPUI_CASTAWAY_CAPS", "MPUI_CASTAWAY_LOC" },
	["zm_bridge"] = { "MPUI_BRIDGE_CAPS", "MPUI_BRIDGE_LOC" },
	["zm_dig"] = { "MPUI_DIG_CAPS", "MPUI_DIG_LOC" },
	["zm_downhill"] = { "MPUI_DOWNHILL_CAPS", "MPUI_DOWNHILL_LOC" },
	["zm_drone"] = { "MPUI_DRONE_CAPS", "MPUI_DRONE_LOC" },
	["zm_concert"] = { "MPUI_CONCERT_CAPS", "MPUI_CONCERT_LOC" },
	["zm_express"] = { "MPUI_EXPRESS_CAPS", "MPUI_EXPRESS_LOC" },
	["zm_frostbite"] = { "MPUI_FROSTBITE_CAPS", "MPUI_FROSTBITE_LOC" },
	["zm_skate"] = { "MPUI_SKATE_CAPS", "MPUI_SKATE_LOC" },
	["zm_hijacked"] = { "MPUI_HIJACKED_CAPS", "MPUI_HIJACKED_LOC" },
	["zm_hydro"] = { "MPUI_HYDRO_CAPS", "MPUI_HYDRO_LOC" },
	["zm_magma"] = { "MPUI_MAGMA_CAPS", "MPUI_MAGMA_LOC" },
	["zm_meltdown"] = { "MPUI_MELTDOWN_CAPS", "MPUI_MELTDOWN_LOC" },
	["zm_mirage"] = { "MPUI_MIRAGE_CAPS", "MPUI_MIRAGE_LOC" },
	["zm_nuketown_2020"] = { "MPUI_NUKETOWN2025_CAPS", "MPUI_NUKETOWN2025_LOC" },
	["zm_overflow"] = { "MPUI_OVERFLOW_CAPS", "MPUI_OVERFLOW_LOC" },
	["zm_nightclub"] = { "MPUI_NIGHTCLUB_CAPS", "MPUI_NIGHTCLUB_LOC" },
	["zm_pod"] = { "MPUI_POD_CAPS", "MPUI_POD_LOC" },
	["zm_raid"] = { "MPUI_RAID_CAPS", "MPUI_RAID_LOC" },
	["zm_paintball"] = { "MPUI_PAINTBALL_CAPS", "MPUI_PAINTBALL_LOC" },
	["zm_slums"] = { "MPUI_SLUMS_CAPS", "MPUI_SLUMS_LOC" },
	["zm_village"] = { "MPUI_VILLAGE_CAPS", "MPUI_VILLAGE_LOC" },
	["zm_studio"] = { "MPUI_STUDIO_CAPS", "MPUI_STUDIO_LOC" },
	["zm_takeoff"] = { "MPUI_TAKEOFF_CAPS", "MPUI_TAKEOFF_LOC" },
	["zm_turbine"] = { "MPUI_TURBINE_CAPS", "MPUI_TURBINE_LOC" },
	["zm_uplink"] = { "MPUI_UPLINK_CAPS", "MPUI_UPLINK_LOC" },
	["zm_vertigo"] = { "MPUI_VERTIGO_CAPS", "MPUI_VERTIGO_LOC" },
	["zm_socotra"] = { "MPUI_SOCOTRA_CAPS", "MPUI_SOCOTRA_LOC" },
	["zm_transit"] = { "ZMUI_CLASSIC_CAPS", "ZMUI_TRANSIT_CAPS" },
	["zm_highrise"] = { "ZMUI_CLASSIC_ZM_HIGHRISE_CAPS", "ZMUI_HIGHRISE_CAPS" },
	["zm_prison"] = { "ZMUI_CLASSIC_ZM_PRISON_CAPS", "ZMUI_PRISON_LOC_CAPS" },
	["zm_buried"] = { "ZMUI_CLASSIC_ZM_BURIED_CAPS", "ZMUI_BURIED_CAPS" },
	["zm_tomb"] = { "ZMUI_CLASSIC_ZM_TOMB_CAPS", "ZMUI_TOMB_LOC_CAPS" },
	["zm_nuked"] = { "ZMUI_NUKED_STARTLOC_CAPS", "ZMUI_NUKED_CAPS" },
}

CoD.LoadingNames.Apply = function ( LoadingWidget )
	local map = Dvar.ui_mapname:get()
	local keys = CoD.LoadingNames.Maps[map]

	if keys == nil then
		return
	end

	local name = Engine.Localize( keys[1] )
	local place = Engine.Localize( keys[2] )

	if name ~= nil and name ~= "" and name ~= keys[1] then
		LoadingWidget.mapNameLabel:setText( name )
	end
	if place ~= nil and place ~= "" and place ~= keys[2] then
		LoadingWidget.mapLocationLabel:setText( place )
	end
end

if CoD.Loading ~= nil and CoD.Loading.StartLoading ~= nil then
	CoD.LoadingNames.StockStartLoading = CoD.Loading.StartLoading

	CoD.Loading.StartLoading = function ( LoadingWidget, f8_arg1 )
		CoD.LoadingNames.StockStartLoading( LoadingWidget, f8_arg1 )
		CoD.LoadingNames.Apply( LoadingWidget )
	end
end
