extends CanvasLayer

@export var trap_area: Area2D      
@export var font_size: int = 32
@export var hide_delay: float = 0.4

@onready var _row: HBoxContainer = $CenterContainer/Letters

var _labels: Array[Label] = []
var _index: int = 0
var _flash_tween: Tween

func _ready() -> void:
	visible = false
	trap_area.combo_generated.connect(_on_combo_generated)
	trap_area.combo_progress.connect(_on_combo_progress)
	trap_area.combo_wrong.connect(_on_combo_wrong)
	trap_area.combo_escaped.connect(_on_combo_escaped)

func _on_combo_generated(letters: Array[int]) -> void:
	for l in _labels:
		l.queue_free()
	_labels.clear()
	_index = 0
	for k in letters:
		var label := Label.new()
		label.text = OS.get_keycode_string(k)
		label.add_theme_font_size_override("font_size", font_size)
		_row.add_child(label)
		_labels.append(label)
	_refresh_colors()
	visible = true

func _on_combo_progress(index: int) -> void:
	_index = index
	_refresh_colors()

func _on_combo_wrong(index: int) -> void:
	if index >= _labels.size():
		return
	if _flash_tween:
		_flash_tween.kill()
		_refresh_colors()          
	var label := _labels[index]
	_flash_tween = create_tween()
	for i in 2:        
		_flash_tween.tween_property(label, "modulate", Color.RED, 0.06)
		_flash_tween.tween_property(label, "modulate", Color.WHITE, 0.1)

func _on_combo_escaped() -> void:
	_index = _labels.size()
	_refresh_colors()    
	await get_tree().create_timer(hide_delay).timeout
	visible = false

func _refresh_colors() -> void:
	for i in _labels.size():
		_labels[i].modulate = Color.GREEN if i < _index else Color.WHITE
