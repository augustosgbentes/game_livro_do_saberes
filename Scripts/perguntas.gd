extends Control

signal quiz_completed(correct: bool)

@export var question_label: Label
@export var option_container: VBoxContainer
@export_category("Objects")

var current_question: Dictionary
var npc_reference = null
var player_reference = null

func set_question_data(question_data: Dictionary):
	current_question = question_data

func set_npc_reference(npc):
	npc_reference = npc

func _ready():
	if not question_label or not option_container:
		push_error("Quiz: Labels ou botões não foram configurados corretamente!")
		return
		
	player_reference = get_tree().get_first_node_in_group("player")
	if player_reference:
		player_reference.is_chatting = true
	if npc_reference:
		npc_reference.is_chatting = true
	
	setup_quiz()

func setup_quiz():
	question_label.text = current_question["question"]
	
	# Cria dois HBoxContainer para organizar os botões em duas linhas
	var top_row = HBoxContainer.new()
	var bottom_row = HBoxContainer.new()
	
	# Configura o espaçamento entre os botões na horizontal
	top_row.add_theme_constant_override("separation", 5)
	bottom_row.add_theme_constant_override("separation", 5)
	
	# Adiciona as linhas ao container de opções
	option_container.add_child(top_row)
	option_container.add_child(bottom_row)
	
	for i in range(current_question["options"].size()):
		var button = Button.new()
		button.text = current_question["options"][i]
		
		# Configura o tamanho e expansão dos botões
		button.custom_minimum_size = Vector2(15, 5)
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		# Adiciona estilo aos botões
		var style = StyleBoxFlat.new()
		style.bg_color = Color("283593")
		style.corner_radius_top_left = 5
		style.corner_radius_top_right = 5
		style.corner_radius_bottom_left = 5
		style.corner_radius_bottom_right = 5
		
		# Margens internas dos botões
		style.content_margin_left = 2
		style.content_margin_right = 2
		style.content_margin_top = 2
		style.content_margin_bottom = 2
		
		# Aplica o estilo ao botão
		button.add_theme_stylebox_override("EquipmentPro", style)
		button.add_theme_font_size_override("font_size", 7)
		
		# Determina em qual linha o botão vai
		if i < 2:
			top_row.add_child(button)
		else:
			bottom_row.add_child(button)
			
		button.pressed.connect(_on_option_selected.bind(i))

func _on_option_selected(option_index: int):
	print("Opção selecionada: ", option_index)
	var is_correct = option_index == current_question["correct_answer"]
	print("Resposta está: ", "correta" if is_correct else "incorreta")
	
	if player_reference:
		player_reference.is_chatting = true
	if npc_reference:
		npc_reference.is_chatting = true
	
	quiz_completed.emit(is_correct)
	queue_free()

func _exit_tree():
	pass
