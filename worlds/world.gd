extends Node2D

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player

func _on_player_on_game_started() -> void:
	spawner.timer.start()


func _on_spawner_on_obstacle_crash() -> void:
	player.stopMovement()


func _on_ground_on_ground_player_crash() -> void:
	spawner._stopObstacles()
