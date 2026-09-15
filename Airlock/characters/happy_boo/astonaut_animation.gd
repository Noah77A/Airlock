extends AnimatedSprite2D
func _ready():
	stop()
	frame = 0
func walk():
	play()
func idle():
	stop()
	frame=0
