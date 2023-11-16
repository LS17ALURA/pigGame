extends Area2D

@onready var water_sfx = $water_sfx as AudioStreamPlayer

var initial_position = Vector2(10, 450)

# Volume desejado (em dB, valor negativo para diminuir o volume)
var volume_db = -30  

func _on_body_entered(body):
	if body.name == "player":
		water_sfx.volume_db = volume_db  # Ajuste o volume do som
		water_sfx.play()
		print("Player Caiu")
		# Reposicione o jogador para a posição inicial.
		var player = body
		player.global_position = initial_position
		if $"/root/Itens".vida < 25:
			$"/root/Itens".vida=0
		else:
			$"/root/Itens".vida -= 25
