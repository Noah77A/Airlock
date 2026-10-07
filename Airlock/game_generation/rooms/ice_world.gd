extends Node2D

func _ready() -> void:
	%Timer.start()
	

func spawn_mob():
	var mob_select = randi_range(1,3)
	var new_mob = preload("res://mob.tscn").instantiate()
	if(mob_select == 3):# 1 in 3 chance a drone is spawned instead
		new_mob = preload("res://drone.tscn").instantiate()
	
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
	
	

func _on_timer_timeout() -> void:
	spawn_mob() # Replace with function body.
