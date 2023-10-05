extends Area2D

var initial_position = Vector2(10, 450)

func _on_body_entered(body):
	if body.name == "player":
		print("Player Caiu")
		# Reposicione o jogador para a posição inicial.
		var player = body
		player.global_position = initial_position
		$"/root/Itens".vida-=25
