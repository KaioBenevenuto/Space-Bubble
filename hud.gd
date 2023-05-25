extends CanvasLayer

signal start_game

func exibir_mensagem (text):
	$MensageLabel.text = text
	$MensageLabel.show()
	$MensageTimer.start()
	
func exibir_gameover ():
	exibir_mensagem("Game Over")
	await $MensageTimer.timeout
	
	$MensageLabel.text = "Sobreviva!"
	$MensageLabel.show()
	
	await get_tree().create_timer(1).timeout
	$StartButton.show()
	
func atualize_score(score):
	$ScoreLabel.text = str(score)
	
func _on_start_button_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_message_timer_timeout():
	$MensageLabel.hide()
