var starGridX = 200;
var starGridY = 150;
var file;
var result = "";

show_debug_message("loading file");
file = file_text_open_read(working_directory + "game.txt");
while (!file_text_eof(file)) {
	var line = file_text_readln(file);
	result += line;
};
file_text_close(file);

var json = json_decode(result);

var stars = ds_map_find_value(json, "stars");
for (var i = 0; i < ds_list_size(stars); i++;) {
	var star = ds_list_find_value(stars, i);
	var starX = star[?"x"];
	var starY = star[?"y"];
	show_debug_message("star " + string(i) + " x,y: " + string(starX) + ", " + string(starY));
	var inst = instance_create_layer(starX * room_width/starGridX, starY * room_height/starGridY, "Instances", obj_star);
	inst.strength = star[?"strength"];
	inst.tower = star[?"tower"];
	inst.tower_angle = star[?"tower_angle"];
}

