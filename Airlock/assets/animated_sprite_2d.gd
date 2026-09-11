extends AnimatedSprite2D


func _ready():
	stop()
	frame = 0
		
func increase_frame():
	if (frame < 6):
		frame += 1
	else:
		queue_free()	
	
		


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_pressed("click")):
		increase_frame()# Replace with function body.
