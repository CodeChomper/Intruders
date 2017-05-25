/// @description Insert obj_lazer_frag
x_off = xspd > 0 ? 32 : -32;
var tmp_frag = instance_create_layer(x + x_off,y,"FG_Objects",obj_lazer_frag);
tmp_frag.image_blend = self.image_blend;