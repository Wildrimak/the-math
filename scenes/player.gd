extends Node2D

var speed = 7000
var pos_inicial
var pos_final 

func _ready():
    set_process(true)
    pos_inicial = true
    pos_final = false

func _process(delta):
	var move = Vector2()

	if Input.is_action_just_released("ui_up"):
		move.y = -speed
	elif Input.is_action_just_released("ui_down"):
		move.y = speed
	elif Input.is_action_just_released("ui_right"):
		move.x = speed
	elif Input.is_action_just_released("ui_left"):
		move.x = -speed
			
	position += move * delta
	
