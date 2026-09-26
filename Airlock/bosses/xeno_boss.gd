extends CharacterBody2D
var health = 3 + GameManager.difficulty*2
var speed = 85
@onready var player = get_node("/root/Game/Player")




func _physics_process(delta):
	var things_in_range = %DetectionBox.get_overlapping_bodies()
	if things_in_range.any(func(body): return body.has_method("get_hit")):
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()

func take_damage():
	health -= GameManager.damage
	
	
	if (health <= 0):
		GameManager.credits += 5
		GameManager.experiance += 5
		
		queue_free()
		GameManager.haveKey = true
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
	speed = 40
	await get_tree().create_timer(0.4).timeout
	speed = 85
