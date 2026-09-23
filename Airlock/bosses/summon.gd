extends Node2D
var summonsLeft = GameManager.difficulty +3

@onready var roomHandler = get_node("/root/Game/PlayerRoomHandler")
@onready var general_boss: CharacterBody2D = $".."

func _on_timer_timeout() -> void:
	var roomScene = roomHandler.loadedRoomInstance
	if summonsLeft >0 && roomScene:
		var new_mob1 = preload("res://Soldier.tscn").instantiate()
		new_mob1.global_position = %Spawn1.position + general_boss.position
		roomScene.add_child(new_mob1)
		var new_mob2 = preload("res://Soldier.tscn").instantiate()
		new_mob2.global_position = %Spawn2.position + general_boss.position
		roomScene.add_child(new_mob2)
		var new_mob3 = preload("res://Soldier.tscn").instantiate()
		new_mob3.global_position = %Spawn3.position + general_boss.position
		roomScene.add_child(new_mob3)
		var new_mob4 = preload("res://Soldier.tscn").instantiate()
		new_mob4.global_position = %Spawn4.position + general_boss.position
		roomScene.add_child(new_mob4)
		summonsLeft -=1
