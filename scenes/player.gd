extends Node2D

var speed = 121
var pos_inicial
var pos_final 

var can_inf_dir = 172
var can_inf_esq = 900
var can_sup_dir
var can_sup_esq

func _ready():
    set_process(true)
    pos_inicial = true
    pos_final = false

func _process(delta):
	var move = Vector2()
	
	if pos_inicial:
		pass
		move.x = speed
	
	if position.x >= 900:
		pos_inicial = false
		pos_final = true
	
	if pos_final:
		pass
		move.x = -speed

	
	if position.x <= 172:
		pos_inicial = true
		pos_final = false


	if Input.is_action_just_released("ui_up"):
		position -= move * delta
	elif Input.is_action_just_released("ui_down"):
		position += move * delta
	elif Input.is_action_just_released("ui_right"):
		move.x = +speed
		position += move * delta
	elif Input.is_action_just_released  ("ui_left"):
		move.x = -speed
		position -= move * delta
	else:
		position += move * delta
	print(position)
	
