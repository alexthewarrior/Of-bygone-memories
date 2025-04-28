extends Control

@onready var bg: ColorRect = $BG
@onready var anim: AnimationPlayer = $Anim

func change_scene(target: String) -> void:
	anim.play("fade in")
	await anim.animation_finished
	get_tree().change_scene_to_file(target)
	anim.play("fade out")
