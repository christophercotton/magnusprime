/// @description Insert description here
// You can write your code in this editor

if (tower == 1) {
	draw_set_color(c_aqua);
	draw_set_alpha(0.2);
	draw_circle(x, y, 50 * strength, false);	
	
	draw_set_alpha(1.0);
	draw_set_color(c_red);
	draw_line(x, y, x_draw, y_draw);
	image_blend = c_red;
} else {
	if (incoming_power >= strength) {
		image_blend = c_orange;	
	} else {
		image_blend = c_white;
	}
}
draw_self();
