extends Control

@onready var start_button: Button = %Start
@onready var credits_button: Button = %Credits
@onready var version_button: Button = %Version



func _on_start_pressed():
	get_tree().change_scene_to_file("res://assets/Intro scenes/intro sequence.tscn")

func _on_start_timer_timeout() -> void:
	start_button.disabled = false
	credits_button.disabled = false
	version_button.disabled = false

	
@export var credits_scene: PackedScene
func _on_credits_pressed() -> void:
	if credits_scene:
		var creditsScreen = credits_scene.instantiate()
		add_child(creditsScreen)

	
	

@export var version_scene: PackedScene
func _on_version_pressed() -> void:
	if version_scene:
		var versionScreen = version_scene.instantiate()
		add_child(versionScreen)
