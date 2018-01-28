
if (playerNum == 1) {
	//Shortcuts for keypresses
	MOVELEFT = keyboard_check(vk_left);
	MOVERIGHT = keyboard_check(vk_right);
	MOVEUP = keyboard_check(vk_up);
	MOVEDOWN = keyboard_check(vk_down);
	FIRE = keyboard_check(ord("/"));
	AIM = keyboard_check(vk_rshift);	
	
} else {
	//Shortcuts for keypresses
	MOVELEFT = keyboard_check(ord("A"));
	MOVERIGHT = keyboard_check(ord("D"));
	MOVEUP = keyboard_check(ord("W"));
	MOVEDOWN = keyboard_check(ord("S"));
	FIRE = keyboard_check(vk_space);		
	AIM = keyboard_check(ord("C"));		
}


if (!AIM) {
	//Move Player
	if (MOVELEFT && x > 0) 
	{ 
	    x -= playerSpeed; 
	}

	if (MOVERIGHT && x < room_width - sprite_width) 
	{ 
	    x += playerSpeed; 
	}

	if (MOVEUP && y > 0) 
	{ 
	    y -= playerSpeed; 
	}

	if (MOVEDOWN && y < room_height - sprite_height) 
	{ 
	    y += playerSpeed; 
	}
}
// show_debug_message("room_width " + string(room_width) + " room_height " + string(room_height) + "  " + string(x) + ", " + string(y));
