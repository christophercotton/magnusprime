// Requires the obj_star of the tower to update

var star = argument0;
with(star) {

	x_draw = x + 100 * strength * dcos(tower_angle);
	y_draw = y + 100 * strength * dsin(tower_angle);
	targeted_tower = collision_line(x, y, x_draw, y_draw, obj_star, false, true);
	var endx = x_draw;
	var endy = y_draw;
	var deltax = x_draw - x;
	var deltay = y_draw - y;
	if (targeted_tower != noone) {
        while ((abs(deltax) >= 1) || (abs(deltay) >= 1)) {
            deltax /= 2;
            deltay /= 2;
            var found_star = collision_line(x,y,endx,endy,obj_star,false,true);
            if (found_star) {
                endx -= deltax;
                endy -= deltay;
                targeted_tower = found_star;
            }else{
                endx += deltax;
                endy += deltay;
            }
        }
    }
	
	
	if (targeted_tower != noone) {
		show_debug_message("targeting " + string(targeted_tower.x) + ", " + string(targeted_tower.y));
	} else {
		show_debug_message("targeting noone");
	}
}

for( var i = 0; i < instance_number(obj_star); i += 1) {
	var current = instance_find(obj_star, i);	
	current.incoming_power = 0;
}

for( var i = 0; i < instance_number(obj_star); i += 1) {
	var current = instance_find(obj_star, i);	
	if (current.tower == 1 && current.targeted_tower != noone) {
		current.targeted_tower.incoming_power += current.strength;	
	}
}
