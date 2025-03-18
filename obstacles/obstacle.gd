extends Node2D
class_name Obstacle

signal onPlaneCrashed
signal playerScored

@onready var hit_sound: AudioStreamPlayer = $HitSound
@onready var score_sound: AudioStreamPlayer = $ScoreSound

@export_category("Variables")
@export var _moveSpeed: float = 150

func _process(_delta: float) -> void:
	position.x -= _moveSpeed * _delta
	
func _on_top_body_entered(body: Node2D) -> void:
	if body is Player:
		hit_sound.play()
		onPlaneCrashed.emit()

func _on_bottom_body_entered(body: Node2D) -> void:
	if body is Player:
		hit_sound.play()
		onPlaneCrashed.emit()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func setSpeed(_value: float) -> void:
	_moveSpeed = _value
	pass


func _on_score_body_entered(body: Node2D) -> void:
	if body is Player:
		playerScored.emit()
		score_sound.play()
