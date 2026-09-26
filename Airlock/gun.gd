extends Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var marker_2d: Marker2D = %ShootingPoint
@onready var roomHandler = get_node("/root/Game/PlayerRoomHandler")

var autofire = false
var fire = false
func _physics_process(delta):
	
	if(autofire):
		var enemies_in_range = get_overlapping_bodies()
		if enemies_in_range.size() > 0:
			var target_enemy = enemies_in_range[0]
			look_at(target_enemy.global_position)
		else:
			look_at(get_global_mouse_position())
	else: look_at(get_global_mouse_position())



func shoot():
	var roomScene = roomHandler.loadedRoomInstance
	if !roomScene: pass
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.position = marker_2d.global_position
	new_bullet.target_position = (get_global_mouse_position() - marker_2d.global_position).normalized()
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	roomScene.add_child(new_bullet)
	audio_stream_player_2d.pitch_scale = randf() * 2.0
	audio_stream_player_2d.play()
	
	
func _input(event) -> void:
	if event.is_action_pressed("shoot") && fire:
		shoot()
		fire = false
	if event.is_action_pressed("autofire"):
		if(autofire):
			autofire = false
		else:
			autofire = true


func _on_timer_timeout() -> void:
	%FireRate.wait_time = GameManager.fireRate
	fire = true
	if(autofire):
		var enemies_in_range = get_overlapping_bodies()
		if enemies_in_range.size() > 0:
			shoot()
			fire = false
