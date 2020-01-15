extends Area2D

class_name Jogador

var speed = 1000  
var velocity = Vector2()
var target = Vector2()
var tabuleiro

func new(tabuleiro=null, position=null):

	self.tabuleiro = tabuleiro
	self.position = position
	self.target = position

func start():
	show()

func _input(event):

	if event is InputEventScreenTouch and event.is_pressed():

		var quero_ir = event.position
		var onde_estou = target
		self.target = self.tabuleiro.centraliza_movimento(quero_ir, onde_estou)
		get_parent().global_lifes-=1
		$"../HUD".update_lifes(get_parent().global_lifes)

func _process(delta):
	logica_movimento(delta)

func logica_movimento(var delta):
	
	if position.distance_to(target) > 10:	
		velocity = (target - position).normalized() * speed

	else:
		velocity = Vector2()
		position = tabuleiro.centraliza_movimento(position, position)	
		
		#var equacao = get_node("../Equacao").new(2, -1)
		
		#position = teletransporte(position, equacao)	
	
		if position == get_node("../Alvo").position:
			pass
			#emit_signal("")
	
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta

func teletransporte(var my_position, var equacao):
	var minha_casa = self.tabuleiro.get_numero_a_partir_da_position(my_position)
	var casa_final = equacao.a * minha_casa + equacao.b
	casa_final = ajusta_casa_final(casa_final)
	var final_position = self.tabuleiro.get_position_a_partir_do_numero(casa_final)
	return final_position
	
func ajusta_casa_final(var numero):

	var casa_maxima = self.tabuleiro.ordem * self.tabuleiro.ordem
	
	if numero > 0 or numero < casa_maxima + 1:
		return numero
			
	if numero <= 0:
		numero += casa_maxima
		return ajusta_casa_final(numero)
	
	if numero > casa_maxima:
		numero -= casa_maxima
		return ajusta_casa_final(numero)
	
