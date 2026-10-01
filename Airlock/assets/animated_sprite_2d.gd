extends AnimatedSprite2D

@export var textLabel = RichTextLabel

func _ready():
	stop()
	frame = 0
		
func increase_frame():
	if (frame < 6):
		frame += 1
	else:
		get_tree().change_scene_to_file("res://tutorial_screen.tscn")


"position"
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_pressed("shoot")):
		increase_frame()
		change_text()

func change_text():
	if(frame == 1):
		textLabel.text = "
Isaac hailed from a beautiful island about 2000 miles off the coast of Asia. An island known for its otherworldly nature, technological innovation, and diverse culture. 
Viridia
Viridians are the architects of space travel. They figured out a way to convert the endless radiation from supernovas into fuel, providing humanity with the means to travel the stars. Isaac was their main researcher and astronaut. He was the one who made this discovery
"
	elif (frame == 2):
		textLabel.text = "However… despite Viridias technical prowess, there was a problem, close to home, that just kept evolving..
	Storms.
		Even though they could harness energy from the stars, they could never control the clouds above. No matter how much research and time they spent, nature's wrath was always smarter. And 3 months ago, Viridia faced their worst one yet...
"
	elif (frame == 3):
		textLabel.text  = "One random, fateful day, a collection of dark clouds materialized above the capitol city. Within a few hours, cataclysmic winds started to rip through the island. This was a catastrophe of otherworldly proportions. The protections Viridia created for storms were completely destroyed. There was nothing they could've done. The civilization who brought so much to this world, was in their final hour"	
	elif (frame == 4):
		textLabel.text  = "As it turns out, this very storm was something Isaac was specifically afraid of. Viridia has been monitoring other planet systems for years now, and this exact storm was something they’ve seen a few times before. The storm has afflicted 4 separate systems now, and in 3 of them, all life signatures were totally wiped off the map. However, the 4th one, Expeditition IV was able to repel the storm… Isaac immediately knew the world's only hope was to journey out to Expeditition himself, and find out how." 
	elif (frame == 5):
		textLabel.text  = "Isaac sent out a warning to the rest of the world, telling them to prepare as best they can, and then took off that same day.

And after 3 grueling months of space travel, Isaac successfully made it to Expeditition. He didn’t know what to expect, but absolutely came prepared for the worst. He knew this journey would not be easy, but he was ready.

Once he reached the system, he sent out a diplomatic signal. He came here to learn from the Expedititioners, not harm them. 
"
	elif (frame == 6):

		textLabel.text = "However, the Expidititioners had other plans...."
		





func _on_skip_pressed() -> void:
	get_tree().change_scene_to_file("res://tutorial_screen.tscn") # Replace with function body.
