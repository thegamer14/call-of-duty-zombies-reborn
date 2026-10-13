#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

run(sub)
{
	switch (sub)
	{
		case "pos":
			player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

			if (isDefined(player))
			{
				player print_position();
			}

			break;

		case "zombies":
			print_zombie_round();
			break;

		case "inventory":
			print_weapon_slots(scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player());
			break;

		case "box":
			print_box_contents();
			break;

		case "precache":
			print_precached_names();
			break;

		case "map":
			print_map_contents();
			break;

		case "held":
			player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

			if (isDefined(player))
			{
				player print_held_weapon();
			}

			break;

		case "player":
			player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

			if (isDefined(player))
			{
				player print_player_inventory();
			}

			break;

		case "entities":
			player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

			if (isDefined(player))
			{
				player thread print_map_entities();
			}

			break;

		case "nodes":
			print_traverse_nodes();
			break;

		case "hurt":
			player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();
			print_hurt_triggers(player);
			break;

		case "postracker":
		case "posTracker":
			toggle_pos_tracker();
			break;

		case "drawnodes":
			toggle_node_draw("nodes");
			break;

		case "drawlinks":
			toggle_node_draw("links");
			break;

		case "drawcandidates":
			toggle_node_draw("candidates");
			break;

		case "draw_spawnpoints":
		case "drawspawnpoints":
			toggle_spawnpoints_draw();
			break;

		case "nodedump":
			print_nodes_near();
			break;

		case "tracelinks":
			trace_candidate_links();
			break;

		default:
			println("^3zm_debug: unknown report " + sub);
			break;
	}
}


print_box_contents()
{
	if (!isDefined(level.zombie_weapons))
	{
		println("^3zm_box: nothing registered");
		return;
	}

	keys = getarraykeys(level.zombie_weapons);
	in_box = "";
	out_box = "";
	n_in = 0;
	n_out = 0;

	foreach (key in keys)
	{
		if (is_true(level.zombie_weapons[key].is_in_box))
		{
			in_box = in_box + key + "  ";
			n_in++;
		}
		else
		{
			out_box = out_box + key + "  ";
			n_out++;
		}
	}

	println("^3zm_box: map " + level.script);
	println("^3zm_box: IN the box (" + n_in + "): " + in_box);
	println("^3zm_box: registered but OUT of the box (" + n_out + "): " + out_box);
}


print_zombie_round()
{
	println("^3zm_zombies: round " + level.round_number + ", total left to spawn " + level.zombie_total);

	alive = get_round_enemy_array();

	println("^3zm_zombies: " + alive.size + " alive, ai limit " + level.zombie_ai_limit + ", " + get_current_corpse_count() + " corpses, " + getfreeactorcount() + " free actor slots");

	pool = 0;

	if (isDefined(level.zombie_spawn_location_pool))
	{
		pool = level.zombie_spawn_location_pool.size;
	}

	spawners = 0;

	if (isDefined(level.zombie_spawners))
	{
		spawners = level.zombie_spawners.size;
	}

	println("^3zm_zombies: " + level.zombie_spawn_locations.size + " of " + pool + " spawn locations live, " + spawners + " spawners");

	drop = "not measured";

	if (isDefined(level.zombie_spawn_ground_drop))
	{
		drop = level.zombie_spawn_ground_drop + " units";
	}

	println("^3zm_zombies: furthest a spawn location was dropped onto the floor: " + drop);
	println("^3zm_zombies: vocals " + soundexists("zmb_vocals_zombie_ambience") + ", footsteps " + soundexists("fly_step_zombie") + ", bodyfall " + soundexists("fly_bodyfall_large_metal"));

	timeouts = 0;

	if (isDefined(level.zombies_timeout_playspace))
	{
		timeouts = level.zombies_timeout_playspace;
	}

	requeued = 0;

	if (isDefined(level.zombie_total_subtract))
	{
		requeued = level.zombie_total_subtract;
	}

	println("^3zm_zombies: " + timeouts + " timed out in the playspace, " + requeued + " put back on the queue");

	foreach (zombie in alive)
	{
		state = "no state";

		if (isDefined(zombie.ai_state))
		{
			state = zombie.ai_state;
		}

		flags = "";

		if (is_true(zombie.in_the_ground))
		{
			flags = flags + " in_the_ground";
		}

		if (!is_true(zombie.completed_emerging_into_playable_area))
		{
			flags = flags + " not_emerged";
		}

		if (!isDefined(zombie.favoriteenemy))
		{
			flags = flags + " no_enemy";
		}

		if (is_true(zombie.isdog))
		{
			flags = flags + " dog";
		}

		println("^3zm_zombies:   " + zombie getentitynumber() + " " + state + " health " + zombie.health + " at " + zombie.origin + flags);
	}
}


