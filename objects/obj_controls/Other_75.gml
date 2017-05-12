/// @description Check for gamepad
show_debug_message("Async callback system");
// If a controller gets conected or is connected when game starts
if(async_load[?"event_type"] == "gamepad discovered" and 
   gamepad = noone){
	
	gamepad = async_load[?"pad_index"];
	gamepad_set_axis_deadzone(gamepad, DEAD_ZONE);
	show_debug_message("gamepad found");
	show_debug_message("pad_index: " + string(gamepad));
	return;
}

// If a controller is connected and lost
if(async_load[?"event_type"] == "gamepad lost" and
   gamepad != noone){

	gamepad = noone;
	return;
}