extends Control

func _on_sound_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Menus/SoundSettings.tscn")

func _on_display_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Menus/DisplaySettings.tscn")


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Menus/ControlsSettings.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Menus/MainMenu.tscn")
