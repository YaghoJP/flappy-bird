extends CanvasLayer
class_name UI

const MEDAL_BRONZE = preload("res://UI/medalBronze.png")
const MEDAL_GOLD = preload("res://UI/medalGold.png")
const MEDAL_SILVER = preload("res://UI/medalSilver.png")

@onready var scoreLabel: Label = %ScoreLabel
@onready var startMenu: Control = $MarginContainer/StartMenu
@onready var gameOverContainer: VBoxContainer = %GameOver
@onready var medalImage: TextureRect = %MedalImage
@onready var currentScore: Label = %CurrentScore
@onready var highScore: Label = %HighScore

func _ready() -> void:
	scoreLabel.text = "0"

func updateScore(_points: int) -> void:
	scoreLabel.text = str(_points)

func gameOver() -> void:
	gameOverContainer.show()
	scoreLabel.hide()

func _on_ok_button_pressed() -> void:
	get_tree().reload_current_scene()

func calculateScore(amount: int, high: int) -> void:
	currentScore.text = str(amount)
	if amount >= 20:
		medalImage.texture = MEDAL_GOLD
	elif amount >= 10:
		medalImage.texture = MEDAL_SILVER
	else:
		medalImage.texture = MEDAL_BRONZE
		
	highScore.text = str(high)
