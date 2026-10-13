#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

run(arg)
{
	seconds = 30;

	if (scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::is_integer_string(arg))
	{
		seconds = int(arg);
	}

	player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

	if (!isDefined(player))
	{
		println("^3zm_watch: ^1no player");
		return;
	}

	player thread watch_new_entities(seconds);
}


watch_new_entities(seconds)
{
	level endon("intermission");
	self endon("disconnect");

	radius = 400;
	elapsed = 0;
	interval = 0.05;

	seen = [];

	foreach (ent in getentarray())
	{
		if (isDefined(ent))
		{
			seen[ent getentitynumber()] = 1;
		}
	}

	println("^3zm_watch: watching " + seconds + "s for entities within " + radius + " units");

	while (elapsed < seconds)
	{
		wait interval;
		elapsed = elapsed + interval;

		fresh = [];

		foreach (ent in getentarray())
		{
			if (!isDefined(ent))
			{
				continue;
			}

			num = ent getentitynumber();

			if (isDefined(seen[num]))
			{
				continue;
			}

			seen[num] = 1;

			if (!isDefined(ent.origin) || distance(ent.origin, self.origin) > radius)
			{
				continue;
			}

			fresh[fresh.size] = ent;
		}

		foreach (ent in fresh)
		{
			line = "";

			if (isDefined(ent.classname))
			{
				line = line + ent.classname;
			}
			else
			{
				line = line + "(no classname)";
			}

			line = line + "  " + int(distance(ent.origin, self.origin)) + " units  " + scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::print_vector(ent.origin);

			if (isDefined(ent.model))
			{
				line = line + "  model " + ent.model;
			}

			if (isDefined(ent.targetname))
			{
				line = line + "  targetname " + ent.targetname;
			}

			println("^3zm_watch: +" + int(elapsed * 10) / 10 + "s  " + line);
		}
	}

	println("^3zm_watch: done");
	self iprintln("^3zm_watch done");
}
