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
const _QUIZ_SCREEN: PackedScene = preload("res://Cenas/perguntas.tscn")

# Variáveis que serão sobrescritas pelos NPCs específicos
var npc_name: String = "Professor"
var _dialogdata: Dictionary = {}
var quiz_data: Dictionary = {}

func _ready() -> void:
	randomize()
	start_pos = position
	setup_npc()

func setup_npc() -> void:
	pass 

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

func _physics_process(delta):
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	is_chatting = true
	
	if not NpcManager.can_interact_with_npc(npc_name):
		var new_dialog = _DIALOG_SCREEN.instantiate()
		new_dialog.data = {
			0: {
				"faceset": get_wrong_answer_faceset(),
				"dialog": NpcManager.get_blocked_dialog(npc_name),
				"title": npc_name,
				"is_final": true
			}
		}
		new_dialog.npc_reference = self
		_hud.add_child(new_dialog)
		return
	
	var new_dialog = _DIALOG_SCREEN.instantiate()
	if NpcManager.is_npc_completed(npc_name):
		new_dialog.data = {
			0: {
				"faceset": get_correct_answer_faceset(),
				"dialog": get_completed_dialog(),
				"title": npc_name,
				 "is_final": true
			}
		}
	else:
		new_dialog.data = _dialogdata
	new_dialog.npc_reference = self
	_hud.add_child(new_dialog)

func get_completed_dialog() -> String:
	return "Você já respondeu minha pergunta. Continue sua jornada!"

func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([0.5, 1, 1.5])
	current_state = choose([IDLE, NEW_DIR, MOVE])

func show_quiz():
	is_chatting = true
	if player:
		player.is_chatting = true
	
	var quiz = _QUIZ_SCREEN.instantiate()
	quiz.set_question_data(quiz_data)
	quiz.set_npc_reference(self) 
	quiz.quiz_completed.connect(_on_quiz_completed)
	_hud.add_child(quiz)
	print("Quiz criado e adicionado ao HUD")

func _on_quiz_completed(is_correct: bool):
	print("Quiz completado. Resposta está: ", "correta" if is_correct else "incorreta")
	var new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	
	if is_correct:
		NpcManager.mark_npc_completed(npc_name)
		new_dialog.data = {
			0: {
				"faceset": get_correct_answer_faceset(),
				"dialog": get_correct_answer_dialog(),
				"title": npc_name,
				"is_final": true
			}
		}
	else:
		if get_tree().get_first_node_in_group("player"):
			get_tree().get_first_node_in_group("player").take_damage()
		new_dialog.data = {
			0: {
				"faceset": get_wrong_answer_faceset(),
				"dialog": get_wrong_answer_dialog(),
				"title": npc_name,
				"is_final": true
			}
		}
	_hud.add_child(new_dialog)

func get_correct_answer_dialog() -> String:
	return "Parabéns! Você acertou!"

func get_wrong_answer_dialog() -> String:
	return "Que pena, você errou. Tente novamente mais tarde!"

func get_correct_answer_faceset() -> String:
	return "res://Assets/NPCS/default/Faceset.png"

func get_wrong_answer_faceset() -> String:
	return "res://Assets/NPCS/default/Faceset.png"
