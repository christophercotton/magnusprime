/// @description Insert description here
// You can write your code in this editor



var inst = instance_nearest(x, y, obj_star);
if (inst != noone) {
	draw_line(x, y, inst.x, inst.y);	
}

draw_self();