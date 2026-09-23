extends Sprite2D

#@onready var camera: CharacterBody2D = $"."
#@onready var sprite_2d: Sprite2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("wpi fade out") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
