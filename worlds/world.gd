extends Node2D

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var ui: UI = $UI

var _score: int = 0

func _on_player_on_game_started() -> void:
	spawner.timer.start()
	ui.start_menu.hide()

func _on_spawner_on_obstacle_crash() -> void:
	player.stopMovement()

func _on_ground_on_ground_player_crash() -> void:
	spawner._stopObstacles()

func _on_spawner_player_scored() -> void:
	_score += 1
	ui.updateScore(_score)
