extends CharacterBody2D
var health = 30 + (GameManager.difficulty*50)

@onready var player = get_node("/root/Game/Player")



func _physics_process(delta):
	
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 20.0
	move_and_slide()
	if velocity.length() > 0.0:
		$BossAnimate.play_walk()
	else: 
		$BossAnimate.play_idle()

func take_damage():
	health -= GameManager.damage
	%BossAnimate.play_hurt()
	
	if (health <= 0):
		GameManager.credits += 5
		GameManager.experiance += 5
		player.o2 = GameManager.oxygen
		queue_free()
		
		GameManager.haveKey = true
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		Fade.fade_to_black()

		
	
