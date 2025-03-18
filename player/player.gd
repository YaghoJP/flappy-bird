extends CharacterBody2D
class_name Player

signal onGameStarted

@export_category("Variables")
@export var _gravity: float = 1000
@export var _jumpForce: float = -400
@export var _maxSpeed: float = 400
@export var _rotationSpeed: float = 2

var _isStarted: bool = false
var _shouldProcess: bool = true

func _physics_process(_delta: float) -> void:
	
	#Verificando o input do player
	if Input.is_action_just_pressed("jump") and _shouldProcess:
		velocity.y = _jumpForce
		rotation = deg_to_rad(-30)
		if not _isStarted:
			_isStarted = true
			onGameStarted.emit()
	
	if not _isStarted:
		return
	
	#Aplicando a gravidade
	velocity.y += _gravity * _delta
	velocity.y = min(velocity.y, _maxSpeed)	#retorna o menor dos 2 valores.


	#movendo o jogador
	move_and_slide()

	#fazendo a animação de rotação do jogador.
	rotatePlayer(_delta)
	
func rotatePlayer(_delta: float) -> void:
	if velocity.y > 0 and rotation < deg_to_rad(90):
		rotation += _rotationSpeed * _delta

func stopMovement() -> void:
	_shouldProcess = false
	
func stopGravity() -> void:
	_gravity = 0
	velocity = Vector2.ZERO
