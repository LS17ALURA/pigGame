extends Label


# Called when the node enters the scene tree for the first time.
var font = load("res://Assets/fonts/m6x11.ttf")

func _ready():
	self.global_position . x = 100
	self.global_position.y = 50
	self.add_theme_font_override("font", font)
	self.add_theme_font_size_override("font_size", 38)
	self.add_theme_color_override("font_color", "green")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text="Maçãs: "+str($"/root/Itens".macas)
