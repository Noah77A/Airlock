extends Node2D



func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_tree(): 
	var new_tree = preload("res://pine_tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)

func spawn_red_tree(): 
	var new_tree = preload("res://red_pine_tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)
	
func _on_timer_timeout():
	spawn_mob()
	spawn_tree()
	spawn_red_tree()


func _on_player_health_depleted():
	%"Game Over".visible = true
	get_tree().paused = true


func _on_start_pressed() -> void:
	%MainMenu.queue_free()
	%Timer.autostart


func _on_start_timer_timeout() -> void:
	%MainMenu.visible = true
