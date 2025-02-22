extends Area2D
signal ground_slam_triggered
var damage : float = 1

func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area):
	if area.has_method("on_ground_slam_triggered"):
		ground_slam_triggered.connect(area.on_ground_slam_triggered)
		ground_slam_triggered.emit(damage)
