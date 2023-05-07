extends Area2D

@export var speed = 400
var screen_size 

func _ready():
	print("Teste: ")
	screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	print("Teste: ", $AnimatedSprite2D.get_physics_process_delta_time())
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "direita"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	if velocity.y != 0:
		$AnimatedSprite2D.animation = "cima"
		$AnimatedSprite2D.flip_v = velocity.y > 0
		$AnimatedSprite2D.flip_h = false
		
	position += velocity * delta
	position.x = clamp(position.x, 40, screen_size.x-40)
	position.y = clamp(position.y, 40, screen_size.y-60)

