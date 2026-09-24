extends Sprite2D
var baseColor : Color = Color(1.0, 1.0, 1.0, 1.0)
func play_hurt():
	modulate = Color(0.651, 0.0, 0.0, 1.0)
	await get_tree().create_timer(0.4).timeout
	modulate = baseColor
