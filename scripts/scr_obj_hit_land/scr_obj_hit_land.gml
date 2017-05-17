/// @description Check if anything is touching land
var path = argument0;


with(all){
	
	
	for(var i=1; i<path_get_number(path) - 1; i++){
		var x1 = path_get_point_x(path,i-1);
		var y1 = path_get_point_y(path,i-1);
		var x2 = path_get_point_x(path,i);
		var y2 = path_get_point_y(path,i);
		if(collision_line(x1,y1,x2,y2,id,false,false)){
			if(id == obj_player.id){
				instance_destroy();
				room_restart();
			} else {
				instance_destroy();	
			}
			show_debug_message("hit land");
		}
	}	
}