extends Node2D
class_name Ground

signal  onGroundPlayerCrash

@onready var game_over: AudioStreamPlayer = $GameOver

@export_category("Variables")
@export var _speed: int = -150

@onready var ground_1: Area2D = $Ground1
@onready var ground_2: Area2D = $Ground2
@onready var sprite_2d: Sprite2D = $Ground1/Sprite2D
@onready var sprite_2d2: Sprite2D = $Ground2/Sprite2D

var _width: int

func _ready() -> void:
	_width = sprite_2d.texture.get_width()


func _process(delta: float) -> void:
	ground_1.global_position.x += _speed * delta
	ground_2.global_position.x += _speed * delta
	
	
	if ground_1.global_position.x < -int(_width / 2):
		ground_1.global_position.x = ground_2.global_position.x + _width
	if ground_2.global_position.x < -int(_width / 2):
		ground_2.global_position.x = ground_1.global_position.x + _width


func _on_ground_body_entered(body: Node2D) -> void:
	onGroundPlayerCrash.emit()
	if body is Player:
		game_over.play()
		_speed = 0
		var _playerRef = body as Player
		_playerRef.stopMovement()
		_playerRef.stopGravity()
