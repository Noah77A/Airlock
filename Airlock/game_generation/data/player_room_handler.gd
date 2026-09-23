extends Node2D

const collisionLayer = 1

const doorCD: float = 2.0
var lastTimeDoorUsed: float = 0

@onready var player: CharacterBody2D = get_node("/root/Game/Player")

var loadedData: roomData
var loadedRoomInstance

#local tile pos, exit data
#exit directions are stored the the z position 
#exit directions: 0->north, 1->east, 2->south, 3->west
var loadedExits: Dictionary[Vector2i, Vector3i]

var curFloorData : floorData = floorData.new() 

func load_room(data: roomData):
	loadedData = data
	
	var scene = load(data.roomPath + data.scenePath)
	if loadedRoomInstance !=null: remove_child(loadedRoomInstance)
	loadedRoomInstance = scene.instantiate()
	add_child(loadedRoomInstance)
	loadedRoomInstance.z_index = -1
	
	loadedExits.clear()
	for exit in loadedData.roomExits:
		var localPos: Vector2i = exit[0]
		var localRoomPos: Vector2i = exit[1]
		var exitDir = exit[2]
		var exitDirNum = 0
		if exitDir == "N":
			exitDirNum = 0
		if exitDir == "E":
			exitDirNum = 1
		if exitDir == "S":
			exitDirNum = 2
		if exitDir == "W":
			exitDirNum = 3
		loadedExits.set(localPos, Vector3i(localRoomPos.x, localRoomPos.y, exitDirNum))


func load_floor():
	curFloorData = load("res://game_generation/resources/floors/test_floor.tres").duplicate()
	for x in range(-3, 3):
		for y in range(-3, 3):
			var r = randi_range(0, curFloorData.roomFiles.size() - 1)
			curFloorData.add_room(load(curFloorData.roomFiles[r]).duplicate(), Vector2i(x,y))
	
	load_room(curFloorData.get_room(Vector2i(0,0)))

func playerDoorCheck()->void:
	if (loadedRoomInstance == null): return
	var map: TileMapLayer = loadedRoomInstance.find_child("TileMapLayer")
	if !map: return
	var localTilePos: Vector2i = map.local_to_map(player.position)
	if!loadedExits.has(localTilePos):return
	
	var exit: Vector3i = loadedExits.get(localTilePos)
	if !exit: return
	var dir: int = exit[2]
	var localPos: Vector2i = Vector2i(exit[0], exit[1])
	var globalPos: Vector2i = loadedData.globalOrigin
	
	if dir == 0:
		if !curFloorData.contains(globalPos + localPos + Vector2i(0,1)) : return
		load_room(curFloorData.get_room(globalPos + localPos + Vector2i(0,1)))
		dir = 2
	else: if dir == 1:
		if !curFloorData.contains(globalPos + localPos + Vector2i(1,0)) : return
		load_room(curFloorData.get_room(globalPos + localPos + Vector2i(1,0)))
		dir = 3
	else: if dir == 2:
		if !curFloorData.contains(globalPos + localPos + Vector2i(0,-1)) : return
		load_room(curFloorData.get_room(globalPos + localPos + Vector2i(0,-1)))
		dir = 0
	else: if dir == 3:
		if !curFloorData.contains(globalPos + localPos + Vector2i(-1,0)) : return
		load_room(curFloorData.get_room(globalPos + localPos + Vector2i(-1,0)))
		dir = 1
	var nextExit = loadedExits.find_key(Vector3i(localPos.x, localPos.y ,dir))
	if !nextExit: return
	var globalTilePos = map.to_global(map.map_to_local(Vector2i(nextExit.x, nextExit.y)))
	player.position = globalTilePos
	lastTimeDoorUsed = 0

func _process(delta: float) -> void:
	lastTimeDoorUsed += delta
	if(lastTimeDoorUsed < doorCD): return
	playerDoorCheck()

func _ready() -> void:
	load_floor()

func get_room_scene():
	return loadedRoomInstance
