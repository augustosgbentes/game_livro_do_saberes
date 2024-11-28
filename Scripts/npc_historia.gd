extends "res://Scripts/npc_base.gd" 

func setup_npc() -> void: 
	npc_name = "Prof. Oak"
	
	_dialogdata = {
		0: {
		"faceset": "res://Assets/playerAssets/Faceset.png",
		"dialog": "Olá Prof. Oak! O Ancião me disse que você tem a primeira parte do 'Livro dos Saberes'. Como eu posso conseguir?",
		"title": "Wiu",
		},
		1: {
		"faceset": "res://Assets/NPCS/Historia/Faceset.png",
		"dialog": "Ah, você quer a primeira parte, não é? Então vou te fazer uma pergunta. Se você acertar, vai ganhar a parte que procura.",
		"title": "Prof. Oak",
		},
		2: {
			"faceset": "res://Assets/playerAssets/Faceset.png",
			"dialog": "Estou pronto! Pode perguntar!",
			"title": "Wiu",
			"show_quiz": true
		},
	}
	
	quiz_data = {
		"question": "Quem descobriu o Brasil?",
		"options": ["Pedro Álvares Cabral", "Vasco da Gama", "Cristóvão Colombo", "Lula"],
		"correct_answer": 0
	}

func get_correct_answer_dialog() -> String:
	return "Parabéns! Aqui está a primeira parte do 'Livro dos Saberes'. Continue sua jornada pelo Norte, lá você encontrará o Prof. Gelado, responsável pela segunda parte do Livro."

func get_wrong_answer_dialog() -> String:
	return "Que pena, você errou. Tente novamente mais tarde!"

func get_correct_answer_faceset() -> String:
	return "res://Assets/NPCS/Historia/Faceset.png"

func get_wrong_answer_faceset() -> String:
	return "res://Assets/NPCS/Historia/Faceset.png"
