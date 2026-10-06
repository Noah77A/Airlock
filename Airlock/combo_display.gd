extends CanvasLayer

@export var font_size: int = 32
@export var hide_delay: float = 0.4
@export var combo_length: int = 4

@onready var _row: HBoxContainer = $CenterContainer/Letters

var _labels: Array[Label] = []
var _index: int = 0
var _flash_tween: Tween = null
var _combo: Array[int] = []


func _ready() -> void:
	visible = false
	generate_combo()

#letter generator
func generate_combo() -> void:
	# Clear old labels
	for l in _labels:
		l.queue_free()
	_labels.clear()
	_index = 0
	_combo.clear()
	for i in range(combo_length):
		var key := KEY_A + randi() % 26
		_combo.append(key)
		var label := Label.new()
		label.text = OS.get_keycode_string(key)
		label.set("theme_override_font_sizes/font_size", font_size)
		_row.add_child(label)
		_labels.append(label)
	_refresh_colors()
	visible = true


# --------------------------------------------------------
#  CALL THIS WHEN PLAYER PRESSES A KEY
# ---------------------------------------------------------
func register_keypress(keycode: int) -> void:
	if _index >= _combo.size():
		return

	if keycode == _combo[_index]:
		_on_combo_progress()
	else:
		_on_combo_wrong()


#combo checker
func _on_combo_progress() -> void:
	_index += 1
	_refresh_colors()

	if _index >= _combo.size():
		_on_combo_complete()

func _on_combo_wrong() -> void:
	if _index >= _labels.size():
		return

	if is_instance_valid(_flash_tween):
		_flash_tween.kill()
		_refresh_colors()

	var label := _labels[_index]
	_flash_tween = create_tween()

	for i in range(2):
		_flash_tween.tween_property(label, "modulate", Color.RED, 0.06)
		_flash_tween.tween_property(label, "modulate", Color.WHITE, 0.1)



func _on_combo_complete() -> void:
	_refresh_colors()
	await get_tree().create_timer(hide_delay).timeout
	visible = false


func _refresh_colors() -> void:
	for i in range(_labels.size()):
		_labels[i].modulate = Color.GREEN if i < _index else Color.WHITE
