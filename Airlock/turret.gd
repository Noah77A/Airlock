extends StaticBody2D
var health = 20 + (GameManager.difficulty*10)

@onready var player = get_node("/root/Game/Player")

func take_damage():
	health -= GameManager.damage
	%TurretSprite.play_hurt()
	
	if (health <= 0):
		GameManager.credits += (GameManager.difficulty*2)-1
		GameManager.experiance += (GameManager.difficulty*2)-1
		
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
