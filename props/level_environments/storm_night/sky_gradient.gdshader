shader_type canvas_item;
render_mode unshaded;


uniform sampler2D gradient;
uniform sampler2D curve;
uniform float horizon: hint_range(0.0, 1.0, 0.001) = 0.0;
uniform bool draw_horizon = false;


void fragment() {
	float y_offset = texture(curve, UV).r;
	float horizon_distance = abs(horizon - UV.y);
	
	COLOR = texture(gradient, vec2(UV.y + (y_offset * horizon_distance) , 0.0));
	
	if (draw_horizon && abs(UV.y - horizon) <= .002) {
		COLOR = vec4(1.0, 0.0, 0.0, 1.0);
	}
}
