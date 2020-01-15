extends CanvasLayer
class_name HUD

signal start_game
signal gamer_over

func _ready():
	pass

func update_time(var tempo):
	$Tempo.text = "Time: " + str(tempo)
	
	if tempo == 0:
		emit_signal("gamer_over")
		
func update_mensagem(var texto):
	$Mensagem.text = texto
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$Mensagem.text = "Choose a house whose result of the equation makes it collide with the target."
	$Mensagem.show()
	yield(get_tree().create_timer(1), 'timeout')
	$StartButton.show()
	
func show_message(text):
	$Mensagem.text = text
	$Mensagem.show()
	$MessageTimer.start()

func update_score(var score):
	$Score.text = "Score: " + str(score)
	
func update_lifes(var lifes):
	if lifes <= -1:
		emit_signal("gamer_over")
	else:
		$Tentativas.text = "Attempts: " + str(lifes)
	
func _on_MessageTimer_timeout():
	$Mensagem.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
