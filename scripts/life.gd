extends Area2D

@onready var life_collect_sfx = $life_collect_sfx as AudioStreamPlayer

var hasPlayed = false

# Variável para controlar se o som já foi tocado
var soundPlayed = false

# Variável para controlar o tempo restante antes de destruir o nó
var timeToDestroy = 0.05  # Tempo em segundos

# Called when the node enters the scene tree for the first time.
func _ready():
	# Reseta sempre que reinicia o jogo
	$"/root/Itens".vida = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hasPlayed and !soundPlayed:
		life_collect_sfx.play()
		soundPlayed = true
	if soundPlayed:
		timeToDestroy -= delta
		if timeToDestroy <= 0:
			$"/root/Itens".vida = 100
			queue_free()  # Libera o nó após o tempo especificado

func _on_body_entered(body):
	if not hasPlayed:
		hasPlayed = true
