extends Node

const VICTORY_SCENE = preload("res://Cenas/vitoria.tscn")
var npcs_completed = {}
var npc_sequence = ["Prof. Oak", "Prof. Gelado", "Prof. Sapão", "Prof. Jakob"]



func mark_npc_completed(npc_name: String):
	if !npcs_completed.has(npc_name):
		npcs_completed[npc_name] = true
		ContadorManager.increment_progress()
		check_victory()

func check_victory():
	if npcs_completed.size() >= npc_sequence.size():
		show_victory_screen()

func show_victory_screen():
	var victory_screen = VICTORY_SCENE.instantiate()
	var canvas = CanvasLayer.new()
	canvas.layer = 1
	canvas.add_child(victory_screen)
	get_tree().root.add_child(canvas)

func is_npc_completed(npc_name: String) -> bool:
	return npcs_completed.get(npc_name, false)

func can_interact_with_npc(npc_name: String) -> bool:
	
	var npc_index = npc_sequence.find(npc_name)
	
	if npc_index == 0:  # Primeiro NPC sempre pode ser interagido
		return true
	elif npc_index > 0:  # Para outros NPCs, verifica se o anterior foi completado
		var previous_npc = npc_sequence[npc_index - 1]
		var previous_completed = is_npc_completed(previous_npc)
		return previous_completed
	
	return false

func get_blocked_dialog(npc_name: String) -> String:
	var previous_npc = npc_sequence[npc_sequence.find(npc_name) - 1]
	return "Você precisa primeiro completar a tarefa com o " + previous_npc + "."