print_held_weapon()
{
	weapon = self getcurrentweapon();

	if (!isDefined(weapon) || weapon == "" || weapon == "none")
	{
		println("^3zm_held: ^1nothing in hand");
		return;
	}

	println("^3zm_held: " + weapon);
	println("^3  weapontype      " + weapontype(weapon));
	println("^3  weaponclass     " + weaponclass(weapon));
	println("^3  inventorytype   " + weaponinventorytype(weapon));
	println("^3  clipsize        " + weaponclipsize(weapon));
	println("^3  maxammo         " + weaponmaxammo(weapon));

	alt = weaponaltweaponname(weapon);

	if (isDefined(alt) && alt != "none" && alt != "")
	{
		println("^3  altweapon       " + alt);
	}

	self iprintlnbold(weapon);
	self iprintln("^3" + weapontype(weapon) + " ^7/ ^3" + weaponclass(weapon));
}


print_map_contents()
{
	println("^3zm_map: " + level.script);
	println("^3zm_map: start location " + level.scr_zm_map_start_location + ", gametype " + level.scr_zm_ui_gametype);

	weapons = "";
	n_weapons = 0;

	if (isDefined(level.zombie_weapons))
	{
		foreach (key in getarraykeys(level.zombie_weapons))
		{
			weapons = weapons + key + "  ";
			n_weapons++;
		}
	}

	println("^3zm_map: " + n_weapons + " weapons registered:");
	println("^3zm_map:   " + weapons);

	machines = "";
	n_machines = 0;

	if (isDefined(level.machine_assets))
	{
		foreach (key in getarraykeys(level.machine_assets))
		{
			bottle = "no bottle field";

			if (isDefined(level.machine_assets[key].weapon))
			{
				bottle = level.machine_assets[key].weapon;
			}

			machines = machines + key + "(" + bottle + ")  ";
			n_machines++;
		}
	}

	println("^3zm_map: " + n_machines + " stock/precached perks (machine_assets), name(bottle weapon):");
	println("^3zm_map:   " + machines);

	custom = "";
	n_custom = 0;

	if (isDefined(level._custom_perks))
	{
		foreach (key in getarraykeys(level._custom_perks))
		{
			bottle = "no bottle field";

			if (isDefined(level._custom_perks[key].perk_bottle))
			{
				bottle = level._custom_perks[key].perk_bottle;
			}

			custom = custom + key + "(" + bottle + ")  ";
			n_custom++;
		}
	}

	println("^3zm_map: " + n_custom + " custom perks (_custom_perks), name(bottle weapon):");
	println("^3zm_map:   " + custom);

	buildables = "";
	n_buildables = 0;

	if (isDefined(level.zombie_buildables))
	{
		foreach (key in getarraykeys(level.zombie_buildables))
		{
			buildables = buildables + key + "  ";
			n_buildables++;
		}
	}

	println("^3zm_map: " + n_buildables + " buildables registered:");
	println("^3zm_map:   " + buildables);
}


print_precached_names()
{
	if (!isDefined(level.zombie_include_weapons))
	{
		println("^3zm_precache: nothing precached");
		return;
	}

	names = getarraykeys(level.zombie_include_weapons);

	println("^3zm_precache: dump for " + level.script + ", " + names.size + " precached names follow");

	foreach (name in names)
	{
		println("^3zm_precache: " + name);
	}

	println("^3zm_precache: end of dump for " + level.script);
}


