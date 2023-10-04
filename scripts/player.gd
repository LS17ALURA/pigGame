extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

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
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	#print(direction)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
