extends Area2D
var travelled_distance = 0
var target_position
func _physics_process(delta):
	const SPEED = 100
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	

func _on_body_entered(body):
	if body.has_method("get_hit"):
		body.get_hit(15.0)
		queue_free()
	else: if !body.has_method("take_damage"):
		queue_free()
