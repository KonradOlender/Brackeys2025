extends CharacterBody2D

@export var speed: float = 10
var is_facing_right: bool = false

func _physics_process(delta: float) -> void:
	if position.x >= $"../Marker1".position.x - 10 && position.x <= $"../Marker1".position.x + 10:
		is_facing_right = true
	elif position.x >= $"../Marker2".position.x - 10 && position.x <= $"../Marker2".position.x + 10:
		is_facing_right = false
		
	if is_facing_right:
		velocity.x = 1 * speed
	else:
		velocity.x = -1 * speed
	
	move_and_slide()
	
func destroy():
	queue_free()
