// Requires the obj_star of the tower to update

var star = argument0
with(star) {
	x_draw = x + 100 * strength * dcos(tower_angle);
	y_draw = y + 100 * strength * dsin(tower_angle);
	targeted_tower = collision_line(x, y, x_draw, y_draw, obj_star, false, true);
	if (targeted_tower != noone) {
		show_debug_message("targeting " + string(targeted_tower.x) + ", " + string(targeted_tower.y));
	} else {
		show_debug_message("targeting noone");
		
	}
}
