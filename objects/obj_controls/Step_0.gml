/// @description Get Controller Input

//Use Gamepad if connected
if(gamepad != noone and gamepad_is_connected(gamepad)){
	x_axis = gamepad_axis_value(gamepad, gp_axislh);
	y_axis = gamepad_axis_value(gamepad, gp_axislv);
	fire = gamepad_button_check_released(gamepad, gp_shoulderrb);
} else {
	x_axis = keyboard_check(vk_right) - keyboard_check(vk_left);
	y_axis = keyboard_check(vk_down) - keyboard_check(vk_up);
	fire = keyboard_check(vk_space);
}