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
	for x in range(-3, 3):
		for y in range(-3, 3):
			var r = randi_range(0, curFloorData.roomFiles.size() - 1)
			curFloorData.add_room(load(curFloorData.roomFiles[r]).duplicate(), Vector2i(x,y))
	var room = curFloorData.get_room(Vector2i(0,0))
	load_room(room)

func get_room_scene():
	return loadedRoomInstance
