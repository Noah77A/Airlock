extends AnimatedSprite2D

@export var textLabel = RichTextLabel

func _ready():
	stop()
	frame = 0
		
func increase_frame():
	if (frame < 6):
		frame += 1
	else:
		get_tree().change_scene_to_file("res://survivors_game.tscn")

"position"
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_pressed("shoot")):
		increase_frame()
		change_text()

func change_text():
	if(frame == 1):
		textLabel.text = "Despite Viridias technical prowess, there was an problem, close to home, that just kept evolving..
	Storms.
		Even though they could harness energy from the stars, they could never control the clouds above. No matter how much research and time they spent, nature's wrath was always smarter. A few months ago, Viridia faced their worst one yet..."
	elif (frame == 2):
		textLabel.text = "One random, fateful day, a collection of dark clouds materialized above the capitol city. Within a few hours, cataclysmic winds started to rip through the island. This was a catastrophe of otherwordly proportions. The protections Viridia created for storms, were completely destroyed. There was nothing they could've done. The civilization who brought so much to this world, was in their final hour"
	elif (frame == 3):
		textLabel.text  = "In their last moments, the nations leaders called upon Isaac Cadia, a former military combat pilot and now astronaut to venture to mainland by submarine with Viridia's classified research and technology. Isaac was sent to warn the rest of the world, and keep ISLANDS legacy alive. The moment he charted his course, he knew his home was gone. 
		The moment he made landfall days later, he was met with by the commander of the global space force, Isaacs commander. A man he's only heard legends of. The two have never met in person before, but the commander knew this day would come."	
	elif (frame == 4):
		textLabel.text  = "The GSF has been monitoring nearby alien systems for decades, and this storm is something they've seen time and time again, wiping out planet after planet. 
		
		Except for one: Expeditition IV. 
		A planet system only a few light years away, faced this exact same storm, but seemed to figure out a way to make it pass. Commander realized our only hope was to venture to Expeditition, and learn how they survived the storm. Isaac, couldn't let the rest of the world suffer the fate of his home. He was perfect for this mission."
	elif (frame == 5):
		textLabel.text  = "Isaac took off that same day, without hesitation, on a spaceship that he helped create. He's been on missions like this before, he was hoping the Expiditioners were peaceful, but he came prepared for the worst. 
		
		After a week of spacetravel, he arrived at Expidtition, and sent out a diplomatic signal.
		
		Isaac was ready to save his world. "
	elif (frame == 6):

		textLabel.text = "However, the Expidititioners had other plans...."
		





func _on_skip_pressed() -> void:
	get_tree().change_scene_to_file("res://survivors_game.tscn") # Replace with function body.
