extends StaticBody2D
var doOnce = false
func _physics_process(delta):
	%Cost.text = str(GameManager.price)
	if(GameManager.credits >= GameManager.price): 
		if(doOnce == false):
			%Cost.add_theme_color_override("font_color",Color(0.241, 0.796, 0.405, 1.0))
			%CrateSprite.unLock()
			doOnce = true
	else:
		doOnce = false
		%CrateSprite.broke()
		%Cost.add_theme_color_override("font_color", Color(0.5, 0.164, 0.142, 1.0))



func _on_unlock_box_body_entered(body: Node2D) -> void:
	if body.has_method("RoundStart"):
		if(GameManager.credits >= GameManager.price):
			GameManager.upgradeSignal = true
			GameManager.credits -= GameManager.price
			GameManager.price += GameManager.difficulty
			queue_free()
