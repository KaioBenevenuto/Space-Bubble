#extends AnimatedSprite2D
#
#@export var speed = 400
#var screen_size 
#
#func _ready():
#	screen_size = get_viewport_rect().size
#
#
#func _process(delta: float) -> void:
#	var velocity = Vector2()
#
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -= 1	
#	if Input.is_action_pressed("ui_down"):
#		velocity.y += 1
#
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * speed
#		play()
#	else:
#		stop()
#
#	if velocity.x != 0:
#		animation = "direita"
#		flip_v = false
#		flip_h = velocity.x < 0
#	if velocity.y != 0:
#		animation = "cima"
#		flip_v = velocity.y > 0
#		flip_h = false
#
#	position += velocity * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
