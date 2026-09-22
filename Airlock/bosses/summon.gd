extends Node2D
var summonsLeft = GameManager.difficulty +3


func _on_timer_timeout() -> void:
	if summonsLeft >0 :
		var new_mob1 = preload("res://mob.tscn").instantiate()
		new_mob1.global_position = %Spawn1.position
		add_child(new_mob1)
		var new_mob2 = preload("res://mob.tscn").instantiate()
		new_mob2.global_position = %Spawn2.position
		add_child(new_mob2)
		var new_mob3 = preload("res://mob.tscn").instantiate()
		new_mob3.global_position = %Spawn3.position
		add_child(new_mob3)
		var new_mob4 = preload("res://mob.tscn").instantiate()
		new_mob4.global_position = %Spawn4.position
		add_child(new_mob4)
		summonsLeft -=1
