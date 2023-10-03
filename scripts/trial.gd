extends Line2D
class_name Class
const MAX_POINTS := 3000
@onready var trail := Curve2D.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	trail.add_point(get_parent().position)
	if trail.get_baked_points().size() > MAX_POINTS:
		trail.remove_point(0)
	points = trail.get_baked_points()
	
static func create_trail() -> Class:
	var trail_scene = preload("res://cenas/trial.tscn")
	return trail_scene.instantiate()
	
func _on_tempo_trail_timeout():
	set_process(false)
	var fade_tween = get_tree().create_tween()
	fade_tween.tween_property(self, "modulate:a", 0.0, 0.5)
	await fade_tween.finished
	queue_free()
