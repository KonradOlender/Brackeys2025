extends Area2D

@export var health: float = 1
@export var damage: float = 1
signal enemy_atack_triggered

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func on_ground_slam_triggered(damage: float):
	health -= 1
	if(health <= 0):
		get_parent().destroy()

func _on_body_entered(body):
	if body.has_method("on_spikes_triggered"):
		enemy_atack_triggered.connect(body.on_spikes_triggered)
		enemy_atack_triggered.emit(damage)
