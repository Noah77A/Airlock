extends CanvasLayer
var option1
var option2

func _physics_process(delta):
	if(GameManager.upgradeSignal): 
		GameManager.upgradeSignal = false
		upgrade()

func upgrade():
	visible = true
	get_tree().paused = true
	var rando = randi_range(1,5)
	if (rando == 1):
		option1 = "Damage"
		%Choice1.text = "Damage"
		
	if (rando == 2):
		option1 = "Pierce"
		%Choice1.text = "Pierce"
		
	if (rando == 3):
		option1 = "Regen"
		%Choice1.text = "Regen"
	if(rando == 4):
		option1 = "BulletSpd"
		%Choice1.text = "Bullet Speed"
	if(rando == 5):
		option1 = "Speed"
		%Choice1.text = "Movement Speed"
	option1 = option2
	while(option1 == option2):
		rando = randi_range(1,5)
		if (rando == 1):
			option2 = "Damage"
			%Choice2.text = "Damage"
		if (rando == 2):
			option2 = "Pierce"
			%Choice2.text = "Pierce"
		if (rando == 3):
			option2 = "Regen"
			%Choice2.text = "Regen"
		if(rando == 4):
			option2 = "BulletSpd"
			%Choice2.text = "Bullet Speed"
		if(rando == 5):
			option2 = "Speed"
			%Choice2.text = "Movement Speed"
	


func _on_choice_1_pressed():
	var select = option1
	if(select == "Damage"):
		GameManager.damage +=1
	if(select == "Pierce"):
		GameManager.pierce +=1
	if(select == "Health"):
		GameManager.health +=1
	if(select == "Speed"):
		GameManager.movement +=1
	if(select == "Regen"):
		GameManager.regen +=1
	if(select == "BulletSpd"):
		GameManager.bulletSpeed+=0.5
	if(select == "Speed"):
		GameManager.movement += 0.5
	visible = false
	get_tree().paused = false
	


func _on_choice_2_pressed() -> void:
	var select = option2
	if(select == "Damage"):
		GameManager.damage +=1
	if(select == "Pierce"):
		GameManager.pierce +=1
	if(select == "Health"):
		GameManager.health +=1
	if(select == "Speed"):
		GameManager.movement +=1
	if(select == "Regen"):
		GameManager.regen +=1
	if(select == "BulletSpd"):
		GameManager.bulletSpeed+=0.5
	if(select == "Speed"):
		GameManager.movement += 0.5
	visible = false
	get_tree().paused = false
