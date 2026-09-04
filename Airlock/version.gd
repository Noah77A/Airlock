extends CanvasLayer

const SCROLL_SPEED = 100
@onready var VersionText = %VersionText

func _ready() -> void:
	#VersionText.position.y = VersionText.size.y
	pass

func _process(delta) -> void:
	pass


func _on_button_pressed() -> void:
	queue_free() # Replace with function body.
