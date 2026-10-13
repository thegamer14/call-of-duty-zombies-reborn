require( "T6.Lobby" )
require( "T6.ListBox" )

CoD.QuickLaunch = {}

CoD.QuickLaunch.Classic = {
	{ map = "zm_transit", loc = "transit", nameKey = "ZMUI_CLASSIC_CAPS", titleKey = "ZMUI_TRANSIT_CAPS", placeKey = "ZMUI_TRANSIT_LOC", startKey = "ZMUI_TRANSIT_STARTLOC_CAPS", descKey = "ZMUI_CLASSIC_DESC_TRANSIT", },
	{ map = "zm_highrise", loc = "rooftop", nameKey = "ZMUI_CLASSIC_ZM_HIGHRISE_CAPS", titleKey = "ZMUI_HIGHRISE_CAPS", placeKey = "ZMUI_HIGHRISE_LOC", startKey = "ZMUI_HIGHRISE_STARTLOC_CAPS", descKey = "ZMUI_CLASSIC_DESC_ROOFTOP", },
	{ map = "zm_prison", loc = "prison", nameKey = "ZMUI_CLASSIC_ZM_PRISON_CAPS", titleKey = "ZMUI_PRISON_CAPS", placeKey = "ZMUI_PRISON_LOC_CAPS", startKey = "ZMUI_CELLBLOCK_CAPS", descKey = "ZMUI_CLASSIC_DESC_PRISON", },
	{ map = "zm_buried", loc = "processing", nameKey = "ZMUI_CLASSIC_ZM_BURIED_CAPS", titleKey = "ZMUI_BURIED_CAPS", placeKey = "ZMUI_BURIED_LOC_CAPS", startKey = "MPUI_PROCESSING", descKey = "ZMUI_CLASSIC_DESC_PROCESSING", },
	{ map = "zm_tomb", loc = "tomb", nameKey = "ZMUI_CLASSIC_ZM_TOMB_CAPS", titleKey = "ZMUI_TOMB_CAPS", placeKey = "ZMUI_TOMB_LOC_CAPS", startKey = "ZMUI_TOMB_CAPS", descKey = "ZMUI_CLASSIC_DESC_TOMB", },
}

CoD.QuickLaunch.Survival = {
	{ map = "zm_transit", loc = "transit", nameKey = "ZMUI_CLASSIC_CAPS", titleKey = "ZMUI_TRANSIT_CAPS", placeKey = "ZMUI_TRANSIT_LOC", startKey = "ZMUI_TRANSIT_STARTLOC_CAPS", descKey = "ZMUI_CLASSIC_DESC_TRANSIT", },
	{ map = "zm_transit", loc = "farm", nameKey = "ZMUI_CLASSIC_CAPS", titleKey = "ZMUI_TRANSIT_CAPS", placeKey = "ZMUI_TRANSIT_LOC", startKey = "ZMUI_FARM_CAPS", descKey = "ZMUI_CLASSIC_DESC_TRANSIT", },
	{ map = "zm_transit", loc = "town", nameKey = "ZMUI_CLASSIC_CAPS", titleKey = "ZMUI_TRANSIT_CAPS", placeKey = "ZMUI_TRANSIT_LOC", startKey = "ZMUI_TOWN_CAPS", descKey = "ZMUI_CLASSIC_DESC_TRANSIT", },
	{ map = "zm_nuked", loc = "nuked", nameKey = "ZMUI_NUKED_STARTLOC_CAPS", startKey = "ZMUI_NUKED_STARTLOC_CAPS", titleKey = "ZMUI_NUKED_LOC", placeKey = "ZMUI_NUKED_CAPS", descKey = "ZMUI_DESC_MAP_NUKED", },
}

