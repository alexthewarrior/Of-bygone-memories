extends Area3D

@export_file("*.tscn") var to_scene : String

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		# call deferred because of the changes introduced in Godot 4.2
		get_tree().change_scene_to_file(to_scene)
