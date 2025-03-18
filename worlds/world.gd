extends Node2D

@onready var spawner: Spawner = $Spawner

func _on_player_on_game_started() -> void:
	spawner.timer.start()
