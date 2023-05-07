extends CharacterBody2D

var velocidade_movimento = 400

func _ready():
	pass

func _physics_process(_delta):
	print("Teste: ")
	animar()
	mover()
	inverter_player()

func mover():
	var direcao = get_direcao()
	velocity = direcao * velocidade_movimento
	move_and_slide()

func inverter_player():
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.animation = "direita"
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.animation = "direita"
	
	if velocity.y < 0:
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.animation = "cima"
	elif velocity.y > 0:
		$AnimatedSprite2D.flip_v = true
		$AnimatedSprite2D.animation = "cima"
		
	print('Aqui')		
	if velocity.y != 0 and velocity.x != 0:
		print('Aqui')

func animar() -> void:
	if velocity != Vector2.ZERO:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

func get_direcao() -> Vector2:
	return Vector2(
		Input.get_axis("ui_left","ui_right"),
		Input.get_axis("ui_up","ui_down")
	).normalized()