print_weapon_slots(player)
{
	println("^3zm_inventory: map " + level.script + ", engine limit 256 weapons");

	included = 0;

	if (isDefined(level.zombie_include_weapons))
	{
		included = getarraykeys(level.zombie_include_weapons).size;
	}

	println("^3zm_inventory: precached " + included + " (include_weapons) - a floor, not the total");

	registered = 0;
	in_box = 0;

	if (isDefined(level.zombie_weapons))
	{
		keys = getarraykeys(level.zombie_weapons);
		registered = keys.size;

		foreach (key in keys)
		{
			if (is_true(level.zombie_weapons[key].is_in_box))
			{
				in_box++;
			}
		}
	}

	println("^3zm_inventory: registered " + registered + " zombie weapons, " + in_box + " of them in the box");

	limited = [];

	if (isDefined(level.limited_weapons))
	{
		limited = getarraykeys(level.limited_weapons);
	}

	if (limited.size == 0)
	{
		println("^3zm_inventory: limited 0 - no weapon quotas, every gun is unlimited");
	}
	else
	{
		line = "";

		foreach (key in limited)
		{
			line = line + key + " " + level.limited_weapons[key] + "  ";
		}

		println("^3zm_inventory: limited " + limited.size + " (how many may exist at once, game wide):");
		println("^3zm_inventory:   " + line);
	}

	if (!isDefined(player))
	{
		println("^3zm_inventory: no player to read action slots from");
		return;
	}

	primaries = player getweaponslistprimaries();
	line = "";

	foreach (weapon in primaries)
	{
		line = line + weapon + "  ";
	}

	println("^3zm_inventory: you carry " + primaries.size + " primaries: " + line);

	all = player getweaponslist();
	line = "";

	foreach (weapon in all)
	{
		line = line + weapon + "  ";
	}

	println("^3zm_inventory: " + all.size + " weapons in hand and slots: " + line);
	println("^3zm_inventory: current " + player getcurrentweapon());
}


print_player_inventory()
{
	println("^3zm_player: " + self.name);

	perks = array("specialty_armorvest", "specialty_quickrevive", "specialty_fastreload", "specialty_rof", "specialty_longersprint", "specialty_deadshot", "specialty_additionalprimaryweapon", "specialty_flakjacket", "specialty_scavenger", "specialty_grenadepulldeath", "specialty_nomotionsensor", "specialty_finalstand");
	held = "";
	n_held = 0;

	foreach (perk in perks)
	{
		if (self hasperk(perk))
		{
			held = held + perk + "  ";
			n_held++;
		}
	}

	println("^3zm_player: " + n_held + " of 12 perks held:");
	println("^3zm_player:   " + held);

	primaries = self getweaponslistprimaries();
	line = "";

	foreach (weapon in primaries)
	{
		line = line + weapon + "  ";
	}

	println("^3zm_player: " + primaries.size + " primaries: " + line);

	all = self getweaponslist();
	line = "";

	foreach (weapon in all)
	{
		line = line + weapon + "  ";
	}

	println("^3zm_player: " + all.size + " weapons total: " + line);

	pieces = self maps\mp\zombies\_zm_buildables::player_get_buildable_pieces();
	parts = "";
	n_parts = 0;

	foreach (piece in pieces)
	{
		if (!isDefined(piece))
		{
			continue;
		}

		name = piece.buildablename;

		if (isDefined(piece.part_name))
		{
			name = name + " (" + piece.part_name + ")";
		}

		parts = parts + name + "  ";
		n_parts++;
	}

	println("^3zm_player: " + n_parts + " buildable parts held:");
	println("^3zm_player:   " + parts);
}


print_position(quiet)
{
	origin = self.origin;
	angles = self getplayerangles();

	x = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::round_to_int(origin[0]);
	y = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::round_to_int(origin[1]);
	z = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::round_to_int(origin[2]);

	yaw = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::round_to_int(angles[1]);
	yaw = ((yaw % 360) + 360) % 360;
	facing_player = (yaw + 180) % 360;

	position = "(" + x + ", " + y + ", " + z + ")";

	println("^3zm_pos: " + position + ", (0, " + yaw + ", 0)   faces the way you look");
	println("^3zm_pos: " + position + ", (0, " + facing_player + ", 0)   faces you");
	println("^3zm_pos: " + x + " " + y + " " + z + " 0 0 0");

	if (is_true(quiet))
	{
		return;
	}

	self iprintlnbold(position);
	self iprintln("^3yaw " + yaw + " ^7your way, ^3yaw " + facing_player + " ^7facing you");
}


