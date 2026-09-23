extends CharacterBody2D
var health = 3 + GameManager.difficulty

@onready var player = get_node("/root/Game/Player")


func _ready(): 
	%SoldierSprite.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 30.0
	move_and_slide()
	
func take_damage():
	health -= GameManager.damage
	%SoldierSprite.play_hurt()
	
	if (health <= 0):
		
		
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
