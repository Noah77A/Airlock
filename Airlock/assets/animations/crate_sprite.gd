extends AnimatedSprite2D
func _ready():
	stop()
	frame = 0
func unLock():
	play()
func broke():
	stop()
	frame = 0
