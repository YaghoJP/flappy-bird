extends Node2D
class_name Spawner

const OBSTACLE = preload("res://obstacles/obstacle.tscn")
@onready var timer: Timer = $Timer

func createObstacle() -> void:
	var _obs = OBSTACLE.instantiate()
	
	var _viewport: Rect2 = get_viewport_rect()
	_obs.position.x = _viewport.end.x + 150
	
	var _half = _viewport.size.y / 2
	_obs.position.y = randf_range(_half + 240, _half -50)
	
	add_child(_obs)
	
func _on_timer_timeout() -> void:
	createObstacle()
	pass # Replace with function body.
