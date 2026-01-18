shader_type canvas_item;
render_mode unshaded;

global uniform vec2 viewport_size;

uniform float circle_size : hint_range(0.0, 1.05);


void fragment() {
	float ratio = viewport_size.x / viewport_size.y;
	float dist = distance(vec2(0.5, 0.5), vec2(mix(0.5, UV.x, ratio), UV.y));
	COLOR.a = step(circle_size, dist);
}