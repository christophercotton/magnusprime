/// @description Insert description here
// You can write your code in this editor
draw_set_font(c_lime);
if (RTime < 10) {
	draw_text(defx,defy,string(minutehand)+":0"+string(RTime));
}
else if (RTime >= 60) {
	RTime = 0;
	minutehand++;
	draw_text(defx,defy,string(minutehand)+":00");
}
else {
	draw_text(defx,defy,string(minutehand)+":" + string(RTime));
}