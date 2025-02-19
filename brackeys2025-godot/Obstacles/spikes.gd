extends Area2D
signal spikes_triggered
var damage := 1


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body.has_method("on_spikes_triggered"):
		spikes_triggered.connect(body.on_spikes_triggered)
	spikes_triggered.emit(damage)
