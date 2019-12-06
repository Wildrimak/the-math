extends LineEdit

func _physics_process(delta):
	
	print($"LineEdit")
	$"LineEdit".set(text, "27")

	if Input.is_action_pressed("ui_right"):
		#$AnimatedSprite.flip_h = false
		
		if Input.is_action_pressed("run"):
			#$AnimatedSprite.play("Run")
			pass
		else:
			pass
			#$AnimatedSprite.play("Walk")
			
	elif Input.is_action_pressed("ui_left"):
		#$AnimatedSprite.flip_h = true
		
		if Input.is_action_pressed("run"):
			#$AnimatedSprite.play("Run")
			pass
		else:
			#$AnimatedSprite.play("Walk")
			pass
	elif Input.is_action_pressed("ui_down"):
		#$AnimatedSprite.play("Dead")
		if $AnimatedSprite.get_frame() == 14:
			#$AnimatedSprite.stop()
			pass
	else:
		pass
		#$AnimatedSprite.play("Idle")
	
func _ready():
	set_process_input(true)
	
func _input(event):	

	if(event.is_action_pressed("touch")):
		on_touch()

func on_touch():
	$".".position.y-=20