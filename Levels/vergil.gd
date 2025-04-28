extends Interactable

@onready var motivation: AudioStreamPlayer3D = $motivation


func _on_interacted(_body: Variant) -> void:
	motivation.play()
