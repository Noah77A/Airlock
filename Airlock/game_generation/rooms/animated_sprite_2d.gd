extends AnimatedSprite2D

func _physics_process(delta):
	if(GameManager.haveKey):
		frame= 1
	else:
		frame= 0