print_hurt_triggers(player)
{
	triggers = getentarray("trigger_hurt", "classname");

	if (isDefined(player))
	{
		println("^3zm_hurt: player at " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(player.origin));
	}

	println("^3zm_hurt: " + triggers.size + " trigger_hurt on " + level.script);

	foreach (trigger in triggers)
	{

		v_min = trigger.origin + trigger getmins();
		v_max = trigger.origin + trigger getmaxs();

		line = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(v_min) + " .. " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(v_max);

		if (isDefined(trigger.script_noteworthy))
		{
			line = line + "  noteworthy " + trigger.script_noteworthy;
		}

		if (isDefined(trigger.targetname))
		{
			line = line + "  targetname " + trigger.targetname;
		}

		if (isDefined(player) && player istouching(trigger))
		{
			line = line + "  ^1<- TOUCHING";
		}

		println("^3zm_hurt: " + line);
	}
}


print_map_entities()
{
	ents = getentarray();

	println("^3zm_entities: " + ents.size + " entities on " + level.script + " before filtering");

	n = 0;

	foreach (ent in ents)
	{
		if (!isDefined(ent) || !isDefined(ent.classname))
		{
			continue;
		}

		if (issubstr(ent.classname, "_spawn"))
		{
			continue;
		}

		line = ent.classname + "  " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(ent.origin);

		if (isDefined(ent.angles))
		{
			line = line + "  angles " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(ent.angles);
		}

		if (isDefined(ent.targetname))
		{
			line = line + "  targetname " + ent.targetname;
		}

		if (isDefined(ent.script_noteworthy))
		{
			line = line + "  noteworthy " + ent.script_noteworthy;
		}

		println("^3zm_entities: " + line);

		n++;

		if (n % 256 == 0)
		{
			wait 0.05;
		}
	}

	println("^3zm_entities: " + n + " printed after filtering, of " + ents.size + " total");
}


draw_interval()
{
	seconds = getdvarint("zm_draw_interval");

	if (seconds < 1)
	{
		seconds = 30;
	}

	return seconds;
}


draw_style_is_lines()
{
	return getdvar("zm_draw_style") != "models";
}


max_draw_points()
{
	return 900;
}


max_draw_segments()
{
	return 1600;
}


max_node_markers()
{
	return 96;
}


max_link_markers()
{
	return 128;
}


toggle_node_draw(which)
{
	if (which == "candidates")
	{
		level.zm_draw_candidates = !is_true(level.zm_draw_candidates);
		println("^3zm_draw: candidates " + on_off(level.zm_draw_candidates) + " - yellow is a pair the engine could link and does not");
	}
	else if (which == "links")
	{
		level.zm_draw_links = !is_true(level.zm_draw_links);
		println("^3zm_draw: links " + on_off(level.zm_draw_links));
	}
	else
	{
		level.zm_draw_nodes = !is_true(level.zm_draw_nodes);
		println("^3zm_draw: nodes " + on_off(level.zm_draw_nodes));
	}

	if (!is_true(level.zm_draw_nodes) && !is_true(level.zm_draw_links) && !is_true(level.zm_draw_candidates))
	{
		level notify("zm_draw_off");
		return;
	}

	if (is_true(level.zm_draw_running))
	{
		return;
	}

	level thread node_draw_loop();
}


on_off(value)
{
	if (is_true(value))
	{
		return "on";
	}

	return "off";
}


node_draw_loop()
{
	level endon("intermission");
	level endon("zm_draw_off");

	level.zm_draw_running = 1;
	level thread clear_draw_running();

	nodes = getallnodes();

	for (i = 0; i < nodes.size; i++)
	{
		nodes[i].zm_index = i;
	}

	level.zm_draw_nodes_cache = nodes;

	markers = [];

	if (draw_style_is_lines())
	{
		level thread primitive_draw_loop();
	}

	if (!draw_style_is_lines())
	{
		markers = spawn_draw_markers(max_node_markers() + max_link_markers());
		level thread release_draw_markers(markers);
	}

	println("^3zm_draw: " + nodes.size + " nodes on " + level.script + ", style " + draw_style_name() + ", every " + draw_interval() + "s. Radius zm_draw_radius (768), style zm_draw_style (lines|models).");

	for (;;)
	{

		player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

		if (!isDefined(player))
		{
			continue;
		}

		radius = getdvarint("zm_draw_radius");

		if (radius <= 0 && nodes.size > max_draw_points())
		{
			radius = 1536;

			if (!is_true(level.zm_draw_warned))
			{
				level.zm_draw_warned = 1;
				println("^3zm_draw: " + nodes.size + " nodes is too many to draw at once - using a " + radius + " unit radius. Set zm_draw_radius to override.");
			}
		}

		if (draw_style_is_lines())
		{
			collect_draw_geometry(nodes, player, radius);
		}
		else
		{

			if (radius <= 0)
			{
				radius = 768;
			}

			used = 0;

			if (is_true(level.zm_draw_nodes))
			{
				used = place_node_markers(nodes, markers, used, max_node_markers(), player, radius);
			}

			if (is_true(level.zm_draw_links))
			{
				used = place_link_markers(nodes, markers, used, player, radius);
			}

			for (i = used; i < markers.size; i++)
			{
				markers[i] hide();
			}
		}

		wait(draw_interval());
	}
}


