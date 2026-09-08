extends Node2D



func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	%OxygenBar.value = %OxygenMeter.time_left
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


func _on_start_pressed():
	%Timer.start()
	%MainMenu.queue_free()
	%OxygenMeter.wait_time = GameManager.oxygen + 60
	%OxygenBar.max_value = %OxygenMeter.wait_time
	%OxygenMeter.start()
	


func _on_start_timer_timeout() -> void:
	%WhiteBackground.visible = false
	%MainMenu.visible = true


@export var credits_scene: PackedScene
func _on_credits_pressed() -> void:
	if credits_scene:
		var creditsScreen = credits_scene.instantiate()
		add_child(creditsScreen)

	
	

@export var version_scene: PackedScene
func _on_version_pressed() -> void:
	if version_scene:
		var versionScreen = version_scene.instantiate()
		add_child(versionScreen)


func _on_oxygen_meter_timeout() -> void:
	%"Game Over".visible = true
	get_tree().paused = true
