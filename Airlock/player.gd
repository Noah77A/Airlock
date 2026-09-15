extends CharacterBody2D
signal health_depleted
var health = 100.0
var o2 = 60
func _ready():
	RoundStart()
func _physics_process(delta):
	var ice = false
	if(ice):
		var ground_accel: float = 0.0
		var ground_friction: float = 0.0
		var ice_accel: float = 1.0
		var ice_friction: float = -1.0
		var _ice_count:int=0
		var on_ice := _ice_count > 0
		var accel := ice_accel 
		var friction := ice_friction 
		var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
		# friction always applies, not just when input is released
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		if dir != Vector2.ZERO:
			velocity += dir * accel * delta
		move_and_slide()
	else:
		var direction = Input.get_vector("move_left","move_right","move_up","move_down")
		velocity = direction * 80
		move_and_slide()
	
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()	
	else: 	
		$HappyBoo.play_idle_animation()	
	const DAMAGE_RATE = 5.0	
	var overlapping_mobs = %Hurtbox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		if health <= 0.0:
			health_depleted.emit()
	health += GameManager.regen * delta
	%Health.value = health
	%Money.text = str(GameManager.credits)
	
	o2 -= 1*delta
	%OxygenBar.value = o2
	if o2 <= 0:
		health_depleted.emit()
	%ExpBar.value = GameManager.exp
	if(GameManager.exp >= 15 +(GameManager.level * 2)):
		GameManager.exp -= 15 + (GameManager.level * 2)
		GameManager.level += 1
		%ExpBar.maxvalue = 15 +(GameManager.level * 2)
		GameManager.oxygen += 5
		o2 +=15
		%OxygenBar.max_value +=5
		

func RoundStart():
	o2 = GameManager.oxygen
	%OxygenBar.max_value = o2

#func _physics_process_ice(delta: float) -> void:
	#var ground_accel: float = 0.0
	#var ground_friction: float = 0.0
	#var ice_accel: float = 1.0
	#var ice_friction: float = -1.0
	#var _ice_count:int=0
	#var on_ice := _ice_count > 0
	#var accel := ice_accel 
	#var friction := ice_friction 

	#var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	# friction always applies, not just when input is released
	#velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	#if dir != Vector2.ZERO:
	#	velocity += dir * accel * delta

	#move_and_slide()