primitive_draw_loop()
{
	level endon("intermission");
	level endon("zm_draw_off");

	for (;;)
	{
		wait 0.05;

		if (!draw_style_is_lines() || !isDefined(level.zm_draw_points))
		{
			continue;
		}

		if (is_true(level.zm_draw_nodes))
		{
			foreach (point in level.zm_draw_points)
			{
				colour = (0.2, 0.4, 1);
				size = 10;

				if (point.is_negotiation)
				{
					colour = (0, 1, 0);
					size = 20;
				}

				sphere(point.origin + (0, 0, 8), size, colour, 1, 1, 8, 50);
				print3d(point.origin + (0, 0, 40), "" + point.index, colour, 1, 2);
			}
		}

		if (isDefined(level.zm_draw_segments))
		{
			foreach (segment in level.zm_draw_segments)
			{
				if (segment.linked)
				{
					line(segment.start + (0, 0, 8), segment.end + (0, 0, 8), (1, 0.15, 0.15), 1, 0, 1);
					continue;
				}

				line(segment.start + (0, 0, 20), segment.end + (0, 0, 20), (1, 0.9, 0.1), 1, 0, 1);
			}
		}
	}
}


draw_style_name()
{
	if (draw_style_is_lines())
	{
		return "lines";
	}

	return "models";
}


collect_draw_geometry(nodes, player, radius)
{
	radius_sq = radius * radius;
	points = [];
	segments = [];
	counted = 0;

	truncated = 0;

	foreach (node in nodes)
	{

		counted++;

		if (counted % 24 == 0)
		{
			wait 0.05;
		}

		if (points.size >= max_draw_points() || segments.size >= max_draw_segments())
		{
			truncated = 1;
			break;
		}

		if (radius > 0 && distancesquared(node.origin, player.origin) > radius_sq)
		{
			continue;
		}

		point = spawnstruct();
		point.origin = node.origin;
		point.index = node.zm_index;
		point.is_negotiation = isDefined(node.type) && (node.type == "Begin" || node.type == "End");
		points[points.size] = point;

		if (!is_true(level.zm_draw_links) && !is_true(level.zm_draw_candidates))
		{
			continue;
		}

		near = getnodesinradius(node.origin, 256, 0);

		foreach (other in near)
		{
			if (!isDefined(other.zm_index) || other.zm_index <= node.zm_index)
			{
				continue;
			}

			linked = nodesarelinked(node, other);

			if (linked && !is_true(level.zm_draw_links))
			{
				continue;
			}

			if (!linked)
			{
				if (!is_true(level.zm_draw_candidates))
				{
					continue;
				}

				if (abs(node.origin[2] - other.origin[2]) > 64)
				{
					continue;
				}
			}

			segment = spawnstruct();
			segment.start = node.origin;
			segment.end = other.origin;
			segment.linked = linked;
			segment.first = node.zm_index;
			segment.second = other.zm_index;
			segments[segments.size] = segment;
		}
	}

	level.zm_draw_points = points;
	level.zm_draw_segments = segments;

	linked_count = 0;

	foreach (segment in segments)
	{
		if (segment.linked)
		{
			linked_count++;
		}
	}

	where = "whole map";

	if (radius > 0)
	{
		where = "within " + radius;
	}

	if (truncated)
	{
		where = where + ", TRUNCATED at the draw budget - lower zm_draw_radius";
	}

	println("^3zm_draw: " + points.size + " nodes, " + linked_count + " links, " + (segments.size - linked_count) + " candidates (" + where + "). Needs `developer 1`.");
}


