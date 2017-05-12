/// @desc Generate_Land
/// @arg iterations
/// @arg displacement
/// @arg decrease
/// @arg elevation_start
/// @arg elevation_end
/// @arg land_start_x
/// @arg land_length

var iterations = argument0;
var displacment = argument1;
var reduce = argument2;
var elevation_start = room_height - argument3;
var elevation_end = room_height - argument4;
var land_start_x = argument5;
var land_length = argument6;

var p_land = path_add();

var height_padding = room_height * 0.25;

// Set the first two end points
path_add_point(p_land, land_start_x, elevation_start, 100); // speed isn't used
path_add_point(p_land, land_start_x + land_length, elevation_end, 100);

while(iterations > 0){
	var num_segs = path_get_number(p_land); // only one the first time
	// for each segment split in half and displace
	// This is where mid point displacment gets it's name
	for(var i=1; i<num_segs; i+=2){
		//Compute midpoint
		var lbx = path_get_point_x(p_land,i-1);
		var lby = path_get_point_y(p_land,i-1);
		var ubx = path_get_point_x(p_land,i);
		var uby = path_get_point_y(p_land,i);
		
		var mid_point_x = ubx - ((ubx - lbx) / 2);
		
		// Compute segment length
		var segment_length = mid_point_x - lbx;
		
		// Compute slope of segment
		var slope = (uby - lby) / (ubx - lbx);
		
		// Compute y at midpoint
		var mid_point_y = (segment_length * slope) + lby;
		
		// Displace y
		mid_point_y += random_range(-displacment, displacment); 
		
		// Insert point at midpoint with new y value
		path_insert_point(p_land,i,mid_point_x,mid_point_y,100);
		
		// Number of segments just went up
		num_segs++;
	}
	displacment -= reduce;
	iterations--;
}

return p_land;