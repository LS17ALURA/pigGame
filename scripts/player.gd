extends CharacterBody2D

@onready var jump_sfx=$jump_sfx as AudioStreamPlayer
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var can_jump := true
@onready var coyote_timer = $coyote_timer as Timer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#var current_trail : Class

func show_trail () -> void:
	#current_trail = Class.create_trail()
	#add_child(current_trail)
	pass
	
func _physics_process(delta):
	if(self.global_position.x <= 2):
		self.global_position.x+= 10
		
	if(self.global_position.x >= 2487):
		self.global_position.x-= 10
		
	if(self.global_position.y <= 2):
		self.global_position.y+= 10
		
	if Input.is_action_just_pressed("ui_left"):
		if $"/root/Itens".esquerda == 1:
			$"/root/Itens".esquerda = 0
			$"/root/Itens".direita = 1
			self.scale.x *= -1
	if Input.is_action_just_pressed("ui_right"):
		if $"/root/Itens".direita == 1:
			$"/root/Itens".direita = 0
			$"/root/Itens".esquerda = 1
			self.scale.x *= -1
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and can_jump:
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()
		
	if is_on_floor() and !can_jump:
		can_jump = true
	elif can_jump and coyote_timer.is_stopped():
		coyote_timer.start()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	#print(direction)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_coyote_timer_timeout():
	can_jump = false