CoD.QuickLaunch.Usermaps = {
	{ map = "zm_la", loc = "la", nameKey = "MPUI_LA_CAPS", startKey = "MPUI_LA_CAPS", placeKey = "MPUI_LA_LOC", descKey = "MPUI_DESC_MAP_LA", },
	{ map = "zm_dockside", loc = "dockside", nameKey = "MPUI_DOCKSIDE_CAPS", startKey = "MPUI_DOCKSIDE_CAPS", placeKey = "MPUI_DOCKSIDE_LOC", descKey = "MPUI_DESC_MAP_DOCKSIDE", },
	{ map = "zm_carrier", loc = "carrier", nameKey = "MPUI_CARRIER_CAPS", startKey = "MPUI_CARRIER_CAPS", placeKey = "MPUI_CARRIER_LOC", descKey = "MPUI_DESC_MAP_CARRIER", },
	{ map = "zm_castaway", loc = "castaway", nameKey = "MPUI_CASTAWAY_CAPS", startKey = "MPUI_CASTAWAY_CAPS", placeKey = "MPUI_CASTAWAY_LOC", descKey = "MPUI_DESC_MAP_CASTAWAY", },
	{ map = "zm_bridge", loc = "bridge", nameKey = "MPUI_BRIDGE_CAPS", startKey = "MPUI_BRIDGE_CAPS", placeKey = "MPUI_BRIDGE_LOC", descKey = "MPUI_DESC_MAP_BRIDGE", },
	{ map = "zm_dig", loc = "dig", nameKey = "MPUI_DIG_CAPS", startKey = "MPUI_DIG_CAPS", placeKey = "MPUI_DIG_LOC", descKey = "MPUI_DESC_MAP_DIG", },
	{ map = "zm_downhill", loc = "downhill", nameKey = "MPUI_DOWNHILL_CAPS", startKey = "MPUI_DOWNHILL_CAPS", placeKey = "MPUI_DOWNHILL_LOC", descKey = "MPUI_DESC_MAP_DOWNHILL", },
	{ map = "zm_drone", loc = "drone", nameKey = "MPUI_DRONE_CAPS", startKey = "MPUI_DRONE_CAPS", placeKey = "MPUI_DRONE_LOC", descKey = "MPUI_DESC_MAP_DRONE", },
	{ map = "zm_concert", loc = "concert", nameKey = "MPUI_CONCERT_CAPS", startKey = "MPUI_CONCERT_CAPS", placeKey = "MPUI_CONCERT_LOC", descKey = "MPUI_DESC_MAP_CONCERT", },
	{ map = "zm_express", loc = "express", nameKey = "MPUI_EXPRESS_CAPS", startKey = "MPUI_EXPRESS_CAPS", placeKey = "MPUI_EXPRESS_LOC", descKey = "MPUI_DESC_MAP_EXPRESS", },
	{ map = "zm_frostbite", loc = "frostbite", nameKey = "MPUI_FROSTBITE_CAPS", startKey = "MPUI_FROSTBITE_CAPS", placeKey = "MPUI_FROSTBITE_LOC", descKey = "MPUI_DESC_MAP_FROSTBITE", },
	{ map = "zm_skate", loc = "skate", nameKey = "MPUI_SKATE_CAPS", startKey = "MPUI_SKATE_CAPS", placeKey = "MPUI_SKATE_LOC", descKey = "MPUI_DESC_MAP_SKATE", },
	{ map = "zm_hijacked", loc = "hijacked", nameKey = "MPUI_HIJACKED_CAPS", startKey = "MPUI_HIJACKED_CAPS", placeKey = "MPUI_HIJACKED_LOC", descKey = "MPUI_DESC_MAP_HIJACKED", },
	{ map = "zm_hydro", loc = "hydro", nameKey = "MPUI_HYDRO_CAPS", startKey = "MPUI_HYDRO_CAPS", placeKey = "MPUI_HYDRO_LOC", descKey = "MPUI_DESC_MAP_HYDRO", },
	{ map = "zm_magma", loc = "magma", nameKey = "MPUI_MAGMA_CAPS", startKey = "MPUI_MAGMA_CAPS", placeKey = "MPUI_MAGMA_LOC", descKey = "MPUI_DESC_MAP_MAGMA", },
	{ map = "zm_meltdown", loc = "meltdown", nameKey = "MPUI_MELTDOWN_CAPS", startKey = "MPUI_MELTDOWN_CAPS", placeKey = "MPUI_MELTDOWN_LOC", descKey = "MPUI_DESC_MAP_MELTDOWN", },
	{ map = "zm_mirage", loc = "mirage", nameKey = "MPUI_MIRAGE_CAPS", startKey = "MPUI_MIRAGE_CAPS", placeKey = "MPUI_MIRAGE_LOC", descKey = "MPUI_DESC_MAP_MIRAGE", },
	{ map = "zm_nuketown_2020", loc = "nuketown_2020", nameKey = "MPUI_NUKETOWN2025_CAPS", startKey = "MPUI_NUKETOWN2025_CAPS", placeKey = "MPUI_NUKETOWN2025_LOC", descKey = "MPUI_DESC_MAP_NUKETOWN2025", },
	{ map = "zm_overflow", loc = "overflow", nameKey = "MPUI_OVERFLOW_CAPS", startKey = "MPUI_OVERFLOW_CAPS", placeKey = "MPUI_OVERFLOW_LOC", descKey = "MPUI_DESC_MAP_OVERFLOW", },
	{ map = "zm_nightclub", loc = "nightclub", nameKey = "MPUI_NIGHTCLUB_CAPS", startKey = "MPUI_NIGHTCLUB_CAPS", placeKey = "MPUI_NIGHTCLUB_LOC", descKey = "MPUI_DESC_MAP_NIGHTCLUB", },
	{ map = "zm_pod", loc = "pod", nameKey = "MPUI_POD_CAPS", startKey = "MPUI_POD_CAPS", placeKey = "MPUI_POD_LOC", descKey = "MPUI_DESC_MAP_POD", },
	{ map = "zm_raid", loc = "raid", nameKey = "MPUI_RAID_CAPS", startKey = "MPUI_RAID_CAPS", placeKey = "MPUI_RAID_LOC", descKey = "MPUI_DESC_MAP_RAID", },
	{ map = "zm_paintball", loc = "paintball", nameKey = "MPUI_PAINTBALL_CAPS", startKey = "MPUI_PAINTBALL_CAPS", placeKey = "MPUI_PAINTBALL_LOC", descKey = "MPUI_DESC_MAP_PAINTBALL", },
	{ map = "zm_slums", loc = "slums", nameKey = "MPUI_SLUMS_CAPS", startKey = "MPUI_SLUMS_CAPS", placeKey = "MPUI_SLUMS_LOC", descKey = "MPUI_DESC_MAP_SLUMS", },
	{ map = "zm_village", loc = "village", nameKey = "MPUI_VILLAGE_CAPS", startKey = "MPUI_VILLAGE_CAPS", placeKey = "MPUI_VILLAGE_LOC", descKey = "MPUI_DESC_MAP_VILLAGE", },
	{ map = "zm_studio", loc = "studio", nameKey = "MPUI_STUDIO_CAPS", startKey = "MPUI_STUDIO_CAPS", placeKey = "MPUI_STUDIO_LOC", descKey = "MPUI_DESC_MAP_STUDIO", },
	{ map = "zm_takeoff", loc = "takeoff", nameKey = "MPUI_TAKEOFF_CAPS", startKey = "MPUI_TAKEOFF_CAPS", placeKey = "MPUI_TAKEOFF_LOC", descKey = "MPUI_DESC_MAP_TAKEOFF", },
	{ map = "zm_turbine", loc = "turbine", nameKey = "MPUI_TURBINE_CAPS", startKey = "MPUI_TURBINE_CAPS", placeKey = "MPUI_TURBINE_LOC", descKey = "MPUI_DESC_MAP_TURBINE", },
	{ map = "zm_uplink", loc = "uplink", nameKey = "MPUI_UPLINK_CAPS", startKey = "MPUI_UPLINK_CAPS", placeKey = "MPUI_UPLINK_LOC", descKey = "MPUI_DESC_MAP_UPLINK", },
	{ map = "zm_vertigo", loc = "vertigo", nameKey = "MPUI_VERTIGO_CAPS", startKey = "MPUI_VERTIGO_CAPS", placeKey = "MPUI_VERTIGO_LOC", descKey = "MPUI_DESC_MAP_VERTIGO", },
	{ map = "zm_socotra", loc = "socotra", nameKey = "MPUI_SOCOTRA_CAPS", startKey = "MPUI_SOCOTRA_CAPS", placeKey = "MPUI_SOCOTRA_LOC", descKey = "MPUI_DESC_MAP_SOCOTRA", },
}

