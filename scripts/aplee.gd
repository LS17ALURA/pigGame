extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/LabelMacas".text = str($"/root/Itens".macas)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print($"/root/Itens".macas)


func _on_body_entered(body):
	queue_free()
	$"/root/Itens".macas+=1
	$"/root/LabelMacas".text = str($"/root/Itens".macas)
