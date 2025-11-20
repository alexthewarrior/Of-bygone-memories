extends  Control
@onready var pause_menu: Control = $"CanvasLayer/Pause Menu"
@onready var dialogue: Label = $Dialogue

func _ready() -> void:
	pause_menu.visible = false
	set_task(null, "Follow the path to reach the village")
	set_dia(null, " ")
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_menu.visible = !pause_menu.visible
		get_tree().paused = pause_menu.visible
		if get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if !get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			

func set_task(body, task_text: String):
	if body == null || body != null and body.name == "player":
		$CanvasLayer/TaskUI/task_text.text = task_text

func set_dia(body, dia_text: String):
	if body == null || body != null and body.name == "Player":
		dialogue.text = dia_text
		await get_tree().create_timer(5.0, false).timeout
		dialogue.text = " "



func _on_resume_pressed() -> void:
	get_tree().paused = false
	pause_menu.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/Menus/MainMenu.tscn")
	
