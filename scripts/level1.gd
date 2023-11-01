extends Node2D

@onready var player:=$player as CharacterBody2D
#@onready var camera:=$camera as Camera2D
# Called when the node enters the scene tree for the first time.
func _ready():
#	player.follow_camera(camera)
	pass


func _on_spikearea_body_entered(body):
	if body.name == "player" && body.has_method("take_damage"):
		body.take_damage(Vector2(0, -250))

