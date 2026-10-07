extends Node2D




func _on_quit_button_pressed() -> void:
	get_tree().quit(0)


func _on_credits_pressed() -> void:
	GameManager.difficulty = 1
	GameManager.credits = 0
	GameManager.oxygen = 120
	GameManager.level = 1
	GameManager.pierce = 1
	GameManager.damage = 10
	GameManager.maxHealth = 100
	GameManager.movement = 1
	GameManager.experiance = 0
	GameManager.regen = 0
	GameManager.bulletSpeed = 1
	GameManager.bulletSize = 0.25
	GameManager.price = 10
	GameManager.fireRate = 0.4
	GameManager.range=155
	GameManager.upgradeSignal = false
	GameManager.healthSignal = false
	GameManager.haveKey = false
	GameManager.ice = false
	get_tree().change_scene_to_file("res://ui/credits.tscn")
