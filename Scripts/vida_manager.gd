extends Node

var vida_ui_scene = preload("res://Cenas/vida_player.tscn")
var vida_ui = null
var current_health = 3 
var is_first_scene = true

func setup_vida_ui(player):
	if !vida_ui:
		vida_ui = vida_ui_scene.instantiate()
		var canvas = CanvasLayer.new()
		canvas.add_child(vida_ui)
		add_child(canvas)
		vida_ui.setMaxHearts(player.maxHealth)
	
	if is_first_scene:
		current_health = player.maxHealth
		is_first_scene = false
	
	
	vida_ui.updateHearts(current_health)
	player.currentHealth = current_health
func update_current_health(new_health: int):
	current_health = new_health
	if vida_ui:
		vida_ui.updateHearts(current_health)

func reset_health(max_health: int):
	current_health = max_health
	if vida_ui:
		vida_ui.updateHearts(current_health)
