extends Node2D
class_name Level

var certo = true

const _DIALOG_SCREEN:PackedScene = preload("res://Cenas/dialog_screen.tscn")

var _dialogdata: Dictionary = {
	0: {
		"faceset": "res://char/Wizard/faceset.png",
		"dialog": "Em Eldoria, dizem que existe um livro antigo, o 'Livro dos Saberes', que tem todo o conhecimento do mundo. Para consegui-lo, você precisa reunir as quatro partes dele.",
		"title": "Ancião",
		"bnt1": "",
		"bnt2": "",
		"bnt3": "",
		"bnt4": "",
	},
	1: {
		"faceset": "res://char/Wizard/faceset.png",
		"dialog": "Como eu posso encontrar as quatro partes?",
		"title": "Wiu",
		"bnt1": "",
		"bnt2": "",
		"bnt3": "",
		"bnt4": "",
	},
	2: {
		"faceset": "res://char/Wizard/faceset.png",
		"dialog": "A primeira parte está com o Professor de História. Ele vai te fazer uma pergunta. Se você acertar, vai ganhar a primeira parte. Depois, ele te dirá onde está a próxima.",
		"title": "Ancião",
		"bnt1": "",
		"bnt2": "",
		"bnt3": "",
		"bnt4": "",
	},
	3: {
		"faceset": "res://char/Wizard/faceset.png",
		"dialog": "Onde ele está?",
		"title": "Wiu",
		"bnt1": "",
		"bnt2": "",
		"bnt3": "",
		"bnt4": "",
	},
	4: {
		"faceset": "res://char/Wizard/faceset.png",
		"dialog": "Ele está nessa casa na sua frente.",
		"title": "Ancião",
		"bnt1": "",
		"bnt2": "",
		"bnt3": "",
		"bnt4": "",
	}
}

func _on_button_pressed(certo):
	if certo:
		queue_free()

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		var new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		new_dialog.data = _dialogdata
		_hud.add_child(new_dialog)
