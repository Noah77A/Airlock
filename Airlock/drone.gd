extends CharacterBody2D
var health = 2 + GameManager.difficulty
var summon = true
@onready var player = get_node("/root/Game/Player")


##func _ready():  
	#summon = false
	#%SummonSprite.visible = true
	#await get_tree().create_timer(0.6).timeout
	#%SummonSprite.visible = false
	#summon = true
	#%Slime.play_walk()

func _physics_process(delta):
	if(summon):
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 60
		look_at(player.global_position)
		move_and_slide()
	
func take_damage():
	health -= GameManager.damage
	play_hurt()
	
	if (health <= 0):
		GameManager.credits += 1
		GameManager.experiance += 1
		
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
func play_hurt():
	modulate = Color(0.651, 0.0, 0.0, 1.0)
	await get_tree().create_timer(0.4).timeout
	modulate = Color(1.0, 1.0, 1.0, 1.0)
