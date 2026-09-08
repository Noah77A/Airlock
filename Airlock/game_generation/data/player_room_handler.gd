extends Node2D

const collisionLayer = 1

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
	
	
	var scene = load(data.scenePath)
	if loadedRoomInstance !=null: remove_child(loadedRoomInstance)
	loadedRoomInstance = scene.instantiate()
	add_child(loadedRoomInstance)
	
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
	var test: roomData = roomData.new()
	test.scenePath = test.roomPath + "test_room1.tscn"
	test.name = "test"
	test.roomExits = [[Vector2i(-4,-3), Vector2i(0,0), 'W']]
	test.nodesOccupying = [Vector2i(0,0)]
	test.tags = [] 
	var test2: roomData = roomData.new()
	test2.scenePath = test.roomPath + "test_room2.tscn"
	test2.name = "test2"
	test2.roomExits = [[Vector2i(-4,-3), Vector2i(0,0), 'W']]
	test2.nodesOccupying = [Vector2i(0,0)]
	test2.tags = [] 
	
	curFloorData.add_room(test, Vector2i(0,0))
	curFloorData.add_room(test2, Vector2i(-1,0))
	load_room(curFloorData.get_room(Vector2i(0,0)))
	load_room(curFloorData.get_room(Vector2i(-1,0)))
	
func _ready() -> void:
	load_floor()
