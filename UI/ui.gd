extends CanvasLayer
class_name UI

@onready var label: Label = %Label
@onready var start_menu: Control = $MarginContainer/StartMenu

func _ready() -> void:
	label.text = "0"

func updateScore(_points: int) -> void:
	label.text = str(_points)
