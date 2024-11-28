extends CharacterBody2D

@export var speed: int = 100
@onready var animations = $AnimationPlayer
var is_chatting = false
@export var maxHealth = 3
var currentHealth: int 


func handleInput():
	if is_chatting: 
		velocity = Vector2.ZERO
		return
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed

func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
	
		animations.play("walk" + direction)

func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()

func _ready():
	VidaManager.setup_vida_ui(self)
	currentHealth = VidaManager.current_health
	if SceneManager.next_spawn_position != Vector2.ZERO:
		global_position = SceneManager.next_spawn_position
		SceneManager.next_spawn_position = Vector2.ZERO

@export var target_scene: String 
@export var spawn_position: Vector2 

func _on_porta_inicial_area_entered(area: Area2D) -> void:
	SceneManager.next_spawn_position = spawn_position
	get_tree().change_scene_to_file("res://Cenas/mapa.tscn")
	print("WORK")


func _on_area_2d_area_entered(area: Area2D) -> void:
	SceneManager.next_spawn_position = spawn_position
	get_tree().change_scene_to_file("res://Cenas/mapa.tscn")
	print("WORK")


func _on_porta_1_area_entered(area: Area2D) -> void:
	SceneManager.next_spawn_position = spawn_position
	get_tree().change_scene_to_file("res://Cenas/mapa.tscn")
	print("WORK")


func _on_porta_3_area_entered(area: Area2D) -> void:
	SceneManager.next_spawn_position = spawn_position
	get_tree().change_scene_to_file("res://Cenas/mapa.tscn")
	print("WORK")


func _on_porta_4_area_entered(area: Area2D) -> void:
	SceneManager.next_spawn_position = spawn_position
	get_tree().change_scene_to_file("res://Cenas/mapa.tscn")
	print("WORK")

func _on_porta_5_area_entered(area: Area2D) -> void:
	SceneManager.next_spawn_position = spawn_position
	get_tree().change_scene_to_file("res://Cenas/mapa.tscn")
	print("WORK")

func take_damage():
	currentHealth = max(0, currentHealth - 1)
	VidaManager.update_current_health(currentHealth)
	if currentHealth <= 0:
		game_over()

const GAME_OVER_SCENE = preload("res://Cenas/game_over.tscn")
func game_over():
	var game_over_screen = GAME_OVER_SCENE.instantiate()
	var canvas = CanvasLayer.new()
	canvas.layer = 100
	canvas.add_child(game_over_screen)
	get_tree().root.add_child(canvas)
	
	is_chatting = true
	velocity = Vector2.ZERO
