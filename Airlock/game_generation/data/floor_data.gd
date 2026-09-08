class_name floorData

@export var occupiedNodes : Dictionary[Vector2i, int] = {}

@export var nodeData : Array = []

func add_room(data: roomData, location : Vector2i) -> bool:
	for l in data.nodesOccupying:
		if occupiedNodes.find_key(l+location):
			return false
	
	nodeData.append(data)
	
	for l in data.nodesOccupying:
		occupiedNodes[l + location] = nodeData.size() - 1
	return true

func contains(location : Vector2i) -> bool:
	return occupiedNodes.get(location) != null
	
func remove(location : Vector2i):
	var data: roomData = get_room(location)
	var origin: Vector2i = data.globalOrigin
	nodeData.remove_at(occupiedNodes.get(location))
	for l in data.nodesOccupying:
		occupiedNodes.erase(l+origin)

func get_room(location : Vector2i) -> roomData:
	return nodeData.get(occupiedNodes.get(location))
