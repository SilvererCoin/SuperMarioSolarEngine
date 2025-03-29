class_name PlayerCameraProperties
extends Resource

@export_group(&"Zoom Variables")
## Whether or not the player can control the zoom amount of the camera.
@export var player_control: bool

## The zoom percentage the camera will consider to be the center of the minimum and maximum. This will be the zoom the camera will be automatically set to if [member player_control] is false.
@export var default_zoom: float = 100

## The maximum zoom percentage the camera can reach. This has no effect if [member player_control] is false.
@export var max_zoom: float = 200
## The minimum zoom percentage the camera can reach. This has no effect if [member player_control] is false.
@export var min_zoom: float = 50

@export var zoom_steps: int = 2

## The speed at which the zoom will follow the [member PlayerCamera.target_zoom].
@export var zoom_follow_speed: float = 5

@export_group(&"Panning Variables")
@export_subgroup(&"Velocity Panning")
## How much the velocity that's added to the position is multiplied by. Set to [code]0[/code] to disable velocity panning.
@export var velocity_pan_factor: float = 8

## The speed at which the velocity panning catches up with the passed velocity.
@export var pan_follow_speed: float = 2

@export_group(&"Camera Limits")

## Defines the limits of where the camera can go.
@export var camera_limits : Rect2

## Gets the zoom step for zooming the camera in.
func get_zoom_in_step(target_zoom : float) -> float:
	if target_zoom <= default_zoom:
		return (default_zoom-min_zoom)/zoom_steps
	else:
		return (max_zoom-default_zoom)/zoom_steps

## Gets the zoom step for zooming the camera out.
func get_zoom_out_step(target_zoom : float) -> float:
	if target_zoom < default_zoom:
		return (default_zoom-min_zoom)/zoom_steps
	else:
		return (max_zoom-default_zoom)/zoom_steps
