extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Button.pressed.connect(_on_back_pressed)
	
func _on_back_pressed()->void:
	get_tree().change_scene_to_file(res://Scroll_version.tscn)
