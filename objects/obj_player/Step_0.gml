/// @description Insert description here
// You can write your code in this editor

script_movement();

 
if (FIRE || AIM) {
	
	var inst = instance_nearest(x, y, obj_star);
	if (inst != noone) {
		if (abs(x - inst.x) > sprite_width || abs(y - inst.y) > sprite_height) {
			return;
		}
	
	
		if (FIRE) {
			if (inst.tower == 1 && inst.num_active>1) {
				inst.tower = 0;
				inst.num_active--
				script_update_tower(inst)
				audio_play_sound(snd_destroy_tower, 10, false);
			}
			else if (inst.tower == 1 && inst.num_active <= 1) {
				
			} else {
				if (inst.incoming_power >= inst.strength) {
					inst.tower = 1;	
					audio_play_sound(snd_build_tower,10, false);
					inst.num_active++;
					script_update_tower(inst)
				}
			}
		} else {
			// AIMing
			if (inst.tower == 0) {
				return;	
			}						
			
			if (AIMLEFT) {
				inst.tower_angle -= 1*throttleSpeed;
				if (inst.tower_angle < 0) {
					inst.tower_angle = 359;
				}
			} else if (AIMRIGHT) {
				inst.tower_angle += 1*throttleSpeed;
				if (inst.tower_angle >= 360) {
					inst.tower_angle = 0;	
				}
			}
			
			script_update_tower(inst)

		}
	}

}