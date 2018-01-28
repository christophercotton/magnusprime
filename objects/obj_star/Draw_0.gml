/// @description Insert description here
// You can write your code in this editor

if (tower == 1) {
	draw_set_color(c_aqua);
	draw_set_alpha(0.1);
	draw_circle(x, y, 50 * strength, false);	
	
	draw_set_alpha(1.0);
	draw_set_color(c_red);
	draw_line(x, y, x_draw, y_draw);
}
draw_self();
