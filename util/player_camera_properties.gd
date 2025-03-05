class_name PlayerCameraProperties
extends Resource

@export_group(&"Zoom Variables")
@export_subgroup(&"Zoom Flags")
@export var set_zoom: bool
@export var player_control: bool

@export_subgroup(&"")
## Zoom initially set when the properties are loaded. Requires [member set_zoom] to be active.
@export var zoom_set: float = 100

@export var zoom_max: float = 200
@export var zoom_min: float = 50

@export var zoom_follow_speed: float = 5.0

@export_group(&"Panning Variables")
@export_subgroup(&"Velocity Panning")
## How much the velocity that's added to the position is multiplied by. Set to [code]0[/code] to disable velocity panning.
@export var velocity_pan_factor: float = 8.0

## The speed at which the velocity panning catches up with the passed velocity.
@export var pan_follow_speed: float = 2.0

@export_group(&"Camera Limits")

## Defines the limits of where the camera can go.
@export var camera_limits : Rect2
