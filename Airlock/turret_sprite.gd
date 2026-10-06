extends Sprite2D
var baseColor : Color = Color(1.0, 1.0, 1.0, 1.0)
func _ready():  
	if(GameManager.difficulty == 1):
		baseColor =  Color(1.0, 1.0, 1.0, 1.0)
	else: if(GameManager.difficulty == 2):
		baseColor = Color("8ddfbe")
	else: if (GameManager.difficulty == 3):
		baseColor = Color("eec575")
	else: if (GameManager.difficulty == 4):
		baseColor = Color("ebb6ed")
	else: if (GameManager.difficulty == 5):
		baseColor = Color("5b8c36")
	modulate = baseColor
func play_hurt():
	modulate = Color(0.651, 0.0, 0.0, 1.0)
	await get_tree().create_timer(0.4).timeout
	modulate = baseColor
