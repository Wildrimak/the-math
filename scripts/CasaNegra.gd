extends TouchScreenButton

signal click

func _on_CasaNegra_released():
	emit_signal("click")
	print(get_tree().get_root().get_filename())
	print($"Centro".position)
