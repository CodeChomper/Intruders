/// @description Spawn F16s
if(instance_exists(obj_player)){
	if(instance_number(obj_f16) < 2){
		var tmp_x = obj_player.x + random_range(400,999);
		var tmp_y = random_range(50,400);
		instance_create_layer(tmp_x,tmp_y,"Instances",obj_f16);
	}
}