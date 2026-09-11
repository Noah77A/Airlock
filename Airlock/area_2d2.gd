extends Area2D

@export var factor: float = 2.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.speed_mult *= factor

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.speed_mult /= factor
