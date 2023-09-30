extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Itens".vida=100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	queue_free()
	$"/root/Itens".vida=100
