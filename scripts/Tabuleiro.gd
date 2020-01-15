extends Node2D
class_name Tabuleiro

var ordem
var deslocamento
var tamanho_das_casas
var CASA = preload("res://scenes/Casa.tscn")

func new(ordem=null, deslocamento=null, tamanho_das_casas=null):

	self.ordem = ordem
	self.deslocamento = deslocamento
	self.tamanho_das_casas = tamanho_das_casas
	self.generate_casas(ordem, tamanho_das_casas)

func get_center(var X, var Y):
	var centro = Vector2()
	centro.x = self.tamanho_das_casas/2 + self.tamanho_das_casas * X + self.deslocamento.x
	centro.y = self.tamanho_das_casas/2 + self.tamanho_das_casas * Y + self.deslocamento.y
	return centro 

func get_coordenadas_a_partir_position(var position):
	
	var position_centralizada = centraliza_movimento(position, position)
	var coo =  calcula_as_coordenadas_final(position_centralizada)
	coo -= self.deslocamento
	coo /= self.tamanho_das_casas
		
	return coo

func get_numero_a_partir_da_position(var position):
	var coordenadas = get_coordenadas_a_partir_position(position)
	var numero = get_numero_a_partir_das_coordenadas(coordenadas)
	return numero 

func get_position_a_partir_do_numero(var numero):
	var coordenadas = get_coordenadas_a_partir_do_numero(numero)
	var final = get_center(coordenadas.x, coordenadas.y)
	return final
	
func get_numero_a_partir_das_coordenadas(var coordenadas):	
	
	var dicionario_de_coordenadas = {}
	
	var numero = 0
	
	for y in range(ordem):
		for x in range(ordem):
			numero+=1
			dicionario_de_coordenadas[Vector2(x, y)] = numero
	
	return dicionario_de_coordenadas.get(coordenadas)
	
func get_coordenadas_a_partir_do_numero(var numero):	
	
	var dicionario_de_numeros = {}
	
	var contador = 0
	
	for y in range(ordem):
		for x in range(ordem):
			contador+=1
			dicionario_de_numeros[contador] = Vector2(x, y)
	
	return dicionario_de_numeros.get(numero)

func get_deslocamento():
	return self.deslocamento

func generate_casas(ordem=null, tamanho_das_casas=null):

	var numero_casa = 0
	for i in range(ordem):
		for j in range(ordem):
			var alternador = ((numero_casa % ordem) + i);
			var cor = Color(0,0,0,1) if alternador % 2 != 0 else Color(1,1,1,1)  
			var casa = CASA.instance()
			numero_casa+=1
			casa.new(numero_casa, i, j, tamanho_das_casas, cor, self)
			add_child(casa)
			#casas.add(casa);

func is_movimento_valido(lugar_clicado):

	var limite_sup_esq = self.deslocamento
	var limite_sup_dir = self.deslocamento + Vector2(self.ordem * self.tamanho_das_casas, 0)
	var limite_inf_esq = self.deslocamento + Vector2(0, self.ordem * self.tamanho_das_casas)
	var limite_inf_dir = self.deslocamento + Vector2(self.ordem * self.tamanho_das_casas, self.ordem * self.tamanho_das_casas)

	if (lugar_clicado.x < limite_sup_esq.x):
		return false
	if (lugar_clicado.y < limite_sup_esq.y):
		return false
	if (lugar_clicado.x > limite_sup_dir.x):
		return false	
	if (lugar_clicado.y < limite_sup_dir.y):
		return false
	if (lugar_clicado.x < limite_inf_esq.x):
		return false
	if (lugar_clicado.y > limite_inf_esq.y):
		return false
	if (lugar_clicado.x > limite_inf_dir.x):
		return false
	if (lugar_clicado.y > limite_inf_dir.y):
		return false

	return true
			
func calcula_as_coordenadas_absoluta(var lugar_clicado):
	var ponto = lugar_clicado - deslocamento			
	var X = int(ponto.x/self.tamanho_das_casas)
	var Y = int(ponto.y/self.tamanho_das_casas)

	return Vector2(X, Y)

func calcula_as_coordenadas_final(var lugar_clicado):
	var valor_absoluto = calcula_as_coordenadas_absoluta(lugar_clicado)
	valor_absoluto+=get_deslocamento()
	return valor_absoluto
	
func centraliza_movimento(lugar_clicado, my_position):
	
	if(!self.is_movimento_valido(lugar_clicado)):
		return my_position
	
	var xy = calcula_as_coordenadas_absoluta(lugar_clicado)
	
	var novo_lugar_clicado = Vector2(self.tamanho_das_casas/2 + self.tamanho_das_casas * xy.x, self.tamanho_das_casas/2 + self.tamanho_das_casas * xy.y)
	novo_lugar_clicado += get_deslocamento()
	
	return novo_lugar_clicado