spawn_draw_markers(count)
{
	markers = [];

	for (i = 0; i < count; i++)
	{
		marker = spawn("script_model", (0, 0, 0));
		marker setmodel("zombie_skull");
		marker hide();
		markers[i] = marker;

		if (i % 16 == 15)
		{
			wait 0.05;
		}
	}

	return markers;
}


clear_draw_running()
{
	level waittill("zm_draw_off");
	level.zm_draw_running = 0;
}


release_draw_markers(markers)
{
	level waittill("zm_draw_off");

	foreach (marker in markers)
	{
		if (isDefined(marker))
		{
			marker delete();
		}
	}
}


place_node_markers(nodes, markers, used, budget, player, radius)
{
	radius_sq = radius * radius;
	placed = 0;

	foreach (node in nodes)
	{
		if (placed >= budget || used >= markers.size)
		{
			break;
		}

		if (distancesquared(node.origin, player.origin) > radius_sq)
		{
			continue;
		}

		height = 4;

		if (isDefined(node.type) && (node.type == "Begin" || node.type == "End"))
		{
			height = 40;
		}

		markers[used] show();
		markers[used].origin = node.origin + (0, 0, height);
		used++;
		placed++;
	}

	return used;
}


place_link_markers(nodes, markers, used, player, radius)
{
	radius_sq = radius * radius;

	foreach (node in nodes)
	{
		if (used >= markers.size)
		{
			break;
		}

		if (distancesquared(node.origin, player.origin) > radius_sq)
		{
			continue;
		}

		near = getnodesinradius(node.origin, 256, 0);

		foreach (other in near)
		{
			if (used >= markers.size)
			{
				break;
			}

			if (!isDefined(other.zm_index) || other.zm_index <= node.zm_index)
			{
				continue;
			}

			if (!nodesarelinked(node, other))
			{
				continue;
			}

			markers[used] show();
			markers[used].origin = (node.origin + other.origin) * 0.5 + (0, 0, 16);
			used++;
		}
	}

	return used;
}


print_nodes_near()
{
	nodes = level.zm_draw_nodes_cache;

	if (!isDefined(nodes))
	{
		nodes = getallnodes();

		for (i = 0; i < nodes.size; i++)
		{
			nodes[i].zm_index = i;
		}

		level.zm_draw_nodes_cache = nodes;
	}

	player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

	if (!isDefined(player))
	{
		return;
	}

	radius = getdvarint("zm_draw_radius");

	if (radius < 64)
	{
		radius = 768;
	}

	radius_sq = radius * radius;
	shown = 0;

	foreach (node in nodes)
	{
		if (distancesquared(node.origin, player.origin) > radius_sq)
		{
			continue;
		}

		near = getnodesinradius(node.origin, 256, 0);
		linked = [];
		candidates = 0;

		foreach (other in near)
		{
			if (!isDefined(other.zm_index) || other.zm_index == node.zm_index)
			{
				continue;
			}

			candidates++;

			if (nodesarelinked(node, other))
			{
				linked[linked.size] = other.zm_index;
			}
		}

		type = "?";

		if (isDefined(node.type))
		{
			type = node.type;
		}

		text = "^3zm_nodes: " + node.zm_index + "  " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(node.origin) + "  type " + type + "  links " + linked.size + " of " + candidates + " within 256";

		if (linked.size > 0)
		{
			text = text + "  ->";

			foreach (index in linked)
			{
				text = text + " " + index;
			}
		}

		println(text);
		shown++;
	}

	println("^3zm_nodes: " + shown + " nodes within " + radius + " units. `links N of M` is the mesh gap - M is what the engine could link, N is what it does.");
}


