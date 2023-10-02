extends Area2D

@onready var transition = $"../transition"

func _on_body_entered(body):
	transition.change_scene() # parei aqui
	get_tree().change_scene_to_file("res://cenas/level2.tscn")
	$"/root/Itens".macas=0

