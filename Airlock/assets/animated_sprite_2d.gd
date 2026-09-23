extends AnimatedSprite2D

@export var textLabel = RichTextLabel

func _ready():
	stop()
	frame = 0
		
func increase_frame():
	if (frame < 6):
		frame += 1
	else:
		get_tree().change_scene_to_file("res://survivors_game.tscn")

"position"
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_pressed("shoot")):
		increase_frame()
		change_text()

func change_text():
	if(frame == 1):
		textLabel.text = ""
	elif (frame == 2):
		textLabel.text = "Lore 3"
	elif (frame == 3):
		textLabel.text  = "Lore 4"	
	elif (frame == 4):
		textLabel.text  = "Lore 5"	
	elif (frame == 5):
		textLabel.text  = "Lore 6"	
	elif (frame == 6):
		textLabel.text = "Lore 7"
