extends CharacterBody2D

@export var speed := 350
const FLOATY_GRAVITY := 100

func _physics_process(delta: float) -> void:
	var direction := Vector2(0,0)
	
	
	#actual momvement
	direction.x = 1 if Input.is_action_pressed("move_right") else 0
	direction.y = Input.get_axis("move_up", "move_down")
	
	velocity = direction * speed 
	
	if not is_on_floor():
		velocity.y += FLOATY_GRAVITY
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y = -5000
			
	
	
	move_and_slide()
