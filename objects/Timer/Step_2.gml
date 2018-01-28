/// @description Insert description here
// You can write your code in this editor

show_debug_message("timer end step");

var player1 = instance_find(obj_player, 0);
var player2 = instance_find(obj_player, 1);

if (player1.AIM || player2.AIM) {
	if (!audio_is_playing(snd_tower_rotate)) {
		audio_play_sound(snd_tower_rotate, 10, true);	
	}
	
} else {
	audio_stop_sound(snd_tower_rotate);	
	
}


if (player1.MOVEX != 0 || player1.MOVEY != 0 || player2.MOVEX != 0 || player2.MOVEY != 0  ) {
	if (!audio_is_playing(snd_engine_idle)) {
		audio_play_sound(snd_engine_idle, 10, true);	
	}
	
} else {
	audio_stop_sound(snd_engine_idle);	
	
}