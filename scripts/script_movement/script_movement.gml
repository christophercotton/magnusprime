
if (playerNum == 1) {
	//Shortcuts for keypresses
	MOVELEFT = keyboard_check(vk_left);
	MOVERIGHT = keyboard_check(vk_right);
	MOVEUP = keyboard_check(vk_up);
	MOVEDOWN = keyboard_check(vk_down);
	FIRE = keyboard_check_pressed(191); // slash /
	AIM = keyboard_check(vk_rshift);
	if (AIM && MOVELEFT) {
		AIMLEFT = true;
	} else {
		AIMLEFT = false;
	}

	if (AIM && MOVERIGHT) {
		AIMRIGHT = true;	
	} else {
		AIMRIGHT = false;	
	}

} else {
	//Shortcuts for keypresses
	MOVELEFT = keyboard_check(ord("A"));
	MOVERIGHT = keyboard_check(ord("D"));
	MOVEUP = keyboard_check(ord("W"));
	MOVEDOWN = keyboard_check(ord("S"));
	FIRE = keyboard_check_pressed(vk_space);		
	AIM = keyboard_check(ord("C"));		
}

var device = playerNum - 1;
if (gamepad_is_connected(device)) {
	if (gamepad_axis_value(device, gp_axislh) < -0.2) {
		MOVELEFT = true
		MOVERIGHT = false
	} else if (gamepad_axis_value(device, gp_axislh) > 0.2) {
		MOVELEFT = false
		MOVERIGHT = true
	}


	if (gamepad_axis_value(device, gp_axislv) < -0.2) {
		MOVEUP = true
		MOVEDOWN = false
	} else if (gamepad_axis_value(device, gp_axislv) > 0.2) {
		MOVEUP = false
		MOVEDOWN = true
	}
	
	AIMRIGHT = gamepad_button_value(device, gp_shoulderrb);
	AIMLEFT = gamepad_button_value(device, gp_shoulderlb);
	AIM = AIMRIGHT || AIMLEFT;
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
