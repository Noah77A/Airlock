extends Node2D

## The floor resource (e.g. floor_1.tres). Drag it in via the Inspector.
@export var floor_data: floorData
## The first room to place when the level starts.
@export var start_room: PackedScene

## Pixel size of one grid node. Match this to your room size.
const CELL_SIZE := Vector2(320, 192)


func _ready() -> void:
	if floor_data == null:
		floor_data = floorData.new()
	else:
		# Work on a copy so the saved .tres isn't changed while the game runs
		floor_data = floor_data.duplicate(true)

	if start_room:
		place_room(start_room, Vector2i(0, 0))


## Places a room scene at a grid position. Returns false if the spot is taken.
func place_room(scene: PackedScene, grid_pos: Vector2i) -> bool:
	var room = scene.instantiate()

	if not "room_data" in room or room.room_data == null:
		push_error("Room scene is missing room_data: " + scene.resource_path)
		room.free()
		return false

	var data: roomData = room.room_data.duplicate()
	if not floor_data.add_room(data, grid_pos):
		room.free()
		return false

	room.room_data = data
	room.position = Vector2(grid_pos) * CELL_SIZE
	add_child(room)
	return true


## Removes whichever room covers this grid position.
func remove_room(grid_pos: Vector2i) -> void:
	if not floor_data.contains(grid_pos):
		return
	var data: roomData = floor_data.get_room(grid_pos)
	for child in get_children():
		if "room_data" in child and child.room_data == data:
			child.queue_free()
			break
	floor_data.remove(grid_pos)





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
