extends CanvasLayer

const SCROLL_SPEED = 100
@onready var CreditsText = %CreditsText

func _ready() -> void:
	CreditsText.position.y = CreditsText.size.y

func _process(delta) -> void:
	CreditsText.position.y -= SCROLL_SPEED * delta
	if CreditsText.position.y < 0:
		get_tree().change_scene_to_file("res://menu.tscn")


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