trace_candidate_links()
{
	nodes = getallnodes();

	for (i = 0; i < nodes.size; i++)
	{
		nodes[i].zm_index = i;
	}

	tested = 0;
	unseen = 0;
	blocked = 0;
	no_floor = 0;
	stepped = 0;
	orphans = 0;
	passed = [];

	foreach (node in nodes)
	{
		node.zm_orphan = 1;

		near = getnodesinradius(node.origin, 320, 0);

		foreach (other in near)
		{
			if (other != node && nodesarelinked(node, other))
			{
				node.zm_orphan = 0;
				break;
			}
		}

		if (node.zm_orphan)
		{
			orphans++;
		}
	}

	println("^3zm_tracelinks: " + nodes.size + " nodes, " + orphans + " of them linkless and skipped." + " Testing every unlinked pair within 256 units and 64 of height.");

	foreach (node in nodes)
	{
		if (node.zm_orphan)
		{
			continue;
		}

		near = getnodesinradius(node.origin, 256, 0);

		foreach (other in near)
		{

			if (!isDefined(other.zm_index) || other.zm_index <= node.zm_index)
			{
				continue;
			}

			if (other.zm_orphan)
			{
				continue;
			}

			if (abs(node.origin[2] - other.origin[2]) > 64)
			{
				continue;
			}

			if (nodesarelinked(node, other))
			{
				continue;
			}

			tested++;

			if (tested % 8 == 0)
			{
				wait 0.05;
			}

			if (!nodesvisible(node, other))
			{
				unseen++;
				continue;
			}

			if (!link_body_clear(node.origin, other.origin))
			{
				blocked++;
				continue;
			}

			floor = link_floor_state(node.origin, other.origin);

			if (floor == "nofloor")
			{
				no_floor++;
				continue;
			}

			if (floor == "step")
			{
				stepped++;
				continue;
			}

			passed[passed.size] = "    (" + node.zm_index + ", " + other.zm_index + "),";
		}
	}

	println("^3zm_tracelinks: " + tested + " candidates tested, " + passed.size + " passed. Rejected: " + unseen + " not visible, " + blocked + " body blocked, " + no_floor + " no floor, " + stepped + " step over 18.");

	if (passed.size == 0)
	{
		return;
	}

	println("^2--- paste into HIJACKED_EXTRA_LINKS ---");

	for (i = 0; i < passed.size; i++)
	{
		println(passed[i]);

		if (i % 16 == 15)
		{
			wait 0.05;
		}
	}

	println("^2--- end ---");
}


link_body_clear(from, to)
{
	dir = vectornormalize(to - from);
	side = vectorscale((0 - dir[1], dir[0], 0), 15);

	offsets = [];
	offsets[0] = (0, 0, 0);
	offsets[1] = side;
	offsets[2] = (0, 0, 0) - side;

	heights = [];
	heights[0] = (0, 0, 12);
	heights[1] = (0, 0, 60);

	for (o = 0; o < offsets.size; o++)
	{
		for (h = 0; h < heights.size; h++)
		{
			start = from + offsets[o] + heights[h];
			end = to + offsets[o] + heights[h];

			if (!bullettracepassed(start, end, 0, undefined))
			{
				return false;
			}
		}
	}

	return true;
}


link_floor_state(from, to)
{
	span = distance(from, to);
	samples = int(span / 16);

	if (samples < 2)
	{
		samples = 2;
	}

	last = undefined;

	for (i = 0; i <= samples; i++)
	{
		point = from + vectorscale(to - from, i / samples);
		bottom = point - (0, 0, 128);
		hit = playerphysicstrace(point + (0, 0, 40), bottom);

		if (hit[2] <= bottom[2] + 1)
		{
			return "nofloor";
		}

		if (isDefined(last) && abs(hit[2] - last) > 18)
		{
			return "step";
		}

		last = hit[2];
	}

	return "ok";
}


toggle_spawnpoints_draw()
{
	level.zm_draw_spawns = !is_true(level.zm_draw_spawns);
	println("^3zm_draw: spawn points " + on_off(level.zm_draw_spawns));

	if (!level.zm_draw_spawns)
	{
		level notify("zm_draw_spawns_off");
		return;
	}

	level thread spawnpoints_draw_loop();
}


get_active_spawn_points()
{
	spots = [];

	content_script = "maps\\mp\\" + level.script + "_content";
	if (isDefined(level.player_spawn_table_override))
	{
		spots = [[ level.player_spawn_table_override ]]();
	}
	else if (isDefined(level.struct_class_names) && isDefined(level.struct_class_names["targetname"]) && isDefined(level.struct_class_names["targetname"]["initial_spawn_points"]))
	{
		spots = level.struct_class_names["targetname"]["initial_spawn_points"];
	}

	if (!isDefined(spots) || spots.size == 0)
	{
		structs = getstructarray("initial_spawn_points", "targetname");
		if (isDefined(structs) && structs.size > 0)
		{
			spots = structs;
		}
	}

	return spots;
}