CoD.QuickLaunch.UsermapNames = {}
for i = 1, #CoD.QuickLaunch.Usermaps do
	CoD.QuickLaunch.UsermapNames[CoD.QuickLaunch.Usermaps[i].map] = true
end

CoD.QuickLaunch.MapPaks = {
	zm_nuked = "dlczm0",
	zm_highrise = "dlc1",
	zm_prison = "dlc2",
	zm_buried = "dlc3",
	zm_tomb = "dlc4",
}

CoD.QuickLaunch.PakNames = {
	dlczm0 = "Nuketown Zombies",
	dlc1 = "Revolution",
	dlc2 = "Uprising",
	dlc3 = "Vengeance",
	dlc4 = "Apocalypse",
}

CoD.QuickLaunch.PakCache = {}
CoD.QuickLaunch.PakAvailable = function ( pak )
	local cached = CoD.QuickLaunch.PakCache[pak]
	if cached ~= nil then
		return cached.value
	end

	local ok, value = pcall( Engine.IsContentAvailableByPakName, pak )
	if not ok then
		value = nil
	end
	CoD.QuickLaunch.PakCache[pak] = { value = value }
	return value
end
CoD.QuickLaunch.MissingDlcOf = function ( entry )
	local pak = CoD.QuickLaunch.MapPaks[entry.map]
	if pak ~= nil and CoD.QuickLaunch.PakAvailable( pak ) == false then
		return CoD.QuickLaunch.PakNames[pak]
	end
	return nil
end

CoD.QuickLaunch.RequiresOf = function ( entry )
	local pak = CoD.QuickLaunch.MapPaks[entry.map]
	if pak == nil then
		return "", false
	end

	local missing = CoD.QuickLaunch.MissingDlcOf( entry )
	if missing ~= nil then
		return "Missing DLC (" .. missing .. ")", true
	end
	return CoD.QuickLaunch.PakNames[pak] .. " DLC", false
end

CoD.QuickLaunch.UsermapsInSurvivalMenu = true

CoD.QuickLaunch.ListRows = 15
CoD.QuickLaunch.ListWidth = 420
CoD.QuickLaunch.PaneLeft = 470
CoD.QuickLaunch.ContentTop = 75

CoD.QuickLaunch.Stock = {
	zm_transit = true,
	zm_highrise = true,
	zm_prison = true,
	zm_buried = true,
	zm_tomb = true,
	zm_nuked = true,
}

CoD.QuickLaunch.PreviewMaterial = function ( map, gametype, group, location )
	if CoD.QuickLaunch.Stock[map] == true then
		return "menu_zm_" .. string.sub( map, 4 ) .. "_" .. group .. "_" .. location
	end

	return "loadscreen_" .. map .. "_" .. gametype .. "_" .. location
end

-- The launch options a usermap reads - the special enemies and der wunderfizz. Each is a dvar the
-- map scripts read at level start, so they go in the launch command ahead of the map.
CoD.QuickLaunch.OnOff = {
	{ label = "OFF", value = 0 },
	{ label = "ON", value = 1 },
}

