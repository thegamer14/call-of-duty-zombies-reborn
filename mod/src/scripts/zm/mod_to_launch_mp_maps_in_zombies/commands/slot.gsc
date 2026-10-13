#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

run(arg)
{
	if (!scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::is_integer_string(arg))
	{
		return;
	}

	player = scripts\zm\mod_to_launch_mp_maps_in_zombies\commands\utility::get_command_player();

	if (isDefined(player))
	{
		player select_weapon_slot(int(arg));
	}
}


select_weapon_slot(slot)
{
	if (slot < 1)
	{
		return;
	}

	if (!isDefined(self.weapon_slots) || slot > self.weapon_slots.size)
	{
		return;
	}

	weapon = self.weapon_slots[slot - 1];

	if (!isDefined(weapon) || weapon == "none" || !self hasweapon(weapon))
	{
		return;
	}

	if (weapon == self getcurrentweapon() || self isswitchingweapons())
	{
		return;
	}

	if (self.is_drinking > 0 || self isthrowinggrenade() || self has_powerup_weapon())
	{
		return;
	}

	if (self maps\mp\zombies\_zm_laststand::player_is_in_laststand() || is_true(self.intermission))
	{
		return;
	}

	self switchtoweapon(weapon);
}
