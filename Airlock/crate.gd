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
func _on_body_entered(body):
	if body.has_method("RoundStart"):
		if(GameManager.credits >= GameManager.price):
			GameManager.upgradeSignal = true
			GameManager.credits -= GameManager.price
			GameManager.price += GameManager.difficulty
