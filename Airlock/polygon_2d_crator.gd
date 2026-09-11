signal combo_generated(letters: Array[int])
signal combo_progress(index: int)
signal combo_escaped

@export var combo_length: int = 4
@export var snap_margin: float = 6.0

var _trap_count: int = 0
var _solved: bool = false
var _combo: Array[int] = []          # KEY_A … KEY_Z keycodes
var _combo_index: int = 0
var _safe_position: Vector2 = Vector2.ZERO
var _trap_center: Vector2 = Vector2.ZERO

func is_trapped() -> bool:
	return _trap_count > 0 and not _solved

func _generate_combo() -> void:
	_combo.clear()
	for i in combo_length:
		_combo.append(KEY_A + randi() % 26)
	_combo_index = 0
	combo_generated.emit(_combo)

func combo_as_string() -> String:
	var s := ""
	for k in _combo:
		s += OS.get_keycode_string(k)
	return s
	
func _unhandled_key_input(event: InputEvent) -> void:
	if not is_trapped():
		return
	var key := event as InputEventKey
	if key == null or not key.pressed or key.echo:
		return
	if key.keycode < KEY_A or key.keycode > KEY_Z:
		return

	if key.keycode == _combo[_combo_index]:
		_combo_index += 1
		if _combo_index >= _combo.size():
			_solved = true
			combo_escaped.emit()
		else:
			combo_progress.emit(_combo_index)
	else:
		# wrong letter resets, but still cr
		_combo_index = 1 if key.keycode == _combo[0] else 0
		combo_progress.emit(_combo_index)
	
func _on_trap_entered(area: Area2D) -> void:
	_trap_count += 1
	_trap_center = area.global_position
	if _combo.is_empty():
		_solved = false
		_generate_combo()

func _on_trap_exited(_area: Area2D) -> void:
	_trap_count = max(_trap_count - 1, 0)
	if _trap_count > 0:
		return

	if _solved:
		_solved = false
		_combo.clear()        
	else:
		# hasn't earned it — put him back just inside
		var inward := (_trap_center - _safe_position).normalized()
