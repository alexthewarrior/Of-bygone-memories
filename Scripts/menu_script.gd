extends Control

@onready var main: Control = $Main
@onready var settings: Control = $Settings
@onready var display: Control = $Display
@onready var controls: Control = $Controls
@onready var sound: Control = $Sound


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()

func toggle():
	visible = !visible
	get_tree().paused = visible

func _on_settings_pressed() -> void:
	show_and_hide(settings, main)

func show_and_hide(first: Control, second: Control) -> void:
	first.show()
	second.hide()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_begin_pressed() -> void:
	toggle()
	get_tree().change_scene_to_file("res://Levels/TransitionLevels/Trans1.tscn")


func _on_sound_pressed() -> void:
	show_and_hide(sound, settings)


func _on_dipsplay_pressed() -> void:
	show_and_hide(display, settings)


func _on_controls_pressed() -> void:
	show_and_hide(controls, settings)


func _on_back_to_settings_pressed() -> void:
	show_and_hide(main, settings)




func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_vsync_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)


func _on_resolution_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))
		3:
			DisplayServer.window_set_size(Vector2i(1152,648))


func _on_master_vol_value_changed(value: float) -> void:
	set_volume(0, value)


func _on_music_vol_value_changed(value: float) -> void:
	set_volume(1, value)


func _on_sfx_vol_value_changed(value: float) -> void:
	set_volume(2, value)
	
func set_volume(idx, value):
	AudioServer.set_bus_volume_db(idx, linear_to_db(value))
