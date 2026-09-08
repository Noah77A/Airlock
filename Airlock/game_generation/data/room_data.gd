class_name roomData

var roomPath: String = "res://game_generation/rooms/"

@export var name = ""#name for reasons
@export var scenePath: String = roomPath + "."
@export var nodesOccupying : Array[Vector2i] = [Vector2i(0,0), Vector2i(0,1)] #example of which rooms this will be occupying with 0,0 generally being the origin
@export	var roomExits = [[Vector2i(0,0), Vector2i(0,0), 'N'], [Vector2i(10,-4), Vector2i(0,1), 'E']]#tile position, rooms and directions in which exits willbe possible
@export var globalOrigin: Vector2i = Vector2i(0,0)#is set when placed into data
@export	var tags = ["vaccum"] #additional tags for individual room mods and such
