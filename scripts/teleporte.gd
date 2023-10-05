extends Area2D

@onready var transition = $"../transition"
@export var next_level: String=""

func _process(delta):
	if($"/root/Itens".vida==0):
		get_tree().change_scene_to_file("res://cenas/game_over_screen.tscn")

func _on_body_entered(body):
	if(body.name=="player" and next_level!=""):
		transition.change_scene(next_level) # parei aqui
		$"/root/Itens".macas=0
	else: 
		("No scene loaded")

