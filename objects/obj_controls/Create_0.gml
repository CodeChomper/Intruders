/// @description Init game controls
x_axis = 0;
y_axis = 0;
fire = 0;
gamepad = noone;
DEAD_ZONE = 0.2;

var max_pads = gamepad_get_device_count();
for(var i=0; i<max_pads; i++){
	if(gamepad_is_connected(i)){
		gamepad = i;
		gamepad_set_axis_deadzone(gamepad, DEAD_ZONE);
		return;
	}
}

show_debug_message("Gamepads: " + string(gamepad_get_device_count()));
