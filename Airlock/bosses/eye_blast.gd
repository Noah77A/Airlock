extends Marker2D
@onready var player = get_node("/root/Game/Player")




func _physics_process(delta):
	look_at(player.global_position)
func fire():
	const BLAST = preload("res://enemy_bullet.tscn")
	var new_bullet = BLAST.instantiate()
	new_bullet.global_position = global_position
	new_bullet.global_rotation = global_rotation
	add_child(new_bullet)
	


func _on_timer_timeout() -> void:
	fire()
	
