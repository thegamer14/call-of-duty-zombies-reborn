#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

main()
{ }

init()
{
	println("^2mod_to_launch_mp_maps_in_zombies: build " + scripts\zm\mod_to_launch_mp_maps_in_zombies\_zm_build_id::build_id());

	level thread scripts\zm\mod_to_launch_mp_maps_in_zombies\_zm_commands::command_watcher();
	level thread solo_watch();
}

solo_watch()
{
	while (!level flag_exists("initial_players_connected") || !level flag("initial_players_connected"))
	{
		wait 0.5;
	}

	fix_solo();
	solo_diag();
}

fix_solo()
{
	players = get_players();

	if (players.size != 1 || !level flag_exists("solo_game"))
	{
		return;
	}

	if (!level flag("solo_game"))
	{
		level flag_set("solo_game");
		println("^3mod_to_launch_mp_maps_in_zombies: solo_game was off with one player, forced on");
		players[0] iprintln("^3solo_game was off - forced on");
	}

	if (!isDefined(level.using_solo_revive) || !level.using_solo_revive)
	{
		level.using_solo_revive = 1;
		level.revive_machine_is_solo = 1;
		println("^3mod_to_launch_mp_maps_in_zombies: using_solo_revive was off, forced on");
	}
}

solo_diag()
{
	players = get_players();

	foreach (player in players)
	{
		player thread downed_diag();
	}

	while (1)
	{
		level waittill("end_game");
		line = end_game_line();
		println(line);
		players = get_players();

		if (players.size > 0)
		{
			players[0] iprintln(line);
		}
	}
}

flag_state(name)
{
	if (!level flag_exists(name))
	{
		return name + "=uninited";
	}

	if (level flag(name))
	{
		return name + "=1";
	}

	return name + "=0";
}

player_state(player)
{
	state = "lives=";

	if (isDefined(player.lives))
	{
		state = state + player.lives;
	}
	else
	{
		state = state + "undef";
	}

	state = state + " hasqr=" + player hasperk("specialty_quickrevive");
	state = state + " laststand=" + player maps\mp\zombies\_zm_laststand::player_is_in_laststand();
	state = state + " waiting=" + is_true(player.waiting_to_revive);

	return state;
}

end_game_line()
{
	line = "^3end_game players=" + get_players().size;
	line = line + " " + flag_state("solo_game");
	line = line + " " + flag_state("wait_and_revive");

	if (isDefined(level.using_solo_revive))
	{
		line = line + " using_solo_revive=" + level.using_solo_revive;
	}
	else
	{
		line = line + " using_solo_revive=undef";
	}

	players = get_players();

	foreach (player in players)
	{
		line = line + " | " + player_state(player);
	}

	return line;
}

downed_diag()
{
	self endon("disconnect");

	while (1)
	{
		self waittill("player_downed");
		line = "^3downed " + flag_state("solo_game");
		line = line + " " + flag_state("wait_and_revive");
		line = line + " players=" + get_players().size;
		line = line + " | " + player_state(self);
		println(line);
		self iprintln(line);
	}
}
