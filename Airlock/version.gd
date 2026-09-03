extends CanvasLayer

const SCROLL_SPEED = 100
@onready var VersionText = %VersionText

func _ready() -> void:
	VersionText.position.y = VersionText.size.y

func _process(delta) -> void:
	VersionText.position.y -= SCROLL_SPEED * delta
	if VersionText.position.y < 0:
		queue_free()
