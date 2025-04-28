extends Control
@export_file("*.tscn") var to_scene : String

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file(to_scene)
