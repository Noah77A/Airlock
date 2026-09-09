extends CanvasLayer

func _physics_process(delta):
	if(GameManager.credits > 15): 
		GameManager.credits -= 15
		upgrade()

func upgrade():
	
	var rando = randi_range(0,3)
	if (rando == 1):
		%choice1.text = "Damage"
		
	%Upgrade.queue_free()
