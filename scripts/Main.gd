extends Node2D
class_name Main

var tempo
var start_position_tabuleiro
var tamanho_das_casas
var ordem
var tab
var global_lifes
var global_score

func _ready():
	randomize()
	self.tempo = 30
	self.start_position_tabuleiro = Vector2(28, 256)
	self.tamanho_das_casas = 128
	self.ordem = 8
	self.global_lifes = 5
	self.global_score = 0
	new_game()
	
func new_game():
	
	$Equacao.new()
	var equacao = $Equacao.get_str_equacao()
	$HUD.update_mensagem(equacao)
	$HUD/StartButton.hide()

	$HUD.update_lifes(self.global_lifes)
	$HUD.update_time(self.tempo)
	$Tempo.start()
	self.tab = criar_tabuleiro()
	var position_inicial = tab.get_center(0, 0)
	get_node("Jogador").new(tab, position_inicial)
	
	add_child(tab)
	
	var nascimento_alvo = Vector2(int(rand_range(0, self.ordem)), int(rand_range(0, self.ordem)))
	var absoluto_local = tab.get_center(nascimento_alvo.x, nascimento_alvo.y)
	get_node("Alvo").position = absoluto_local
		
func criar_tabuleiro():
	get_node("Tabuleiro").new(self.ordem, self.start_position_tabuleiro, self.tamanho_das_casas)
	var tab = get_node("Tabuleiro")
	return tab	

func _process(delta):

	var local_absoluto_player = get_node("Jogador").get_position()
	var local_absoluto_alvo = get_node("Alvo").get_position()
	var coordenadas_player = tab.calcula_as_coordenadas_final(local_absoluto_player)
	var coordenadas_alvo = tab.calcula_as_coordenadas_final(local_absoluto_alvo)

	if local_absoluto_player == local_absoluto_alvo:
		
		self.global_score += self.tempo * self.global_lifes
		$HUD.update_score(self.global_score)
		var nascimento_alvo = Vector2(int(rand_range(0, self.ordem)), int(rand_range(0, self.ordem)))
		var absoluto_local = tab.get_center(nascimento_alvo.x, nascimento_alvo.y)
		get_node("Alvo").position = absoluto_local
		self.tempo += 2
		self.global_lifes += 1
		$Equacao.new()
		var equacao = $Equacao.get_str_equacao()
		$HUD.update_mensagem(equacao)

func _on_Tempo_timeout():
	self.tempo -= 1
	$HUD.update_time(self.tempo)

func _on_HUD_gamer_over():
	$Tempo.stop()
	$Jogador.position = Vector2(INF, INF)
	$Alvo.position = Vector2(-INF, -INF)
	$HUD.show_game_over()

func _on_HUD_start_game():
	self.tempo = 3
	self.start_position_tabuleiro = Vector2(28, 256)
	self.tamanho_das_casas = 128
	self.ordem = 8
	self.global_lifes = 5
	
	new_game()

