extends CanvasLayer

func _on_start_journey_pressed() -> void:
	get_tree().change_scene_to_file("res://survivors_game.tscn")
