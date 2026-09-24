extends Node2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var baseColor : Color = Color(1.0, 1.0, 1.0, 1.0)

func play_walk():
	%AlienAnimation.walk()

func _process(delta: float) -> void:
	var len = audio_stream_player_2d.stream.get_length()
	if (!audio_stream_player_2d.playing && randf() > 0.99):
		audio_stream_player_2d.play(randf()*len)
	else: if (audio_stream_player_2d.get_playback_position() > 2.0):
		audio_stream_player_2d.stop()
		
	

func play_hurt():
	modulate = Color(0.651, 0.0, 0.0, 1.0)
	await get_tree().create_timer(0.4).timeout
	modulate = baseColor
