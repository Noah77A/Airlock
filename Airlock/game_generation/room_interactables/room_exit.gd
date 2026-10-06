extends Area2D

@onready var roomHandler = get_node("/root/Game/PlayerRoomHandler")
@onready var collision_shape_2d: CollisionShape2D = $Sprite2D/CollisionShape2D

@export var localOrigin : Vector2i = Vector2i(0,0)
@export var direction : String = "N" 
@export var floorSwitch : String = ""
@export var requiresKey : bool = false

var readyExit:bool = false
func _ready() -> void:
	self.add_to_group("exits")
	await get_tree().create_timer(1.5).timeout
	readyExit = true

func _on_body_entered(body: Node2D) -> void:
	if(body != roomHandler.player || !readyExit): return
	if(requiresKey && GameManager.haveKey): 
		GameManager.haveKey = false 
		requiresKey = false
	else: if(requiresKey && !GameManager.haveKey):
		return
	if(floorSwitch.length() > 0): roomHandler.load_floor(floorSwitch)
	var exitDir: Vector2i = Vector2i(0,0)
	if direction == "N":
		exitDir = Vector2i(0,1)
	if direction == "E":
		exitDir = Vector2i(1,0)
	if direction == "S":
		exitDir = Vector2i(0,-1)
	if direction == "W":
		exitDir = Vector2i(-1,0)
	var rData : roomData = roomHandler.loadedData
	
	print(GameManager.haveKey)
	roomHandler.player.position = Vector2(0,0)
	roomHandler.load_room(roomHandler.curFloorData.get_room(rData.globalOrigin + exitDir))
