extends Control



func _on_button_button_down() -> void:
	var root = get_tree().root
	for child in root.get_children():
		if child is CanvasLayer:
			child.queue_free()
	
	VidaManager.reset_health(3)
	NpcManager.npcs_completed.clear()
	ContadorManager.current_progress = 0
	ContadorManager.update_contador()
	if ContadorManager.canvas:
		ContadorManager.canvas.queue_free()
		ContadorManager.canvas = null
		ContadorManager.contador_ui = null
	
	get_tree().change_scene_to_file("res://Cenas/inicio.tscn")


func _on_button_2_button_down() -> void:
	get_tree().quit()
