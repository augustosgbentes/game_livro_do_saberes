extends "res://Scripts/npc_base.gd" 

func setup_npc() -> void: 
	npc_name = "Prof. Gelado"
	
	_dialogdata = {
		0: {
			"faceset": "res://Assets/playerAssets/Faceset.png",
			"dialog": "Oi, Prof. Gelado! O Professor Oak me disse que você tem a segunda parte do 'Livro dos Saberes'. Como eu posso consegui-la?",
			"title": "Wiu",
		},
		1: {
			"faceset": "res://Assets/NPCS/matematica/Faceset.png",
			"dialog": "Que frio!! Você não está com frio? Enfim... Vou te fazer uma pergunta. Se você acertar, vai receber a parte que procura.",
			"title": "Prof. Gelado",
		},
		2: {
			"faceset": "res://Assets/playerAssets/Faceset.png",
			"dialog": "Não estou com frio. *TREMENDO* ...Estou pronto! Pode perguntar!",
			"title": "Wiu",
			"show_quiz": true
		},
	}
	
	quiz_data = {
		"question": "Qual é o resultado de 2 + 2 x 2?",
		"options": ["4", "6", "8", "12"],
		"correct_answer": 1
	}

func get_correct_answer_dialog() -> String:
	return "Parabéns! Você acertou! Aqui está a segunda parte do 'Livro dos Saberes'. Agora siga em direção ao Oeste, o Prof. Sapão está com a terceira parte do Livro."

func get_wrong_answer_dialog() -> String:
	return "Que pena, você errou. Tente novamente mais tarde!"

func get_correct_answer_faceset() -> String:
	return "res://Assets/NPCS/matematica/Faceset.png"

func get_wrong_answer_faceset() -> String:
	return "res://Assets/NPCS/matematica/Faceset.png"