spawnpoints_draw_loop()
{
	level endon("intermission");
	level endon("zm_draw_spawns_off");

	spots = get_active_spawn_points();

	if (!isDefined(spots) || spots.size == 0)
	{
		println("^1zm_draw: no spawn points found to draw");
		level.zm_draw_spawns = 0;
		return;
	}

	println("^3zm_draw: displaying " + spots.size + " player spawn points:");

	for (i = 0; i < spots.size; i++)
	{
		ang = (0, 0, 0);
		if (isDefined(spots[i].angles))
		{
			ang = spots[i].angles;
		}

		println("^3  [" + i + "] " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(spots[i].origin) + " angles (0, " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::round_to_int(ang[1]) + ", 0)");
	}

	markers = [];
	if (!draw_style_is_lines())
	{
		for (i = 0; i < spots.size; i++)
		{
			m = spawn("script_model", spots[i].origin + (0, 0, 8));
			m setmodel("zombie_skull");
			markers[markers.size] = m;
		}

		level waittill("zm_draw_spawns_off");

		foreach (m in markers)
		{
			if (isDefined(m))
			{
				m delete();
			}
		}
		return;
	}

	for (;;)
	{
		for (i = 0; i < spots.size; i++)
		{
			org = spots[i].origin;
			yaw = 0;

			if (isDefined(spots[i].angles))
			{
				yaw = spots[i].angles[1];
			}

			forward = anglestoforward((0, yaw, 0));
			facing_end = org + vectorscale(forward, 32) + (0, 0, 36);

			line(org, org + (0, 0, 72), (0.2, 0.9, 0.2), 1, 0, 1);

			line(org + (0, 0, 36), facing_end, (1, 1, 0), 1, 0, 1);

			line(org + (-12, 0, 2), org + (12, 0, 2), (0.2, 0.9, 0.2), 1, 0, 1);
			line(org + (0, -12, 2), org + (0, 12, 2), (0.2, 0.9, 0.2), 1, 0, 1);

			print3d(org + (0, 0, 78), "Spawn #" + i + " (" + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::round_to_int(yaw) + "^7)", (0.2, 1, 0.2), 1, 1.2);
		}

		wait 0.05;
	}
}


toggle_pos_tracker()
{
	if (is_true(level.zm_pos_tracker))
	{
		level.zm_pos_tracker = 0;
		level notify("zm_pos_tracker_off");
		println("^3zm_pos: off");
		return;
	}

	level.zm_pos_tracker = 1;
	level thread pos_tracker_loop();
}


pos_tracker_loop()
{
	level endon("intermission");
	level endon("zm_pos_tracker_off");

	println("^3zm_pos: on - `set zm_cmd debug postracker` again to stop");

	last = undefined;

	for (;;)
	{
		player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

		if (isDefined(player))
		{
			position = player.origin;

			if (!isDefined(last) || distancesquared(position, last) > 1)
			{
				last = position;
				player print_position(1);
			}
		}

		wait 0.5;
	}
}


print_traverse_nodes()
{
	nodes = getallnodes();
	begins = 0;

	foreach (node in nodes)
	{
		if (!isDefined(node.type) || node.type != "Begin")
		{
			continue;
		}

		begins++;
		line = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(node.origin);

		if (isDefined(node.animscript))
		{
			line = line + "  animscript " + node.animscript;
		}
		else
		{
			line = line + "  ^1no animscript^3";
		}

		if (isDefined(node.target))
		{
			ends = getnodearray(node.target, "targetname");
			line = line + "  target " + node.target;

			if (isDefined(ends) && ends.size > 0)
			{
				line = line + " -> " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(ends[0].origin) + "  dz " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::round_to_int(ends[0].origin[2] - node.origin[2]);
			}
			else
			{
				line = line + " ^1-> nothing^3";
			}
		}

		println("^3zm_nodes: " + line);
	}

	println("^3zm_nodes: " + begins + " traversal links of " + nodes.size + " nodes on " + level.script);
}
