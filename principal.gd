extends Node

#@export(PackedScene) var Inimigo
@export var Inimigo: PackedScene
var score

#func _ready():
#	randomize()
#	novo_jogo()

func game_over():
	$PontuacaoTimer.stop()
	$InimigoTimer.stop()
	$HUD.exibir_gameover()
	$Musica.stop()
	$SomMorte.play()
	
func novo_jogo():
	score = 0
	$Jogador.start($PosicaoInicial.position)
	$InicioTimer.start()
	$HUD.exibir_mensagem("Criando inimigos")
	$HUD.atualize_score(score)
	$Musica.play()

func _on_inicio_timer_timeout():
	$InimigoTimer.start()
	$PontuacaoTimer.start()

func _on_pontuacao_timer_timeout():
	score += 1
	$HUD.atualize_score(score)

func _on_inimigo_timer_timeout():
	$CaminhoInimigo/SpawnInimigo.progress = randi()
	var inimigo = Inimigo.instantiate()
	add_child(inimigo)
	var direcao = $CaminhoInimigo/SpawnInimigo.rotation + PI/2
	inimigo.position = $CaminhoInimigo/SpawnInimigo.position
	direcao += randi_range(-PI/4, PI/4)
	inimigo.rotation = direcao
	inimigo.linear_velocity = Vector2(randi_range(inimigo.min_speed, inimigo.max_speed), 0)
	inimigo.linear_velocity = inimigo.linear_velocity.rotated(direcao)
