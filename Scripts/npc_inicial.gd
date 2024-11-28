extends CharacterBody2D

const speed = 15
var current_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

@export var player1: CharacterBody2D
@onready var player = get_tree().get_first_node_in_group("player")
var player_in_chat_zone = false

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

@export_category("Objects")
@export var _hud: CanvasLayer = null
const _DIALOG_SCREEN: PackedScene = preload("res://Cenas/dialogo.tscn")
var _dialogdata: Dictionary = {
	0: {
		"faceset": "res://Assets/NPCS/NPCinicial/Faceset.png",
		"dialog": "Olá jovem aventureiro! Bem-vindo ao nosso mundo de conhecimento!",
		"title": "Ancião",
	},
	1: {
		"faceset": "res://Assets/NPCS/NPCinicial/Faceset.png", 
		"dialog": "Para conseguir o Livro dos Saberes, você precisa visitar quatro professores e responder suas perguntas corretamente.",
		"title": "Ancião",
	},
	2: {
		"faceset": "res://Assets/playerAssets/Faceset.png",
		"dialog": "Estou pronto para começar minha jornada! Mas como posso encontrar o Livro e os professores?",
		"title": "Wiu",
	},
	3: {
		"faceset": "res://Assets/NPCS/NPCinicial/Faceset.png",
		"dialog": "Comece visitando o Leste,lá você encontrará o Prof. Oak, ele tem a primeira parte do livro. Boa sorte!",
		"title": "Ancião",
		"is_final": true
	}
}

func _ready():
	randomize()
	start_pos = position
func _process(delta):
	if current_state == 0 or current_state == 1:
		$AnimatedSprite2D.play("idle")
	elif current_state == 2 and !is_chatting:
		if dir.x == -1:
			$AnimatedSprite2D.play("walk_left")
		if dir.x == 1:
			$AnimatedSprite2D.play("walk_right")
		if dir.y == -1:
			$AnimatedSprite2D.play("walk_up")
		if dir.y == 1:
			$AnimatedSprite2D.play("walk_down")
	
	if is_roaming:
		match current_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN])
			MOVE:
				move(delta)

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	if !is_chatting:
		position += dir * speed * delta


func _on_timer_timeout():
	$Timer.wait_time = choose([0.5, 1, 1.5])
	current_state = choose([IDLE, NEW_DIR, MOVE])


func _physics_process(delta):
	move_and_slide()


func _on_chat_detection_area_entered(area: Area2D) -> void:
	is_chatting = true
	var new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	new_dialog.data = _dialogdata
	new_dialog.npc_reference = self
	_hud.add_child(new_dialog)
