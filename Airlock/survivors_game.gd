extends Node2D


@onready var player_room_handler: Node2D = $PlayerRoomHandler


func _ready():
	%Timer.start()
	player_room_handler.load_floor("res://game_generation/resources/floors/slime_floor.tres")
func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_tree(): 
	var new_tree = preload("res://trees/pine_tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)

func spawn_red_tree(): 
	var new_tree = preload("res://trees/red_pine_tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)
	

func _on_player_health_depleted():
	%"Game Over".visible = true
	get_tree().paused = true
	
	
	



func _on_return_to_menu_pressed() -> void:
	GameManager.difficulty = 1
	GameManager.credits = 0
	GameManager.oxygen = 120
	GameManager.level = 1
	GameManager.pierce = 1
	GameManager.damage = 10
	GameManager.maxHealth = 100
	GameManager.movement = 1
	GameManager.experiance = 0
	GameManager.regen = 0
	GameManager.bulletSpeed = 1
	GameManager.bulletSize = 0.25
	GameManager.price = 10
	GameManager.fireRate = 0.4
	GameManager.range=155
	GameManager.upgradeSignal = false
	GameManager.healthSignal = false
	GameManager.haveKey = false
	GameManager.ice = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")



func _input(event) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		%Pause.visible = true
	
func _on_quit_button_pressed() -> void:
	get_tree().quit(0)


func _on_resume_pressed() -> void:
	%Pause.visible = false
	get_tree().paused = false
	# Replace with function body.


func _on_pause_quit_pressed() -> void:
	get_tree().quit(0) # Replace with function body.
