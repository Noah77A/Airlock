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
	await get_tree().create_timer(5.0).timeout
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://menu.tscn")
	
	
