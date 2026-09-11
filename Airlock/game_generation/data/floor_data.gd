class_name floorData extends Resource

@export var roomFiles : Array[String] = []

var occupiedNodes : Dictionary[Vector2i, int] = {}

var nodeData : Dictionary[int, roomData] = {}

func add_room(data: roomData, location : Vector2i) -> bool:
	for l in data.nodesOccupying:
		if occupiedNodes.find_key(l+location):
			return false
	
	var dataptr = nodeData.size()
	data.globalOrigin = location
	nodeData.set(dataptr, data)
	
	for l in data.nodesOccupying:
		occupiedNodes.set(l + location, dataptr)
	return true

func contains(location : Vector2i) -> bool:
	return occupiedNodes.get(location) != null
	
func remove(location : Vector2i):
	var data: roomData = get_room(location)
	var origin: Vector2i = data.globalOrigin
	nodeData.erase(occupiedNodes.get(location))
	for l in data.nodesOccupying:
		occupiedNodes.erase(l+origin)

func get_room(location : Vector2i) -> roomData:
	return nodeData.get(occupiedNodes.get(location))
