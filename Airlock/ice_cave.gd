extends Area2D

@export var destination: Marker2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		call_deferred("_teleport", body)

func _teleport(body: Node2D) -> void:
	body.global_position = destination.global_position
	if body is CharacterBody2D:
		body.velocity = Vector2.ZERO
