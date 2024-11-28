extends "res://Scripts/npc_base.gd" 

func setup_npc() -> void: 
	npc_name = "Prof. Sapão"
	
	_dialogdata = {
		0: {
			"faceset": "res://Assets/playerAssets/Faceset.png",
			"dialog": "Oi, Professor Sapão! O Professor Gelado me falou que você tem a terceira parte do 'Livro dos Saberes'. Como eu posso consegui-la?",
			"title": "Wiu",
		},
		1: {

		"faceset": "res://Assets/NPCS/Ciencias/FacesetCiencias.png",
		"dialog": "Ah, você quer a terceira parte, não é? Então, vou te fazer uma pergunta de ciências. Se você acertar, vai ganhar a parte que procura.",
		"title": "Prof. Sapão",
		},
		2: {
			"faceset": "res://Assets/playerAssets/Faceset.png",
			"dialog": "Estou pronto! Pode perguntar!",
			"title": "Wiu",
			"show_quiz": true
		},
	}
	
	quiz_data = {
		"question": "Qual é o planeta mais próximo do Sol?",
		"options": ["Terra", "Marte", "Vênus", "Mercúrio"],
		"correct_answer": 3
	}

func get_correct_answer_dialog() -> String:
	return "Parabéns! Você acertou! Aqui está a terceira parte do 'Livro dos Saberes'. Viaje ao Sul, lá você encontrará o Castelo do Prof. Jakob. Ele está com a última parte do Livro"

func get_wrong_answer_dialog() -> String:
	return "Que pena, você errou. Tente novamente mais tarde!"

func get_correct_answer_faceset() -> String:
	return "res://Assets/NPCS/Ciencias/FacesetCiencias.png"

func get_wrong_answer_faceset() -> String:
	return "res://Assets/NPCS/Ciencias/FacesetCiencias.png"
