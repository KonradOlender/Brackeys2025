extends CharacterBody2D

@export var speed := 350
const FLOATY_GRAVITY := 100

@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_ground : float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_ground * jump_time_to_ground)) * -1.0
var is_jumping: bool = false


func _physics_process(delta: float) -> void:
	
	#actual momvement
	var direction := Vector2(0,0)
	direction.x = 1 if Input.is_action_pressed("move_right") else 0
	velocity.x = direction.x * speed 
	
	#jumping
	if !Input.is_action_pressed("jump"):
		velocity.y += get_gravity_fall() * delta
	velocity.y += get_gravity_jump() * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
	
	move_and_slide()
	
func get_gravity_jump() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
func get_gravity_fall() -> float:
	return fall_gravity
	
func jump():
	is_jumping = true
	velocity.y = jump_velocity
