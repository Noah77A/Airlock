extends CharacterBody2D
var health = 30 + (GameManager.difficulty*20)
var speed = 85
@onready var player = get_node("/root/Game/Player")




func _physics_process(delta):
	var things_in_range = %DetectionBox.get_overlapping_bodies()
	if things_in_range.any(func(body): return body.has_method("get_hit")):
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()
	if velocity.length() > 0.0:
		$BossAnimate.play_walk()	
	else: 	
		$BossAnimate.play_idle()
func take_damage():
	health -= GameManager.damage
	%BossAnimate.play_hurt()
	
	if (health <= 0):
		GameManager.credits += 3+(GameManager.difficulty*2)
		GameManager.experiance += 3
		
		queue_free()
		GameManager.haveKey = true
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
	speed = 40
	await get_tree().create_timer(0.4).timeout
	speed = 85
