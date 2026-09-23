extends CanvasLayer
var option1
var option2

func _physics_process(delta):
	#if(GameManager.credits >= GameManager.price):
			#GameManager.credits -= GameManager.price
			#GameManager.price += GameManager.difficulty
			#upgrade()
	if(GameManager.upgradeSignal): 
		GameManager.upgradeSignal = false
		upgrade()

func upgrade():
	visible = true
	get_tree().paused = true
	var rando = randi_range(1,7)
	if (rando == 1):
		option1 = 1
		%Choice1.text = "Damage"
	if (rando == 2):
		option1 = 2
		%Choice1.text = "Pierce"
	if (rando == 3):
		option1 = 3
		%Choice1.text = "Regen"
	if(rando == 4):
		option1 = 4
		%Choice1.text = "Bullet Speed"
	if(rando == 5):
		option1 = 5
		%Choice1.text = "Movement Speed"
	if(rando == 6):
		option1 = 6
		%Choice1.text = "Maximum Health"
	if(rando == 7):
		option1 = 7
		%Choice1.text = "Bullet Size"
	option2 = option1
	while(option1 == option2):
		rando = randi_range(1,7)
		if (rando == 1):
			option2 = 1
			%Choice2.text = "Damage"
		if (rando == 2):
			option2 = 2
			%Choice2.text = "Pierce"
		if (rando == 3):
			option2 = 3
			%Choice2.text = "Regen"
		if(rando == 4):
			option2 = 4
			%Choice2.text = "Bullet Speed"
		if(rando == 5):
			option2 = 5
			%Choice2.text = "Movement Speed"
		if(rando == 6):
			option2 = 6
			%Choice2.text = "Maximum Health"
		if(rando == 7):
			option2 = 7
			%Choice2.text = "Bullet Size"


func _on_choice_1_pressed():
	selected(option1)
	


func _on_choice_2_pressed() -> void:
	selected(option2)
func selected(select):
	if(select == 1):
		GameManager.damage +=1
	if(select == 2):
		GameManager.pierce +=1
	if(select == 3):
		GameManager.regen +=1
	if(select == 4):
		GameManager.bulletSpeed+=0.5
	if(select == 5):
		GameManager.movement += 0.1
	if(select == 6):
		GameManager.maxHealth += 15
		GameManager.healthSignal = true
	if(select == 7):
		GameManager.bulletSize += 0.05
	visible = false
	get_tree().paused = false
