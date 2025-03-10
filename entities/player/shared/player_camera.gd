class_name PlayerCamera
extends Camera2D

@export var default_camera_properties : PlayerCameraProperties

@export var zoom_in_sfx: SFXLayer
@export var zoom_out_sfx: SFXLayer

## Current camera properties
@onready var camera_properties : PlayerCameraProperties = default_camera_properties

## This variable is set in [code]world_machine.tscn[/code].
var player: Player

## The current camera zoom in percentage.
## (Note: higher zoom percentage means you can see more level.)
var zoom_percentage: float = 100

## The zoom value the camera gets tweened to.
var target_zoom: float = 100

## Current position (relative to the player) of the camera set by the velocity.
var velocity_offset: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	zoom_percentage = lerp(zoom_percentage, 
		target_zoom,
		Math.interp_weight_idp(camera_properties.zoom_follow_speed, delta)
	)

	var zoom_factor: float = 1 / (zoom_percentage / 100)

	zoom = Vector2(zoom_factor, zoom_factor)

	velocity_offset = velocity_offset.lerp(
		player.velocity * delta * camera_properties.velocity_pan_factor,
		Math.interp_weight_idp(camera_properties.pan_follow_speed, delta)
	)

	position = velocity_offset


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"camera_zoom_in"):
		if target_zoom != camera_properties.min_zoom:
			zoom_in_sfx.play_sfx_at(self)

		target_zoom -= camera_properties.get_zoom_in_step(target_zoom)

	if event.is_action_pressed(&"camera_zoom_out"):
		if target_zoom != camera_properties.max_zoom:
			zoom_out_sfx.play_sfx_at(self)

		target_zoom += camera_properties.get_zoom_out_step(target_zoom)

	target_zoom = clamp(target_zoom, camera_properties.min_zoom, camera_properties.max_zoom)
