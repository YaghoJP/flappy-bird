extends Node2D

const SAVE_FILE: String = "user://score.save"

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var ui: UI = $UI

var _score: int = 0
var _highScore: int = 0

func _ready() -> void:
	_loadHighScore()


func _loadHighScore() -> void:
	var file: FileAccess = FileAccess.open(SAVE_FILE, FileAccess.READ)
	
	if file:
		_highScore = file.get_32()

func _saveScore() -> void:
	if _score > _highScore:
		_highScore = _score
		var file: FileAccess = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
		file.store_32(_highScore)

func _on_player_on_game_started() -> void:
	spawner.timer.start()
	ui.startMenu.hide()

func _on_spawner_on_obstacle_crash() -> void:
	player.stopMovement()

func _on_ground_on_ground_player_crash() -> void:
	spawner._stopObstacles()
	_loadHighScore()
	ui.gameOver()
	ui.calculateScore(_score, _highScore)

func _on_spawner_player_scored() -> void:
	_score += 1
	ui.updateScore(_score)
	_saveScore()
