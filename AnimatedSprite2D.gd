extends AnimatedSprite2D
#Não funciona
var colisor_a: PhysicsBody2D
var colisor_b: PhysicsBody2D

func _ready():
	colisor_a = $ColisorSprite2D
	colisor_b = $ColisorSprite2D_2

func troca_animacao(nome_animacao: String):
	colisor_a.set_deferred("disabled", true)
	colisor_b.set_deferred("disabled", true)

	if nome_animacao in ["andando", "nadando"]:
		colisor_a.set_deferred("disabled", false)
		colisor_b.set_deferred("disabled", true)
	elif nome_animacao == "voando":
		colisor_b.set_deferred("disabled", false)
		colisor_a.set_deferred("disabled", true)
#	play(nome_animacao)
