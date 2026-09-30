extends Area2D


@export var damage: int = 2
@export var tick_interval: float = 0.5  

var bodies_inside: Array[Node2D] = []
var tick_timer: Timer


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

	tick_timer = Timer.new()
	tick_timer.wait_time = tick_interval
	tick_timer.timeout.connect(_on_tick)
	add_child(tick_timer)


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("get_hit"):
		bodies_inside.append(body)
		body.get_hit(damage) 
		if tick_timer.is_stopped():
			tick_timer.start()


func _on_body_exited(body: Node2D) -> void:
	bodies_inside.erase(body)
	if bodies_inside.is_empty():
		tick_timer.stop()


func _on_tick() -> void:
	for body in bodies_inside.duplicate():
		if is_instance_valid(body):
			body.get_hit(damage)
		else:
			bodies_inside.erase(body)
