extends Node2D

const WAIT_DURATION : = 1.0
@onready var platform := $platform as AnimatableBody2D
@export var move_speed := 7.0
@export var distance := 150
@export var move_horizontal := true

var follow := Vector2.ZERO
var platform_center := 24
func _ready() -> void:
	move_platform()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	platform.position = platform.position.lerp(follow, 0.2)
	
func move_platform():
	var move_direction = Vector2.RIGHT * distance if move_horizontal else Vector2.UP * distance
	var duration = move_direction.length() / float (move_speed * platform_center)
	
	var platform_tween = create_tween ().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	platform_tween.tween_property(self, "follow", move_direction, duration).set_delay(WAIT_DURATION)
	platform_tween.tween_property(self, "follow", Vector2.ZERO, duration).set_delay(duration * WAIT_DURATION * 2)
