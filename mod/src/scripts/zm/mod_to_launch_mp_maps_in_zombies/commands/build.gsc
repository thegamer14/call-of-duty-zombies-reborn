#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

run()
{
	println("^2build (server, mod.iwd): " + scripts\zm\mod_to_launch_mp_maps_in_zombies\_zm_build_id::build_id() + "  built " + scripts\zm\mod_to_launch_mp_maps_in_zombies\_zm_build_id::build_time());

	player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

	if (isDefined(player))
	{
		player iprintln(scripts\zm\mod_to_launch_mp_maps_in_zombies\_zm_build_id::build_id());
		player iprintln(scripts\zm\mod_to_launch_mp_maps_in_zombies\_zm_build_id::build_time());
	}
}
