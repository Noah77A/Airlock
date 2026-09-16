extends StaticBody2D
var set = false
func _physics_process(delta):
	if(GameManager.credits >= 15): 
		if(set == false):
			%CrateSprite.unlock()
			set = true
	else:
		set = false
		%CrateSprite.broke()
