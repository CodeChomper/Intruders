/// @description
/// @arg land_path
/// @arg color

var p_land = argument0;
var color = argument1;

var points = path_get_number(p_land);
var pre_x = path_get_point_x(p_land,0);
var pre_y = path_get_point_y(p_land,0);

draw_set_color(color);

//Draw Triangles to show the land
for(var i=1; i<points; i++){
	var cur_x = path_get_point_x(p_land,i);
	var cur_y = path_get_point_y(p_land,i);
	
	// Need two triangles
	draw_triangle(pre_x,room_height,pre_x,pre_y,cur_x,cur_y,false);
	draw_triangle(pre_x,room_height,cur_x,cur_y,cur_x,room_height,false);
	
	//leap frog
	pre_x = cur_x;
	pre_y = cur_y;
}
