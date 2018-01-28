MOVEX = 0
MOVEY = 0


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
	
	if (MOVELEFT) {
		MOVEX = -1;	
	} else if (MOVERIGHT) {
		MOVEX = 1;
	}
	
	if (MOVEUP) {
		MOVEY = -1;
	} else if (MOVEDOWN) {
		MOVEY = 1;
	}

} else {
	//Shortcuts for keypresses
	MOVELEFT = keyboard_check(ord("A"));
	MOVERIGHT = keyboard_check(ord("D"));
	MOVEUP = keyboard_check(ord("W"));
	MOVEDOWN = keyboard_check(ord("S"));
	FIRE = keyboard_check_pressed(vk_space);		
	AIM = keyboard_check(ord("C"));	
	
	if (MOVELEFT) {
		MOVEX = -1;	
	} else if (MOVERIGHT) {
		MOVEX = 1;
	}
	
	if (MOVEUP) {
		MOVEY = -1;
	} else if (MOVEDOWN) {
		MOVEY = 1;
	}

}

var device = playerNum - 1;
if (gamepad_is_connected(device)) {
	if (gamepad_axis_value(device, gp_axislh) < -0.2) {
		MOVEX = gamepad_axis_value(device, gp_axislh)
	} else if (gamepad_axis_value(device, gp_axislh) > 0.2) {
		MOVEX = gamepad_axis_value(device, gp_axislh);
	}


	if (gamepad_axis_value(device, gp_axislv) < -0.2) {
		MOVEY = gamepad_axis_value(device, gp_axislv);
	} else if (gamepad_axis_value(device, gp_axislv) > 0.2) {
		MOVEY = gamepad_axis_value(device, gp_axislv);
	}
	AIMRIGHT = gamepad_button_value(device, gp_shoulderrb);
	AIMLEFT = gamepad_button_value(device, gp_shoulderlb);
	AIM = AIMRIGHT || AIMLEFT;
	FIRE = gamepad_button_check_pressed(device, gp_face1)
}



if (!AIM) {

	if (MOVEX == 0 && MOVEY == 0) {
		return;
	}
	
	MOVE_FACTOR = 2.5;
	
	image_angle = point_direction(0, 0, -MOVEX, -MOVEY) + 90;
	
	if (MOVEX != 0) {
		x += MOVEX * MOVE_FACTOR;	
		if (x < 0) {
			x = 0;	
		} else if (x > room_width - sprite_width) {
			x = room_width - sprite_width;	
		}
	}
	
	if (MOVEY != 0) {
		y += MOVEY * MOVE_FACTOR;	
		if (y < 0) {
			y = 0;	
		} else if (y > room_height - sprite_height) {
			y = room_height - sprite_height;	
		}
	}

}
// show_debug_message("room_width " + string(room_width) + " room_height " + string(room_height) + "  " + string(x) + ", " + string(y));
