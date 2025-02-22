extends CharacterBody2D

@export var speed := 350
@export var hp := 10
const FLOATY_GRAVITY := 100

@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_ground : float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_ground * jump_time_to_ground)) * -1.0
var based_fall_gravity
var is_slaming: bool = false
var is_jumping: bool = false

func _ready() -> void:
	based_fall_gravity = fall_gravity

func _physics_process(delta: float) -> void:
	
	if is_on_floor():
		is_jumping = false
		fall_gravity = based_fall_gravity
		if is_slaming:
			is_slaming = false
			
	#actual momvement
	var direction := Vector2(0,0)
	direction.x = 1 if Input.is_action_pressed("move_right") else 0
	velocity.x = direction.x * speed 
	
	
	#jumping
	if !Input.is_action_pressed("jump"):
		velocity.y += get_gravity_fall() * delta
	#velocity.y += get_gravity_jump() * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
		
	if is_jumping == true && Input.is_action_just_pressed("ground_slam"):
		ground_slam()
		
	
	move_and_slide()
	
func get_gravity_jump() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
func get_gravity_fall() -> float:
	return fall_gravity
	
func jump():
	is_jumping = true
	velocity.y = jump_velocity

func take_damage(damage := 1):
	hp -= damage
	print_debug(hp)

func on_spikes_triggered(damage):
	take_damage(damage)
	
func ground_slam():
	is_slaming = true
	fall_gravity *= 10
