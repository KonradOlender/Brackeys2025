extends AnimatedSprite2D


func _process(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		play("walk")
	else:
		play("idle")
