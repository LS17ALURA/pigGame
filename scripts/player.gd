extends CharacterBody2D

@onready var jump_sfx=$jump_sfx as AudioStreamPlayer
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var can_jump := true
@onready var coyote_timer = $coyote_timer as Timer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var remote_transform:=$remote as RemoteTransform2D

# var player_life=$"/root/Itens".vida
var knockback_vector:=Vector2.ZERO
	
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
		
	if knockback_vector!=Vector2.ZERO:
		velocity=knockback_vector

	move_and_slide()


func _on_coyote_timer_timeout():
	can_jump = false


func _on_hurtbox_body_entered(body):
#	if body.is_in_group("enemies"):
#		queue_free()
	if $"/root/Itens".vida < 0:
		queue_free()
	else:
		take_damage(Vector2(200,-200))
		
func follow_camera(camera):
	var camera_path = camera.get_path()
	remote_transform.remote_path=camera_path
	
func take_damage(knockback_force:=Vector2.ZERO, duration:=0.25):
	$"/root/Itens".vida-=10
	if knockback_force!=Vector2.ZERO:
		knockback_vector=knockback_force
		var knockback_tween:=get_tree().create_tween()
		knockback_tween.tween_property(self, "knockback_vector", Vector2.ZERO, duration)