CoD.QuickLaunch.Range = function ( first, last, step )
	local choices = {}
	for value = first, last, step do
		choices[#choices + 1] = { label = tostring( value ), value = value }
	end
	return choices
end

CoD.QuickLaunch.Options = {
	{ label = "PERK LIMIT", dvar = "zm_mp_map_perk_limit", default = 4, choices = CoD.QuickLaunch.Range( 1, 11, 1 ), hint = "How many perks der wunderfizz will sell you." },
	{ label = "WUNDERFIZZ COST", dvar = "zm_mp_map_fizz_cost", default = 1500, choices = CoD.QuickLaunch.Range( 500, 10000, 500 ), hint = "The price of a der wunderfizz perk." },
	{ label = "DOGS", dvar = "zm_mp_map_dogs", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "Hellhound rounds." },
	{ label = "LEAPERS", dvar = "zm_mp_map_leapers", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "Jumping jack rounds, as on Die Rise." },
	{ label = "GHOSTS", dvar = "zm_mp_map_ghosts", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "Ghost rounds, as on Buried." },
	{ label = "SPACE MONKEYS", dvar = "zm_mp_map_monkeys", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "Space monkey rounds, as on Ascension." },
	{ label = "PENTAGON THIEF", dvar = "zm_mp_map_thief", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "Pentagon thief rounds, as on Five." },
	{ label = "BRUTUS", dvar = "zm_mp_map_brutus", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "Brutus, as on Mob of the Dead." },
	{ label = "PANZER", dvar = "zm_mp_map_panzer", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "The Panzer Soldat, as on Origins." },
	{ label = "AVOGADRO", dvar = "zm_mp_map_avogadro", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "The Avogadro, as on Tranzit." },
	{ label = "NAPALM ZOMBIE", dvar = "zm_mp_map_napalm", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "The napalm zombie, as on Shangri-La." },
	{ label = "SHRIEKER", dvar = "zm_mp_map_shrieker", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "The shrieker zombie, as on Shangri-La." },
	{ label = "ASTRONAUT", dvar = "zm_mp_map_astronaut", default = 0, choices = CoD.QuickLaunch.OnOff, hint = "The astronaut zombie, as on Moon." },
}

-- Kept for the session, so the next map starts from the last choices.
CoD.QuickLaunch.OptionValues = {}

CoD.QuickLaunch.OptionValue = function ( option )
	local value = CoD.QuickLaunch.OptionValues[option.dvar]
	if value == nil then
		value = option.default
	end
	return value
end

CoD.QuickLaunch.OptionsCommand = function ()
	local command = ""
	for i = 1, #CoD.QuickLaunch.Options do
		local option = CoD.QuickLaunch.Options[i]
		command = command .. "set " .. option.dvar .. " " .. tostring( CoD.QuickLaunch.OptionValue( option ) ) .. ";"
	end
	return command
end

CoD.QuickLaunch.LaunchSolo = function ( controller, gametype, group, entry, labelField )
	Dvar.party_maxplayers:set( 1 )

	local command = "set g_gametype " .. gametype
		.. ";set ui_gametype " .. gametype
		.. ";set ui_zm_gamemodegroup " .. group
		.. ";set ui_zm_mapstartlocation " .. entry.loc
		.. ";map " .. entry.map

	if CoD.QuickLaunch.UsermapNames[entry.map] == true then
		command = CoD.QuickLaunch.OptionsCommand() .. command
	end

	CoD.QuickLaunch.Remember( controller, entry, gametype, group )
	Engine.Exec( controller, command )
end

CoD.QuickLaunch.LaunchParty = function ( menu, controller, gametype, group, entry, labelField )
	CoD.SwitchToPrivateLobby( controller )
	Engine.SetDvar( "ui_zm_gamemodegroup", group )
	Engine.SetGametype( gametype )
	Engine.SetDvar( "ui_gametype_pro", 0 )
	Engine.SetDvar( "ui_mapname", entry.map )
	Engine.SetDvar( "ui_zm_mapstartlocation", entry.loc )

	if CoD.QuickLaunch.UsermapNames[entry.map] == true then
		Engine.Exec( controller, CoD.QuickLaunch.OptionsCommand() )
	end

	Engine.Exec( controller, "xupdatepartystate" )
	Engine.PartyHostClearUIState()

	CoD.QuickLaunch.Remember( controller, entry, gametype, group )
	CoD.QuickLaunch.Say( controller, "launching " .. entry.map .. " ismapvalid " .. tostring( Engine.IsMapValid( entry.map ) ) )

	menu:swapMenu( "PrivateOnlineGameLobby", controller )
end

CoD.QuickLaunch.Say = function ( controller, text )
	pcall( print, "mod_to_launch_mp_maps_in_zombies: " .. text )
end

CoD.QuickLaunch.Dstr = function ( name )
	local ok, value = pcall( function ()
		return Dvar[name]:get()
	end )
	if ok and value ~= nil then
		return value
	end
	return ""
end

CoD.QuickLaunch.Remember = function ( controller, entry, gametype, group )
	CoD.QuickLaunch.Pending = {
		map = entry.map,
		loc = entry.loc,
		gametype = gametype,
		group = group,
	}
	Engine.SetDvar( "zl_map", entry.map )
	Engine.SetDvar( "zl_loc", entry.loc )
	Engine.SetDvar( "zl_gt", gametype )
	Engine.SetDvar( "zl_group", group )
end

CoD.QuickLaunch.Forget = function ( controller, why )
	CoD.QuickLaunch.Pending = nil
	Engine.SetDvar( "zl_map", "" )
	Engine.SetDvar( "zl_loc", "" )
	Engine.SetDvar( "zl_gt", "" )
	Engine.SetDvar( "zl_group", "" )
	CoD.QuickLaunch.Say( controller, "forget record: " .. why )
end

CoD.QuickLaunch.ModeOf = function ( userData )
	if userData ~= nil and userData.mode == "party" then
		return "party"
	end
	return "solo"
end

CoD.QuickLaunch.PaneWidth = 700
CoD.QuickLaunch.RowGap = 6

CoD.QuickLaunch.WrapWidth = 420

CoD.QuickLaunch.InfoRows = {
	{ "MAP TITLE:", "title", 1 },
	{ "LOCATION:", "place", 1 },
	{ "STARTING LOCATION:", "start", 1 },
	{ "DESCRIPTION:", "desc", 3 },
	{ "", "", 1 },
	{ "CONSOLE NAME:", "map", 1 },
	{ "CONSOLE STARTING LOCATION:", "loc", 1 },
	{ "REQUIRES:", "requires", 1 },
}

CoD.QuickLaunch.InfoRowsSurvival = {
	{ "MAP TITLE:", "title", 1 },
	{ "LOCATION:", "place", 1 },
	{ "MAIN MAP:", "name", 1 },
	{ "DESCRIPTION:", "desc", 3 },
	{ "", "", 1 },
	{ "CONSOLE NAME:", "map", 1 },
	{ "CONSOLE STARTING LOCATION:", "loc", 1 },
	{ "REQUIRES:", "requires", 1 },
}

CoD.QuickLaunch.FieldOf = function ( entry, field )
	if field == "" then
		return ""
	end

	local key = entry[field .. "Key"]

	if key ~= nil then
		local localized = Engine.Localize( key )

		if localized ~= nil and localized ~= "" and localized ~= key then
			return localized
		end
	end

	local value = entry[field]
	if value == nil then
		return ""
	end
	return value
end

CoD.QuickLaunch.WrapText = function ( text, font, height, width, maxLines )
	local lines = {}
	local current = ""

	for word in string.gmatch( text, "%S+" ) do
		local candidate = word
		if current ~= "" then
			candidate = current .. " " .. word
		end

		local left, top, right, bottom = GetTextDimensions( candidate, font, height )

		if right > width and current ~= "" then
			lines[#lines + 1] = current
			if #lines >= maxLines then
				return lines
			end
			current = word
		else
			current = candidate
		end
	end

	if current ~= "" then
		lines[#lines + 1] = current
	end
	return lines
end

CoD.QuickLaunch.LabelOf = function ( entry, field )
	local value = CoD.QuickLaunch.FieldOf( entry, field )
	if value == "" then
		value = CoD.QuickLaunch.FieldOf( entry, "name" )
	end
	return value
end

CoD.QuickLaunch.NewPreviewPane = function ( rows )
	local self = LUI.UIElement.new()
	local imageWidth = CoD.QuickLaunch.ListWidth
	local imageHeight = imageWidth * 9 / 16
	local width = CoD.QuickLaunch.PaneWidth

	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, 0, imageWidth )
	image:setTopBottom( true, false, 0, imageHeight )
	self:addElement( image )
	self.image = image

	local top = imageHeight + 12

	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, width )
	title:setTopBottom( true, false, top, top + CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	title:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	title:setAlignment( LUI.Alignment.Left )
	self:addElement( title )
	self.title = title

	top = top + CoD.textSize.Big + 12

	local lineHeight = CoD.textSize.ExtraSmall + CoD.QuickLaunch.RowGap
	self.rowDefs = rows
	self.rows = {}

	local newLine = function ( x, y )
		local element = LUI.UIText.new()
		element:setLeftRight( true, false, x, width )
		element:setTopBottom( true, false, y, y + CoD.textSize.ExtraSmall )
		element:setFont( CoD.fonts.ExtraSmall )
		element:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
		element:setAlignment( LUI.Alignment.Left )
		self:addElement( element )
		return element
	end

	for i = 1, #rows do
		local text = rows[i][1]
		local count = rows[i][3]
		local row = { values = {} }
		local indent = 0

		if text ~= "" then
			local label = LUI.UIText.new()
			label:setLeftRight( true, false, 0, width )
			label:setTopBottom( true, false, top, top + CoD.textSize.ExtraSmall )
			label:setFont( CoD.fonts.ExtraSmall )
			label:setRGB( CoD.yellow.r, CoD.yellow.g, CoD.yellow.b )
			label:setText( text )
			label:setAlignment( LUI.Alignment.Left )
			self:addElement( label )
			row.label = label

			local textLeft, textTop, textRight, textBottom = GetTextDimensions( text, CoD.fonts.ExtraSmall, CoD.textSize.ExtraSmall )
			indent = textRight + 8
		end

		if count > 1 then

			for line = 1, count do
				local element = newLine( 0, top + line * lineHeight )
				element:setLeftRight( true, false, 0, CoD.QuickLaunch.WrapWidth )
				row.values[line] = element
			end
			top = top + ( count + 1 ) * lineHeight
		else
			row.values[1] = newLine( indent, top )
			top = top + lineHeight
		end

		self.rows[i] = row
	end

	return self
end

CoD.QuickLaunch.ShowPreview = function ( pane, entry, gametype, group )
	if entry == nil then
		return
	end

	local material = CoD.QuickLaunch.PreviewMaterial( entry.map, gametype, group, entry.loc )

	if material ~= nil then
		pane.image:setImage( RegisterMaterial( material ) )
		pane.image:setAlpha( 1 )
	else

		pane.image:setAlpha( 0 )
	end

	pane.title:setText( CoD.QuickLaunch.LabelOf( entry, pane.labelField ) )

	local missing
	entry.requires, missing = CoD.QuickLaunch.RequiresOf( entry )

	for i = 1, #pane.rowDefs do
		local field = pane.rowDefs[i][2]
		local count = pane.rowDefs[i][3]
		local value = CoD.QuickLaunch.FieldOf( entry, field )
		local row = pane.rows[i]

		local lines = { value }
		if count > 1 and value ~= "" then
			lines = CoD.QuickLaunch.WrapText( value, CoD.fonts.ExtraSmall, CoD.textSize.ExtraSmall, CoD.QuickLaunch.WrapWidth, count )
		end

		for line = 1, count do
			local text = lines[line]
			if text == nil then
				text = ""
			end
			row.values[line]:setText( text )
			row.values[line]:setAlpha( text ~= "" and 1 or 0 )
			if field == "requires" then
				if missing then
					row.values[line]:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
				else
					row.values[line]:setRGB( CoD.green.r, CoD.green.g, CoD.green.b )
				end
			end
		end

		if row.label ~= nil then
			row.label:setAlpha( value ~= "" and 1 or 0 )
		end
	end
end

CoD.QuickLaunch.NewMapPage = function ( name, title, entries, gametype, group, controller, userData, rows, labelField )
	local mode = CoD.QuickLaunch.ModeOf( userData )
	rows = rows or CoD.QuickLaunch.InfoRows
	labelField = labelField or "name"
	local menu = CoD.Menu.New( name )
	menu.controller = controller
	menu.anyControllerAllowed = true
	menu:setPreviousMenu( "QuickLaunch", {
		mode = mode
	} )
	menu:addSelectButton()
	menu:addBackButton()
	menu:addTitle( title )
	menu:registerEventHandler( "open_menu", CoD.Lobby.OpenMenu )
	menu:registerEventHandler( "button_prompt_back", CoD.Menu.ButtonPromptBack )

	local pane = CoD.QuickLaunch.NewPreviewPane( rows )
	pane:setLeftRight( true, false, CoD.QuickLaunch.PaneLeft, CoD.QuickLaunch.PaneLeft + CoD.QuickLaunch.PaneWidth )
	pane:setTopBottom( true, false, CoD.QuickLaunch.ContentTop, CoD.QuickLaunch.ContentTop + 400 )
	menu:addElement( pane )
	pane.labelField = labelField
	menu.previewPane = pane

	local createMutables = function ( rowController, mutables )
		local text = LUI.UIText.new()
		text:setLeftRight( true, false, 0, 0 )
		text:setTopBottom( true, true, 0, 0 )
		text:setRGB( 1, 1, 1 )
		text:setAlpha( 1 )
		mutables:addElement( text )
		mutables.text = text
	end

	local getData = function ( rowController, index, mutables )
		local entry = entries[index]
		if entry ~= nil then
			local label = CoD.QuickLaunch.LabelOf( entry, labelField )
			local missing = CoD.QuickLaunch.MissingDlcOf( entry )
			if missing ~= nil then
				mutables.text:setText( label .. "  Missing DLC (" .. missing .. ")" )
				mutables.text:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
			else
				mutables.text:setText( label )
				mutables.text:setRGB( 1, 1, 1 )
			end
		else
			mutables.text:setText( "" )
		end
	end

	local rows = CoD.QuickLaunch.ListRows
	if #entries < rows then
		rows = #entries
	end

	local listBox = CoD.ListBox.new( nil, controller, rows, CoD.CoD9Button.Height, CoD.QuickLaunch.ListWidth, createMutables, getData, 0, 0 )
	listBox:setLeftRight( true, false, 0, CoD.QuickLaunch.ListWidth )
	listBox:setTopBottom( true, false, CoD.QuickLaunch.ContentTop, CoD.QuickLaunch.ContentTop + rows * CoD.CoD9Button.Height )
	if #entries > rows then
		listBox:addScrollBar( rows * CoD.CoD9Button.Height, 2 )
	end
	menu:addElement( listBox )
	menu.listBox = listBox

	menu:registerEventHandler( "listbox_focus_changed", function ( handlerMenu, event ) CoD.QuickLaunch.ShowPreview( handlerMenu.previewPane, entries[handlerMenu.listBox:getFocussedIndex()], gametype, group ) end )

	menu:registerEventHandler( "click", function ( handlerMenu, event ) local entry = entries[handlerMenu.listBox:getFocussedIndex()] if entry == nil then return end local pickedController = event.controller or handlerMenu.controller CoD.QuickLaunch.LaunchParty( handlerMenu, pickedController, gametype, group, entry, labelField ) end )

	listBox:setTotalItems( #entries )
	listBox:refresh()

	CoD.QuickLaunch.ShowPreview( pane, entries[1], gametype, group )

	return menu
end

CoD.QuickLaunch.OpenOptions = function ( menu, controller, pageName, mode, gametype, group, entry, labelField )
	menu:openMenu( "QuickLaunchOptions", controller, {
		parent = pageName,
		mode = mode,
		gametype = gametype,
		group = group,
		entry = entry,
		labelField = labelField,
	} )
	menu:close()
	Engine.PlaySound( "cac_screen_fade" )
end

CoD.QuickLaunch.SelectorGap = function ( option )
	local widest = 0
	for c = 1, #option.choices do
		local left, top, right, bottom = GetTextDimensions( option.choices[c].label, CoD.fonts.Condensed, CoD.CoD9Button.TextHeight )
		if right - left > widest then
			widest = right - left
		end
	end
	return CoD.QuickLaunch.ListWidth - 2 * CoD.LeftRightSelector.ArrowSize - widest
end

CoD.QuickLaunch.AddOptionSelectors = function ( buttonList, controller, firstPriority, live )
	for i = 1, #CoD.QuickLaunch.Options do
		local option = CoD.QuickLaunch.Options[i]
		local selector = buttonList:addLeftRightSelector( option.label, CoD.QuickLaunch.OptionValue( option ), CoD.QuickLaunch.SelectorGap( option ), option.hint, firstPriority + i - 1 )

		for c = 1, #option.choices do
			local choice = option.choices[c]
			selector:addChoice( choice.label, function ( params, userRequested )
				CoD.QuickLaunch.OptionValues[params.dvar] = params.value
				if live and userRequested then
					Engine.Exec( controller, "set " .. params.dvar .. " " .. tostring( params.value ) )
				end
			end, {
				dvar = option.dvar,
				value = choice.value
			} )
		end
	end
end

LUI.createMenu.QuickLaunchOptions = function ( controller, userData )
	local entry = userData.entry
	local mode = userData.mode
	local menu = CoD.Menu.New( "QuickLaunchOptions" )
	menu.controller = controller
	menu.anyControllerAllowed = true
	menu:addSelectButton()
	menu:addBackButton()
	menu:registerEventHandler( "open_menu", CoD.Lobby.OpenMenu )

	if mode == "lobby" then
		menu:addTitle( "BO2 MP OPTIONS" )
		menu:registerEventHandler( "button_prompt_back", function ( handlerMenu, event )
			Engine.PartyHostClearUIState()
			handlerMenu:goBack( event.controller )
		end )
	else
		menu:setPreviousMenu( userData.parent, {
			mode = mode
		} )
		menu:addTitle( CoD.QuickLaunch.LabelOf( entry, userData.labelField or "name" ) )
		menu:registerEventHandler( "button_prompt_back", CoD.Menu.ButtonPromptBack )

		local pane = CoD.QuickLaunch.NewPreviewPane( CoD.QuickLaunch.InfoRows )
		pane:setLeftRight( true, false, CoD.QuickLaunch.PaneLeft, CoD.QuickLaunch.PaneLeft + CoD.QuickLaunch.PaneWidth )
		pane:setTopBottom( true, false, CoD.QuickLaunch.ContentTop, CoD.QuickLaunch.ContentTop + 400 )
		menu:addElement( pane )
		pane.labelField = userData.labelField or "name"
		CoD.QuickLaunch.ShowPreview( pane, entry, userData.gametype, userData.group )
	end

	local top = CoD.QuickLaunch.ContentTop
	local rowHeight = CoD.CoD9Button.Height + CoD.ButtonList.ButtonSpacing
	local height = #CoD.QuickLaunch.Options * rowHeight
	if mode ~= "lobby" then
		height = height + rowHeight + CoD.CoD9Button.Height / 2
	end

	menu.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.QuickLaunch.ListWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = top,
		bottom = top + height,
		alpha = 1
	} )
	menu.buttonList:setPriority( 10 )
	menu:addElement( menu.buttonList )

	if mode ~= "lobby" then
		menu:registerEventHandler( "quicklaunch_options_start", function ( handlerMenu, event )
			local pickedController = event.controller or handlerMenu.controller
			if mode == "party" then
				CoD.QuickLaunch.LaunchParty( handlerMenu, pickedController, userData.gametype, userData.group, entry, userData.labelField )
			else
				CoD.QuickLaunch.LaunchSolo( pickedController, userData.gametype, userData.group, entry, userData.labelField )
			end
		end )
		local start = menu.buttonList:addButton( "START", nil, 1 )
		start:setActionEventName( "quicklaunch_options_start" )
		menu.buttonList:addSpacer( CoD.CoD9Button.Height / 2, 2 )
	end

	CoD.QuickLaunch.AddOptionSelectors( menu.buttonList, controller, 3, mode == "lobby" )

	menu.buttonList:processEvent( {
		name = "gain_focus"
	} )

	return menu
end

LUI.createMenu.QuickLaunchClassic = function ( controller, userData )
	return CoD.QuickLaunch.NewMapPage( "QuickLaunchClassic", "CLASSIC", CoD.QuickLaunch.Classic, "zclassic", "zclassic", controller, userData )
end

LUI.createMenu.QuickLaunchSurvival = function ( controller, userData )
	return CoD.QuickLaunch.NewMapPage( "QuickLaunchSurvival", "SURVIVAL", CoD.QuickLaunch.Survival, "zstandard", "zsurvival", controller, userData, CoD.QuickLaunch.InfoRowsSurvival, "start" )
end

LUI.createMenu.QuickLaunchUsermaps = function ( controller, userData )
	return CoD.QuickLaunch.NewMapPage( "QuickLaunchUsermaps", "USERMAPS", CoD.QuickLaunch.Usermaps, "zstandard", "zsurvival", controller, userData )
end

CoD.QuickLaunch.Pages = {
	{ "CLASSIC", "QuickLaunchClassic" },
	{ "SURVIVAL", "QuickLaunchSurvival" },
	{ "USERMAPS", "QuickLaunchUsermaps" },
}

CoD.QuickLaunch.PagesParty = CoD.QuickLaunch.Pages

LUI.createMenu.QuickLaunch = function ( controller, userData )
	local mode = CoD.QuickLaunch.ModeOf( userData )
	local pages = CoD.QuickLaunch.Pages
	if mode == "party" then
		pages = CoD.QuickLaunch.PagesParty
	end
	local menu = CoD.Menu.New( "QuickLaunch" )
	menu.controller = controller
	menu.anyControllerAllowed = true
	menu:setPreviousMenu( "MainLobby" )
	menu:addSelectButton()
	menu:addBackButton()
	if mode == "party" then
		menu:addTitle( "ZOMBIES RE:BORN - MULTIPLAYER" )
	else
		menu:addTitle( "ZOMBIES RE:BORN - SOLO" )
	end
	menu:registerEventHandler( "open_menu", CoD.Lobby.OpenMenu )
	menu:registerEventHandler( "button_prompt_back", CoD.Menu.ButtonPromptBack )

	local top = CoD.QuickLaunch.ContentTop
	local rowHeight = CoD.CoD9Button.Height + CoD.ButtonList.ButtonSpacing

	menu.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.QuickLaunch.ListWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = top,
		bottom = top + #pages * rowHeight,
		alpha = 1
	} )
	menu.buttonList:setPriority( 10 )
	menu:addElement( menu.buttonList )

	for i = 1, #pages do
		local label, popupName = pages[i][1], pages[i][2]
		local eventName = "quicklaunch_page_" .. popupName
		menu:registerEventHandler( eventName, function ( handlerMenu, event ) handlerMenu:openMenu( popupName, event.controller, {
				parent = "QuickLaunch",
				mode = mode
			} )
			handlerMenu:close()
			Engine.PlaySound( "cac_screen_fade" )
		end )
		local button = menu.buttonList:addButton( label, nil, i )
		button:setActionEventName( eventName )
	end

	menu.buttonList:processEvent( {
		name = "gain_focus"
	} )

	return menu
