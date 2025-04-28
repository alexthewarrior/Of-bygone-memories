extends Node

@onready var static_sound: AudioStreamPlayer = $static_sound

func play_static():
	static_sound.play()
