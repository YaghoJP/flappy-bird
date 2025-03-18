extends Node2D

signal onPlaneCrashed

@export_category("Variables")
@export var _moveSpeed: float = 150

func _process(_delta: float) -> void:
	position.x -= _moveSpeed * _delta
	
func _on_top_body_entered(body: Node2D) -> void:
	if body is Player:
		onPlaneCrashed.emit()

func _on_bottom_body_entered(body: Node2D) -> void:
	if body is Player:
		onPlaneCrashed.emit()
