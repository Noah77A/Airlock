extends CanvasLayer

const SCROLL_SPEED = 100
@onready var CreditsText = %CreditsText

func _ready() -> void:
	CreditsText.position.y = CreditsText.size.y

func _process(delta) -> void:
	CreditsText.position.y -= SCROLL_SPEED * delta
	if CreditsText.position.y < 0:
		queue_free()
