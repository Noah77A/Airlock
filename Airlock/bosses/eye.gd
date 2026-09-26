extends Marker2D
@onready var player = get_node("/root/Game/Player")
@onready var roomHandler = get_node("/root/Game/PlayerRoomHandler")



func _physics_process(delta):
	look_at(player.global_position)
	
func fire():
	var roomScene = roomHandler.loadedRoomInstance
	const BLAST = preload("res://enemy_bullet.tscn")
	var new_bullet = BLAST.instantiate()
	new_bullet.global_position = global_position
	new_bullet.global_rotation = rotation
	roomScene.add_child(new_bullet)
	


func _on_timer_timeout() -> void:
	var things_in_range = %DetectionBox.get_overlapping_bodies()
	if things_in_range.any(func(body): return body.has_method("get_hit")):
		fire()
	
