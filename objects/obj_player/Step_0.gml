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
			if (inst.tower == 1) {
				inst.tower = 0;
			} else {
				inst.tower = 1;	
				script_update_tower(inst)

			}
		} else {
			// AIMing
			if (inst.tower == 0) {
				return;	
			}
			
			if (MOVELEFT) {
				inst.tower_angle -= 1;
				if (inst.tower_angle < 0) {
					inst.tower_angle = 359;
				}
			} else if (MOVERIGHT) {
				inst.tower_angle += 1;
				if (inst.tower_angle >= 360) {
					inst.tower_angle = 0;	
				}
			}
			
			script_update_tower(inst)

		}
	}

}