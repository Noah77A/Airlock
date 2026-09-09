extends Node2D


func _ready():
	%Timer.start()
	%OxygenMeter.wait_time = GameManager.oxygen + 60
	%OxygenBar.max_value = %OxygenMeter.wait_time
	%OxygenMeter.start()
	

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	%OxygenBar.value = %OxygenMeter.time_left
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
	
func _on_timer_timeout():
	return
	#spawn_mob()
	#spawn_tree()
	#spawn_red_tree()


func _on_player_health_depleted():
	%"Game Over".visible = true
	get_tree().paused = true


func _on_oxygen_meter_timeout() -> void:
	%"Game Over".visible = true
	get_tree().paused = true
