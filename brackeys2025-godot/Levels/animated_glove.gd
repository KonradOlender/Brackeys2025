extends AnimatedSprite2D


func _process(delta: float) -> void:
	if Input.is_action_pressed("move_right") and $"..".is_on_floor():
		play("walk")
	elif $"..".is_on_floor():
		play("idle")
	
	if Input.is_action_pressed("jump") and $"..".is_on_floor():
		play("jump")
