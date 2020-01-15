extends Sprite
class_name Casa

var valor_numeral
var coordenada_linha
var coordenada_coluna
var tamanho_lado
var cor
var tabuleiro

func new(valor_numeral=null, coordenada_linha=null, coordenada_coluna=null, tamanho_lado=null, cor=null, tabuleiro=null):
	self.valor_numeral = valor_numeral
	self.coordenada_linha = coordenada_linha
	self.coordenada_coluna = coordenada_coluna
	self.tamanho_lado = tamanho_lado 
	self.cor = cor
	self.tabuleiro = tabuleiro
	var deslocamento = tabuleiro.get_deslocamento()
	self.position = Vector2(coordenada_linha*tamanho_lado+deslocamento.x, coordenada_coluna*tamanho_lado+deslocamento.y)
	self.modulate = cor
	$Numero.text = str(valor_numeral)
	$Numero.set("custom_colors/font_color", Color(0,1,0,1))
	
func get_valor_numeral(): 
	return self.valor_numeral

func set_valor_numeral(var valor_numeral):
	self.valor_numeral = valor_numeral

func get_coordenada_linha():
	return self.coordenada_linha;

func set_coordenada_linha(var coordenada_linha):
	self.coordenada_linha = coordenada_linha

func get_coordenada_coluna():
	return self.coordenada_coluna

func set_coordenada_coluna(var coordenada_coluna):
	self.coordenada_coluna = coordenada_coluna

func get_tamanho_lado():
	return self.tamanho_lado

func set_tamanho_lado(var tamanho_lado): 
	self.tamanho_lado = tamanho_lado

func get_cor():
	return self.cor

func set_cor(var cor):
	self.cor = cor

func get_centro():
	
	var deslocamento = self.tabuleiro.get_deslocamento()

	var xCentro = tamanho_lado / 2 + tamanho_lado * coordenada_linha
	var yCentro = tamanho_lado / 2 + tamanho_lado * coordenada_coluna
		
	var retornada = Vector2(xCentro + deslocamento.x, yCentro + deslocamento.y)

	return retornada