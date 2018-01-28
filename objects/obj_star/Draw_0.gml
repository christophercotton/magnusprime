/// @description Insert description here
// You can write your code in this editor

if (tower == 1) {
	draw_set_color(c_aqua);
	draw_set_alpha(0.2);
	draw_circle(x, y, 50 * strength, false);	
	
	draw_set_alpha(1.0);
	draw_set_color(c_red);
	draw_line(x, y, endx, endy);
	image_blend = c_red;
} else {
	if (incoming_power >= strength) {
		image_blend = c_orange;	
	} else {
		if (strength == 1) {
			image_blend = make_color_rgb(100, 100, 0);	
		} else if (strength == 2) {
			image_blend = make_color_rgb(150, 150, 0);	
		} else if (strength == 3) {
			image_blend = make_color_rgb(225, 225, 0);	
		} else if (strength == 4) {
			image_blend = make_color_rgb(255, 255, 0);	
		}
	}
}
draw_self();
