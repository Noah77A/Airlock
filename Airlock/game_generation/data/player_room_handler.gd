extends Node2D

const collisionLayer = 1

@onready var player: CharacterBody2D = get_node("/root/Game/Player")

var loadedData: roomData
var loadedRoomInstance

var curFloorData : floorData = floorData.new() 

func load_room(data: roomData):
	if(data == null):return
	loadedData = data
	
	var scene = load(data.roomPath + data.scenePath)
	if loadedRoomInstance !=null: remove_child(loadedRoomInstance)
	loadedRoomInstance = scene.duplicate().instantiate()
	add_child(loadedRoomInstance)
	loadedRoomInstance.z_index = -1

func load_floor(floorPath : String):
	curFloorData = load(floorPath).duplicate()
	
	var r = randi_range(0, curFloorData.roomFiles.size() - 1)
	curFloorData.add_room(load(curFloorData.roomFiles[r]).duplicate(), Vector2i(0,0))
	generate_floor(curFloorData.get_room(Vector2i(0,0)))
	
	load_room(curFloorData.get_room(Vector2i(0,0)))

func generate_floor(curRoomData : roomData, recursions : int = 0):
	var exits = get_exits(curRoomData)
	for exit in exits:
		if(recursions >= curFloorData.floorSize):
			place_special("boss", exit)
			continue
		for i in range(5):
			var r = randi_range(0, curFloorData.roomFiles.size() - 1)
			var room:roomData = load(curFloorData.roomFiles[r])
			if(room.tags.find("boss") != -1):continue
			var roomDup = room.duplicate()
			if(curFloorData.add_room(roomDup, exit)):
				generate_floor(roomDup, recursions + 1)
				break

func place_special(tag: String, location: Vector2i):
	var specialRooms : Array[roomData] = []
	for roomFile in curFloorData.roomFiles:
		var room : roomData = load(roomFile)
		if(room.tags.find("boss") == -1):continue
		specialRooms.append(room)
	var r = randi_range(0, specialRooms.size() - 1)
	var room:roomData = specialRooms[r]
	if(!curFloorData.add_room(room.duplicate(), location)):return
	print(tag + " created at "  + str(location))

func get_exits(data:roomData) -> Array[Vector2i]:
	var exits : Array[Vector2i] = []
	var parScene = load(data.roomPath + data.scenePath).instantiate()
	var nodes = []
	for scene in parScene.get_children():
		var name:String = scene.name 
		if(name.contains("RoomExit")):nodes.append(scene)
	
	for exit in nodes:
		var dir = Vector2i(0,0)
		if(exit.direction == "N"):
			dir = Vector2i(0,1)
		if(exit.direction == "E"):
			dir = Vector2i(1,0)
		if(exit.direction == "S"):
			dir = Vector2i(0,-1)
		if(exit.direction == "W"):
			dir = Vector2i(-1,0)
		exits.append(dir + data.globalOrigin + exit.localOrigin)
	
	return exits

func get_room_scene():
	return loadedRoomInstance
