extends Area3D

@export_file("*.tscn") var to_scene : String

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		get_tree().change_scene_to_file(to_scene)
