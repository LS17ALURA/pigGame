extends Area2D

func _process(delta):
	if($"/root/Itens".vida==0):
		get_tree().change_scene_to_file("res://cenas/game_over_screen.tscn")
	

func _on_body_entered(body):
	get_tree().change_scene_to_file("res://cenas/game_over_screen.tscn")
