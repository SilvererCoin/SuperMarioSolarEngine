shader_type canvas_item;
render_mode unshaded;


uniform sampler2D cloud_texture: repeat_enable;
uniform sampler2D displacement_map: repeat_enable;
uniform sampler2D cloud_color_map;

uniform vec2 uv_scale = vec2(1.0);


void fragment() {
	vec2 scaled_uv = UV * uv_scale;
	
	float sine = (cos(radians(scaled_uv.x) * 72.0) / 2.0 + .5) / -4.0;
	vec2 cloud_uv = vec2(scaled_uv.x + TIME / 20.0, scaled_uv.y + sine);
	
	vec2 displacement_uv = vec2(scaled_uv.x + TIME / 40.0, scaled_uv.y + sine);
	cloud_uv += texture(displacement_map, displacement_uv).rg - vec2(.5);
	
	COLOR = texture(cloud_color_map, texture(cloud_texture, vec2(cloud_uv.x, clamp(cloud_uv.y, 0.0, 1.0))).rg);
	COLOR.a = texture(cloud_texture, vec2(cloud_uv.x, clamp(cloud_uv.y, 0.0, 1.0))).a;
	//COLOR.rgb = vec3(cloud_uv.x, cloud_uv.y, 1.0);
}
