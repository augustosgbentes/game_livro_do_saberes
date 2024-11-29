extends Control
class_name DialogScreen

var certo = false

@onready var button = $BackGround/HContainer/VContainer/Button
@onready var button_2 = $BackGround/HContainer/VContainer/Button2
@onready var button_3 = $BackGround/HContainer/VContainer/Button3
@onready var button_4 = $BackGround/HContainer/VContainer/Button4

var _step: float = 0.05

var _id: int = 0 
var data: Dictionary = {}

@export_category("Objects")
@export var _name: Label = null
@export var _dialog: RichTextLabel = null
@export var _faceset: TextureRect = null 
@export var _bnt1: Button = null
@export var _bnt2: Button = null
@export var _bnt3: Button = null
@export var _bnt4: Button = null

func _ready() -> void:
	initialize_dialog()

func _process(delta: float) -> void:
	
	botao_visivel()
	
	
	if Input.is_action_pressed("ui_accept") and _dialog.visible_ratio < 1:
		_step = 0.01
		return
		
	_step = 0.05
	if Input.is_action_just_pressed("ui_accept"):
		_id += 1
		if _id == data.size():
			queue_free()
			return
			
		initialize_dialog()


func initialize_dialog() -> void :
	_name.text = data[_id]["title"]
	_dialog.text = data[_id]["dialog"]
	_faceset.texture = load(data[_id]["faceset"])
	_bnt1.text = data[_id]["bnt1"]
	_bnt2.text = data[_id]["bnt2"]
	_bnt3.text = data[_id]["bnt3"]
	_bnt4.text = data[_id]["bnt4"]
	
	_dialog.visible_characters = 0
	while _dialog.visible_ratio < 1:
		await get_tree().create_timer(_step).timeout
		_dialog.visible_characters += 1
	

func botao_visivel():
	if button.text == "":
		button.visible = false
	else:
		button.visible = true

	if button_2.text == "":
		button_2.visible = false
	else:
		button_2.visible = true

	if button_3.text == "":
		button_3.visible = false
	else:
		button_3.visible = true

	if button_4.text == "":
		button_4.visible = false
	else:
		button_4.visible = true


func _on_button_pressed(certo):
	if certo:
		queue_free()



