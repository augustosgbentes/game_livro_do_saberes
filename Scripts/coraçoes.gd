extends Panel

@onready var sprite = $Sprite2D

func update(whole: bool):
	if whole: sprite.frame = 0 # O frame 0 é o coração cheio
	else: sprite.frame = 4 # O frame 4 é o coração vazio
