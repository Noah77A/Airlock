extends Node2D


func _ready():
	%Timer.start()
	
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
	GameManager. oxygen = 120
	GameManager.level = 1
	GameManager.pierce = 1
	GameManager. damage = 1
	GameManager.maxHealth = 100
	GameManager. movement = 1
	GameManager. experiance = 0
	GameManager.regen = 0
	GameManager. bulletSpeed = 1
	GameManager.bulletSize = 0.25
	GameManager.price = 10

	GameManager. upgradeSignal = false
	GameManager. healthSignal = false
	GameManager. haveKey = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit(0)
