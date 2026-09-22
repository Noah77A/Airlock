extends Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var marker_2d: Marker2D = %ShootingPoint
func _physics_process(delta):
	look_at(get_global_mouse_position())



func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.position = marker_2d.global_position
	new_bullet.target_position = (get_global_mouse_position() - marker_2d.global_position).normalized()
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	audio_stream_player_2d.pitch_scale = randf() * 2.0
	audio_stream_player_2d.play()
	
	
func _input(event) -> void:
	if event.is_action_pressed("shoot"):
		shoot()
	
