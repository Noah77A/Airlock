extends StaticBody2D
var doOnce = false
func _physics_process(delta):
	if(GameManager.credits >= GameManager.price): 
		if(doOnce == false):
			%CrateSprite.unLock()
			doOnce = true
	else:
		doOnce = false
		%CrateSprite.broke()



func _on_unlock_box_body_entered(body: Node2D) -> void:
	if body.has_method("RoundStart"):
		if(GameManager.credits >= GameManager.price):
			GameManager.upgradeSignal = true
			GameManager.credits -= GameManager.price
			GameManager.price += GameManager.difficulty