end

CoD.QuickLaunch.GlobeFallbackColumn17 = 110
CoD.QuickLaunch.GlobeFallbackColumn16 = 40

if CoD.GameGlobeZombie ~= nil then
	CoD.GameGlobeZombie.MoveToExpectedMap = function ()
		CoD.globe.shown = true
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "move_to_expected_map" )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 0 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 600 )
		CoD.GameGlobeZombie.gameGlobe:setLeftRight( false, false, -1440, 1440 )
		CoD.GameGlobeZombie.gameGlobe:setTopBottom( false, false, -1440 + CoD.GameGlobeZombie.PlaceYOffSet, 1440 + CoD.GameGlobeZombie.PlaceYOffSet )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 0, 2, 2, 0, 0 )

		local map = CoD.Zombie.GetUIMapName()
		local table_name = UIExpression.GetCurrentMapTableName()
		local x = tonumber( UIExpression.TableLookup( nil, table_name, 0, map, 17 ) )
			or CoD.QuickLaunch.GlobeFallbackColumn17
		local y = tonumber( UIExpression.TableLookup( nil, table_name, 0, map, 16 ) )
			or CoD.QuickLaunch.GlobeFallbackColumn16

		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, x * CoD.GameGlobeZombie.DegreesToRadiansScale, y * CoD.GameGlobeZombie.DegreesToRadiansScale, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	end
