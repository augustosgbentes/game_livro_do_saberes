extends "res://Scripts/npc_base.gd" 

func setup_npc() -> void: 
	npc_name = "Prof. Jakob"
	
	_dialogdata = {
		0: {
			"faceset": "res://Assets/playerAssets/Faceset.png",
			"dialog": "Oi, Professor Jakob! O Professor Sapão me disse que você tem a última parte do 'Livro dos Saberes'. Como eu posso consegui-la?",
			"title": "Wiu",
		},
		1: {
		"faceset": "res://Assets/NPCS/Geografia/Faceset.png",
		"dialog": "Ah, você quer a última parte, não é? Vamos testar seus conhecimentos em geografia, vou te fazer uma pergunta, se você acertar, vai ganhar a parte que procura.",
		"title": "Prof. Jakob",
		},
		2: {
			"faceset": "res://Assets/playerAssets/Faceset.png",
			"dialog": "Eu nasci pronto, pode perguntar!",
			"title": "Wiu",
			"show_quiz": true
		},
	}
	
	quiz_data = {
		"question": "Qual é o maior continente do mundo?",
		"options": ["Ásia", "África", "Europa", "América do Sul"],
		"correct_answer": 0
	}

func get_correct_answer_dialog() -> String:
	return "Parabéns! Você acertou! Aqui está a última parte do 'Livro dos Saberes'. Parabéns!"

func get_wrong_answer_dialog() -> String:
	return "Que pena, você errou. Tente novamente mais tarde!"

func get_correct_answer_faceset() -> String:
	return "res://Assets/NPCS/Geografia/Faceset.png"

func get_wrong_answer_faceset() -> String:
	return "res://Assets/NPCS/Geografia/Faceset.png"
