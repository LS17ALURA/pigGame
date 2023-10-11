extends Area2D

@onready var apple_collect_sfx = $apple_collect as AudioStreamPlayer

var hasPlayed = false

# Variável para controlar se o som já foi tocado
var soundPlayed = false

# Variável para controlar o tempo restante antes de destruir o nó
var timeToDestroy = 0.05  # Tempo em segundos

# Called when the node enters the scene tree for the first time.
func _ready():
	# Zera sempre que reinicia o jogo
	$"/root/Itens".macas = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hasPlayed and !soundPlayed:
			apple_collect_sfx.play()
			soundPlayed = true
	if soundPlayed:
		timeToDestroy -= delta
		if timeToDestroy <= 0:
			$"/root/Itens".macas += 1
			queue_free()  # Libera o nó após o tempo especificado

func _on_body_entered(body):
	if not hasPlayed:
			hasPlayed = true
