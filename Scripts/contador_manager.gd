extends Node

var contador_ui_scene = preload("res://Cenas/contador.tscn")
var contador_ui = null
var current_progress = 0
var canvas = null


func setup_contador_ui():
	if contador_ui:
		return
	contador_ui = contador_ui_scene.instantiate()
	if !canvas:
		canvas = CanvasLayer.new()
		canvas.layer = 1
		canvas.set_process_mode(Node.PROCESS_MODE_ALWAYS)
		add_child(canvas)
	canvas.add_child(contador_ui)
	update_contador()

func increment_progress():
	current_progress += 1
	update_contador()

func update_contador():
	if contador_ui:
		contador_ui.update_progress(current_progress, 4)
