/// @description Insert description here
// You can write your code in this editor



var inst = instance_nearest(x, y, obj_star);
if (inst != noone) {
	draw_set_color(c_aqua);
	draw_set_alpha(0.5);
	draw_line(x, y, inst.x, inst.y);	
	draw_set_alpha(1.0);
}

draw_self();