extends Area2D

signal colisao

func _on_Alvo_body_entered(body):
	print(body)
	print("Senti o corpo")
	emit_signal("colisao")
