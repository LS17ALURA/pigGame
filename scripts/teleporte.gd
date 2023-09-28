extends Area2D




func _on_body_entered(body):
	print ("Player Teleportado!")
	get_tree().change_scene_to_file("res://cenas/level2.tscn")

