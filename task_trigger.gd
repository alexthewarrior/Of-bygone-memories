extends Area3D

@onready var ui = get_tree().current_scene.get_node("Player/UI")
@export var task: String = " "

var triggered := false

func _on_body_entered(body: Node3D) -> void:
	if triggered:
		return
	if body is Player:
		ui.set_task(null, task)
		triggered = true
