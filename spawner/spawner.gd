extends Node2D
class_name Spawner

signal onObstacleCrash
signal playerScored

const OBSTACLE = preload("res://obstacles/obstacle.tscn")
@onready var timer: Timer = $Timer

func createObstacle() -> void:
	var _obs = OBSTACLE.instantiate()
	_obs.onPlaneCrashed.connect(_on_plane_crash)
	_obs.playerScored.connect(_on_player_scored)
	var _viewport: Rect2 = get_viewport_rect()
	_obs.position.x = _viewport.end.x + 150
	
	var _half = _viewport.size.y / 2
	_obs.position.y = randf_range(_half + 240, _half -50)
	
	add_child(_obs)
	
func _on_player_scored() -> void:
	playerScored.emit()

func _on_timer_timeout() -> void:
	createObstacle()
	
func _stopObstacles() -> void:
	timer.stop()
	
	for _obs: Obstacle in get_children().filter(func(x): return x is Obstacle):
		_obs.setSpeed(0)

func _on_plane_crash() -> void:
	onObstacleCrash.emit()
	_stopObstacles()
