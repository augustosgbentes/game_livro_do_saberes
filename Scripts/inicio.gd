extends Control

func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Cenas/casa_inicial.tscn")


func _on_button_2_button_down() -> void:
	get_tree().change_scene_to_file("res://Cenas/creditos.tscn")


func _on_button_3_button_down() -> void:
	get_tree().quit()
