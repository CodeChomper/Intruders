/// @description Control player

//Add speed based on input
xspd += obj_controls.x_axis * POW;
yspd += obj_controls.y_axis * POW;

//Add drag
xspd += xspd > 0 ? -DRAG : DRAG;
xspd = abs(xspd) > DRAG ? xspd : 0;
yspd += yspd > 0 ? -DRAG : DRAG;
yspd = abs(yspd) > DRAG ? yspd : 0;

//Cap x and y speed to max_speed
if(xspd > max_speed) xspd = max_speed;
if(xspd < -max_speed) xspd = -max_speed;
if(yspd > max_speed) yspd = max_speed;
if(yspd < -max_speed) yspd = -max_speed;

//Add the speeds to the position.
x+= xspd;
y+= yspd;


// Handle flipping
if(xspd > 0){ 
	image_xscale = 1;
	facing_right = true;
}
if(xspd < 0){ 
	image_xscale = -1;
	facing_right = false;
}

if(obj_controls.fire){
	tmp_laz = instance_create_layer(x,y-20,"Instances",obj_lazer);
	tmp_laz.xspd = facing_right ? xspd + 20 :  xspd - 20 ;
	tmp_laz.x = facing_right ? x+64 : x-64;
}