end

CoD.QuickLaunch.StockPrivateOnlineGameLobby = LUI.createMenu.PrivateOnlineGameLobby

CoD.QuickLaunch.Chain = function ( menu, name, handler )
	local existing = menu.m_eventHandlers[name]
	menu:registerEventHandler( name, function ( handlerMenu, event ) if existing ~= nil then existing( handlerMenu, event ) end handler( handlerMenu, event ) end )
end

CoD.QuickLaunch.Reapply = function ( controller, menu, where )
	local pending = CoD.QuickLaunch.Pending
	if pending == nil then
		local map = CoD.QuickLaunch.Dstr( "zl_map" )
		local gametype = CoD.QuickLaunch.Dstr( "zl_gt" )
		if map ~= "" and gametype ~= "" then
			pending = {
				map = map,
				loc = CoD.QuickLaunch.Dstr( "zl_loc" ),
				gametype = gametype,
				group = CoD.QuickLaunch.Dstr( "zl_group" ),
			}
			CoD.QuickLaunch.Pending = pending
			CoD.QuickLaunch.Say( controller, where .. " rebuilt from record " .. map )
		end
	end
	if pending == nil then
		return
	end

	local reset = CoD.QuickLaunch.Dstr( "ui_mapname" )
	local resetGt = CoD.QuickLaunch.Dstr( "ui_gametype" )
	CoD.QuickLaunch.Say( controller, where .. " map is " .. reset .. " gametype " .. resetGt )

	if reset == pending.map and resetGt == pending.gametype then
		return
	end

	Engine.SetDvar( "ui_mapname", pending.map )
	Engine.SetDvar( "ui_zm_mapstartlocation", pending.loc )
	Engine.SetDvar( "ui_gametype", pending.gametype )
	Engine.SetDvar( "ui_zm_gamemodegroup", pending.group )
	Engine.SetGametype( pending.gametype )
	Engine.Exec( controller, "xupdatepartystate" )

	if menu ~= nil and menu.buttonPane ~= nil and menu.buttonPane.body ~= nil
		and menu.buttonPane.body.mapInfoImage ~= nil then
		menu.buttonPane.body.mapInfoImage:update( pending.map, pending.gametype )
	end

	if CoD.GameGlobeZombie ~= nil and CoD.GameGlobeZombie.gameGlobe ~= nil then
		CoD.GameGlobeZombie.MoveToExpectedMap()
	end

	CoD.QuickLaunch.Say( controller, where .. " put " .. pending.map .. " back" )
