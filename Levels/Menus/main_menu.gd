extends CanvasLayer

@onready var menu: MarginContainer = $MainMenu/Menu
@onready var settings_menu: Control = $"MainMenu/Settings Menu"
@onready var sound_settings: Control = $"MainMenu/Sound Settings"
@onready var display_settings: Control = $"MainMenu/Display Settings"





func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Segment 1/Saved data/Segment 1.tscn")


func _on_settings_pressed() -> void:
	show_and_hide(settings_menu, menu)


func _on_quit_pressed() -> void:
	get_tree().quit()

func show_and_hide(first, second):
	first.show()
	second.hide()
