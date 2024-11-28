extends Control
class_name DialogScreen

var _step: float = 0.05

var _id: int = 0
var data: Dictionary = {}
var npc_reference: Node = null

@export_category("Objects")
@export var _name: RichTextLabel = null
@export var _dialog: RichTextLabel = null
@export var _faceset: TextureRect = null

func _ready() -> void:
	get_tree().get_first_node_in_group("player").is_chatting = true
	_initialize_dialog()

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept") and _dialog.visible_ratio < 1:
		_step = 0.01
		return
		
	_step = 0.05
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("abrir dialogo"):
		_id += 1
		if _id == data.size():
			if data[_id -1].get("show_quiz", false) and npc_reference != null:
				npc_reference.show_quiz()
				queue_free()
				return
			elif data[_id -1].get("is_final", false) and npc_reference != null:
				liberar_movimento()
				queue_free()
				return
		
		_initialize_dialog()

func _initialize_dialog() -> void:
	if _id >= data.size():
		queue_free()
		return
		
	_name.text = data[_id]["title"]
	_dialog.text = data[_id]["dialog"]
	_faceset.texture = load(data[_id]["faceset"])
	
	_dialog.visible_characters = 0
	while _dialog.visible_ratio < 1:
		await get_tree().create_timer(_step).timeout
		_dialog.visible_characters += 1

func liberar_movimento():
	if npc_reference != null:
		npc_reference.is_chatting = false
	if get_tree().get_first_node_in_group("player"):
		get_tree().get_first_node_in_group("player").is_chatting = false

func _exit_tree():
	liberar_movimento()
