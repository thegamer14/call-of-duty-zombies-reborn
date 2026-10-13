#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

print_vector(v_position)
{
	return "(" + round_to_int(v_position[0]) + ", " + round_to_int(v_position[1]) + ", " + round_to_int(v_position[2]) + ")";
}


round_to_int(value)
{
	if (value < 0)
	{
		return int(value - 0.5);
	}

	return int(value + 0.5);
}


get_command_player()
{
	players = get_players();

	foreach (player in players)
	{
		if (player ishost())
		{
			return player;
		}
	}

	if (players.size > 0)
	{
		return players[0];
	}

	return undefined;
}


is_integer_string(text)
{
	if (!isDefined(text) || text == "" || text.size > 9)
	{
		return 0;
	}

	start = 0;

	if (text[0] == "-")
	{
		if (text.size == 1)
		{
			return 0;
		}

		start = 1;
	}

	for (i = start; i < text.size; i++)
	{
		if (!issubstr("0123456789", text[i]))
		{
			return 0;
		}
	}

	return 1;
}
