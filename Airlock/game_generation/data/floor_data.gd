class_name floorData extends Resource

@export var name : String
@export var roomFiles : Array[String] = []
@export var floorSize : int = 1

var nodeData : Dictionary[Vector2i, roomData] = {}

func add_room(data: roomData, location : Vector2i) -> bool:
	for l in data.nodesOccupying:
		if nodeData.get(l+location) != null:
			return false
	data.globalOrigin = location
	
	for l in data.nodesOccupying:
		nodeData.set(l + location, data)
	
	return true

func contains(location : Vector2i) -> bool:
	return nodeData.get(location) != null
	
func remove(location : Vector2i):
	var data: roomData = get_room(location)
	var origin: Vector2i = data.globalOrigin
	for l in data.nodesOccupying:
		nodeData.erase(l+origin)

func get_room(location : Vector2i) -> roomData:
	return nodeData.get(location)