end

LUI.createMenu.PrivateOnlineGameLobby = function ( controller, ... )
	local menu = CoD.QuickLaunch.StockPrivateOnlineGameLobby( controller, ... )
	CoD.QuickLaunch.Reapply( controller, menu, "lobby built:" )

	menu:registerEventHandler( "open_bo2_mp_options", function ( handlerMenu, event )
		Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_EDITING_GAME_OPTIONS )
		handlerMenu:openPopup( "QuickLaunchOptions", event.controller, {
			mode = "lobby"
		} )
		Engine.PlaySound( "cac_screen_fade" )
	end )

	CoD.QuickLaunch.Chain( menu, "gamelobby_update", function ( handlerMenu, event ) CoD.QuickLaunch.Reapply( event.controller or handlerMenu.controller, handlerMenu, "lobby update:" ) end )

	return menu
end

if CoD.PrivateGameLobby ~= nil and CoD.PrivateGameLobby.UpdateHost ~= nil then
	CoD.QuickLaunch.StockUpdateHost = CoD.PrivateGameLobby.UpdateHost

	CoD.PrivateGameLobby.UpdateHost = function ( menu, event )
		CoD.QuickLaunch.StockUpdateHost( menu, event )
		CoD.QuickLaunch.Reapply( event.controller or menu.controller, menu, "updatehost:" )
	end
