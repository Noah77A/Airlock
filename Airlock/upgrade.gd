extends CanvasLayer

func _physics_process(delta):
	if(GameManager.credits > 15): 
		GameManager.credits -= 15
		upgrade()

func upgrade():
	visible = true
	
	var rando = randi_range(1,3)
	if (rando == 1):
		%Choice1.text = "Damage"
		
	if (rando == 2):
		%Choice1.text = "Pierce"
		
	if (rando == 3):
		%Choice1.text = "Health"
	%Choice2.text = %Choice1.text
	while(%Choice2.text == %Choice1.text):
		rando = randi_range(1,3)
		if (rando == 1):
			%Choice2.text = "Damage"
		if (rando == 2):
			%Choice2.text = "Pierce"
		if (rando == 3):
			%Choice2.text = "Health"
	get_tree().paused = true


func _on_choice_1_pressed():
	get_tree().paused = false
	var select = %Choice1.text
	if(select == "Damage"):
		GameManager.damage +=1
	if(select == "Pierce"):
		GameManager.pierce +=1
	if(select == "Health"):
		GameManager.health +=1
	if(select == "Speed"):
		GameManager.movement +=1
	visible = false
	


func _on_choice_2_pressed() -> void:
	var select = %Choice2.text
	if(select == "Damage"):
		GameManager.damage +=1
	if(select == "Pierce"):
		GameManager.pierce +=1
	if(select == "Health"):
		GameManager.health +=1
	if(select == "Speed"):
		GameManager.movement +=1
	visible = false
	get_tree().paused = false
