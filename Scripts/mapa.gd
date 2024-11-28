extends Node2D

@onready var heartsContainer = $CanvasLayer/Vida_Player
@onready var player = $Player

func _ready() -> void:
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	await get_tree().create_timer(0.1).timeout
	ContadorManager.setup_contador_ui()

func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/casa1.tscn")


func _on_casa_2_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/casa2.tscn")


func _on_casa_3_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/casa_3.tscn")


func _on_casa_4_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/casa_4.tscn")


func _on_casa_5_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/casa_5.tscn")


func _on_casa_inicial_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/casa_inicial.tscn")
