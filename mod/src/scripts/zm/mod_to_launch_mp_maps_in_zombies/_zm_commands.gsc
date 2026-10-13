#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

command_watcher()
{
	level endon("intermission");

	setdvar("zm_cmd", "");

	while (1)
	{
		wait 0.25;

		value = getdvar("zm_cmd");

		if (value == "")
		{
			continue;
		}

		setdvar("zm_cmd", "");

		parts = strtok(value, " ");
		if (parts.size == 0)
		{
			continue;
		}

		command = parts[0];
		arg = "";

		for (i = 1; i < parts.size; i++)
		{
			if (arg != "")
			{
				arg = arg + " ";
			}

			arg = arg + parts[i];
		}

		switch (command)
		{
			case "slot":
				scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\slot::run(arg);
				break;

			case "build":
				scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\build::run();
				break;

			case "watch":
				scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\watch::run(arg);
				break;

			case "debug":
				scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\debug::run(arg);
				break;

			default:
				println("^3zm: unknown command " + command);
				break;
		}
	}
}
