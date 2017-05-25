/// @description Control F16

// Remove instance if too far from player
if(instance_exists(obj_player)){
	if(distance_to_object(obj_player) > 1000){
		instance_destroy(id);
	}
	// Move toward player
	move_towards_point(obj_player.x, obj_player.y, sp);
	
	image_xscale = obj_player.x < x ? 1 : -1;
}

