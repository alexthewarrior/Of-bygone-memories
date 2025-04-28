extends Control

func _ready() -> void:
	$Menu/MarginContainer/VBoxContainer/VBoxContainer/Master.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$Menu/MarginContainer/VBoxContainer/VBoxContainer/Music.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$Menu/MarginContainer/VBoxContainer/VBoxContainer/SFX.value = db_to_linear(AudioServer.get_bus_volume_db(2))

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/MainMenu/Settings.tscn")


func _on_apply_changes_pressed() -> void:
	pass # Replace with function body.
	AudioServer.set_bus_volume_db(0, linear_to_db($Menu/MarginContainer/VBoxContainer/VBoxContainer/Master.value))
	AudioServer.set_bus_volume_db(1, linear_to_db($Menu/MarginContainer/VBoxContainer/VBoxContainer/Music.value))
	AudioServer.set_bus_volume_db(2, linear_to_db($Menu/MarginContainer/VBoxContainer/VBoxContainer/SFX.value))

func _on_master_mouse_exited() -> void:
	pass # Replace with function body.


func _on_music_mouse_exited() -> void:
	pass # Replace with function body.


func _on_sfx_mouse_exited() -> void:
	pass # Replace with function body.