end

if CoD.PrivateGameLobby ~= nil and CoD.PrivateGameLobby.PopulateButtons_Project_Zombie ~= nil then
	CoD.QuickLaunch.StockPopulateLobbyButtons = CoD.PrivateGameLobby.PopulateButtons_Project_Zombie

	CoD.PrivateGameLobby.PopulateButtons_Project_Zombie = function ( buttonPane, isHost )
		CoD.QuickLaunch.StockPopulateLobbyButtons( buttonPane, isHost )

		if isHost == true then
			local button = buttonPane.body.buttonList:addButton( "BO2 MP OPTIONS" )
			button.hintText = "Special enemies and der wunderfizz, for BO2 multiplayer maps."
			button:setActionEventName( "open_bo2_mp_options" )
			button:registerEventHandler( "start_game", button.disable )
			button:registerEventHandler( "cancel_start_game", button.enable )
		end
	end
end

if CoD.SelectMapZombie ~= nil then
	CoD.SelectMapZombie.GetMaps = function ( f5_arg0, f5_arg1 )
		local list = nil

		if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then

			list = Engine.GetPlaylistSuperCategories()
		else
			list = {}

			for key, entry in pairs( Engine.GetMaps() ) do

				local name = string.gsub( entry.loadName, "_solo", "", 1 )

				local allowed = CoD.QuickLaunch.Stock[name] == true
					or ( CoD.QuickLaunch.UsermapsInSurvivalMenu and CoD.QuickLaunch.UsermapNames[name] == true )

				if allowed then
					table.insert( list, entry )
				else
					DebugPrint( "mod_to_launch_mp_maps_in_zombies: '" .. entry.loadName .. "' has no map table row here, left out of the map list" )
				end
			end
		end

		table.sort( list, CoD.SelectMapZombie.SortMapsFunc )
		return list
	end
end

if CoD.SelectMapZombie ~= nil then
	CoD.SelectMapZombie.SortMapsFunc = function ( f6_arg0, f6_arg1 )
		local scratch = nil
		f6_arg0.loadName, scratch = string.gsub( f6_arg0.loadName, "_solo", "", 1 )
		f6_arg1.loadName, scratch = string.gsub( f6_arg1.loadName, "_solo", "", 1 )

		local table_name = UIExpression.GetCurrentMapTableName()
		local left = tonumber( UIExpression.TableLookup( nil, table_name, 0, f6_arg0.loadName, 16 ) ) or 0
		local right = tonumber( UIExpression.TableLookup( nil, table_name, 0, f6_arg1.loadName, 16 ) ) or 0

		if left ~= right then
			return left < right
		end
		return f6_arg0.loadName < f6_arg1.loadName
	end
end

CoD.QuickLaunch.OpenFromLobby = function ( menu, event, mode )

	if mode == "party" and CoD.MainLobby.ShouldPreventCreateLobby ~= nil
		and CoD.MainLobby.ShouldPreventCreateLobby() then
		return
	end

	menu:openMenu( "QuickLaunch", event.controller, {
		parent = "MainLobby",
		mode = mode
	} )

	menu:close()
	Engine.PlaySound( "cac_screen_fade" )
end

CoD.QuickLaunch.StockPopulateButtons = CoD.MainLobby.PopulateButtons

CoD.MainLobby.PopulateButtons = function ( buttonPane )
	CoD.QuickLaunch.StockPopulateButtons( buttonPane )

	if CoD.isZombie == true then
		buttonPane.body.quickLaunchSoloButton = buttonPane.body.buttonList:addButton( "QUICK LAUNCH SOLO", nil, 2 )
		buttonPane.body.quickLaunchSoloButton:setActionEventName( "open_quick_launch_solo" )

		buttonPane.body.quickLaunchPartyButton = buttonPane.body.buttonList:addButton( "QUICK LAUNCH MULTIPLAYER", nil, 2 )
		buttonPane.body.quickLaunchPartyButton:setActionEventName( "open_quick_launch_party" )
	end
end

CoD.QuickLaunch.StockMainLobby = LUI.createMenu.MainLobby

LUI.createMenu.MainLobby = function ( controller )
	local menu = CoD.QuickLaunch.StockMainLobby( controller )
	menu:registerEventHandler( "open_quick_launch_solo", function ( handlerMenu, event ) CoD.QuickLaunch.OpenFromLobby( handlerMenu, event, "solo" ) end )
	menu:registerEventHandler( "open_quick_launch_party", function ( handlerMenu, event ) CoD.QuickLaunch.OpenFromLobby( handlerMenu, event, "party" ) end )
	return menu
end

if LUI.createMenu.SelectMapZombie ~= nil then
	local stockSelectMap = LUI.createMenu.SelectMapZombie
	LUI.createMenu.SelectMapZombie = function ( controller, userData )
		CoD.QuickLaunch.Forget( controller, "map select opened" )
		return stockSelectMap( controller, userData )
	end
end

if LUI.createMenu.SelectStartLocZombie ~= nil then
	local stockSelectStartLoc = LUI.createMenu.SelectStartLocZombie
	LUI.createMenu.SelectStartLocZombie = function ( controller, userData )
		CoD.QuickLaunch.Forget( controller, "start location select opened" )
		return stockSelectStartLoc( controller, userData )
	end
end
