extends Control



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/TransitionLevels/Trans1.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Menus/Settings.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
