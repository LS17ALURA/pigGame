extends CanvasLayer

@onready var pausar_btn = $menu/pausar_btn
# Called when the node enters the scene tree for the first time.
func _ready():
	visible=false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pausar_btn_pressed():
	get_tree().paused = false
	visible = false


func _on_sair_btn_pressed():
	get_tree().quit()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible=true
		get_tree().paused = true
		pausar_btn.grab_focus()
