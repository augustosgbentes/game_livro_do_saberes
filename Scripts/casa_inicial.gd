extends Node2D

var is_chatting = false
@export_category("Objects")
@export var _hud: CanvasLayer = null
const _DIALOG_SCREEN: PackedScene = preload("res://Cenas/dialogo.tscn")
var _dialogdata: Dictionary = {
	0: {
		"faceset": "res://Assets/NPCS/Introduçao/Faceset.png",
		"dialog": "Olá jovem aprendiz! Bem-vindo ao Jogo 'O Livro dos Saberes'",
		"title": "Narrador",
	},
	1: {
		"faceset": "res://Assets/NPCS/Introduçao/Faceset.png", 
		"dialog": "Este mundo mágico irá transportar você para uma incrível jornada de descobertas.",
		"title": "Narrador",
	},
	2: {
		"faceset": "res://Assets/NPCS/Introduçao/Faceset.png",
		"dialog": " Aqui, cada pergunta é uma porta para o conhecimento, e cada resposta certa é um passo em direção à sabedoria!",
		"title": "Narrador",
	},
	3: {
		"faceset": "res://Assets/NPCS/Introduçao/Faceset.png",
		"dialog": "Para descobrir como começar sua jornada, saia da casa e vá até a casa 'Dojo'.",
		"title": "Narrador",
		"is_final": true
	}
}

func _on_area_2d_area_entered(area: Area2D) -> void:
	is_chatting = true
	var new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	new_dialog.data = _dialogdata
	new_dialog.npc_reference = self
	_hud.add_child(new_dialog)
