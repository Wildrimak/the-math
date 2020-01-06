extends Node2D

func _ready():
	
	print(get_tree().get_current_scene().get_child_count())
	print(get_tree().get_current_scene().get_filename())
	
	print(get_tree().get_nodes_in_group("Coluna8"))
	
	print(get_tree().get("Coluna8"))
	
	var qtd_filhos = get_tree().get_current_scene().get_child_count()
	
	for i in range(qtd_filhos):
		#print(get_tree().get_current_scene().get_position_in_parent())
		#print(i)
		pass

#func _process(delta):
#	pass


func _on_B8_click():
	print("B8")
	print(get_tree().get_current_scene())
	print($".".position)
