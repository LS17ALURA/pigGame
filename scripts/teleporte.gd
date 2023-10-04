extends Area2D

@onready var transition = $"../transition"
@export var next_level: String=""

func _on_body_entered(body):
	if(body.name=="player" and next_level!=""):
		transition.change_scene(next_level) # parei aqui
		#get_tree().change_scene_to_file("res://cenas/level2.tscn")
		$"/root/Itens".macas=0
	else: 
		("No scene loaded")

