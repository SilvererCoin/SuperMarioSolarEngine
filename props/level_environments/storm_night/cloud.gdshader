shader_type canvas_item;


uniform sampler2D displacement_map: repeat_enable;


void vertex() {
	VERTEX += (texture(displacement_map, UV + vec2(TIME * -.01, 0)).rg - vec2(.5)) * 12.0 * (UV.x * .5 + .5);
}