extends CanvasLayer
class_name UI

@onready var scoreLabel: Label = %ScoreLabel
@onready var startMenu: Control = $MarginContainer/StartMenu
@onready var gameOverContainer: VBoxContainer = %GameOver

func _ready() -> void:
	scoreLabel.text = "0"

func updateScore(_points: int) -> void:
	scoreLabel.text = str(_points)

func gameOver() -> void:
	gameOverContainer.show()
	scoreLabel.hide()

func _on_ok_button_pressed() -> void:
	get_tree().reload_current_scene()
