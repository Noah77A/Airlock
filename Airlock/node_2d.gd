extends CanvasLayer

func _ready() -> void:
	%ColorRect.visible = false
	
func fade_to_black():
	%ColorRect.visible = true
	%AnimationPlayer.play("modulate")
	await %AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://end_screen.tscn")
	queue_free()
	
	
