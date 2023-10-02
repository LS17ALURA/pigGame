extends CanvasLayer

@onready var color_rect=$ColorRect

func change_scene(path,delay=2.5):
	var scene_trasition=get_tree().create_tween()
	scene_trasition.tween_property(color_rect,"threshold",1.0,0.5)
