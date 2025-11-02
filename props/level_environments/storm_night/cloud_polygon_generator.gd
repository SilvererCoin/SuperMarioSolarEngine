@tool
extends Polygon2D


@export var points: int = 48
@export var size: Vector2 = Vector2(256, 32)
@export_tool_button("Generate Polygon") var gen_poly: Callable = generate


func _ready() -> void:
	generate()


func generate():
	var poly: PackedVector2Array = []
	for point in range(points):
		var time: float = remap(point / float(points), 0, 1, 0, TAU)
		poly.push_back(Vector2(size.x / 2.0 * -cos(time), size.y / 2.0 * sin(time)))
	
	polygon = poly
