extends Control


@onready var label = $Label


func update_progress(completed: int, total: int):
	label.text = str(completed) + "/" + str(total)
