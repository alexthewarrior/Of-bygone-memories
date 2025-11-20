extends Interactable
@onready var news_flash: CanvasLayer = $NewsFlash
@onready var ui = get_tree().current_scene.get_node("Player/UI")

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	news_flash.visible = false

func _on_interacted(body: Variant) -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	news_flash.visible = true

func _on_close_pressed() -> void:
	news_flash.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	ui.set_task(null, "Return to the path and reach the village")
