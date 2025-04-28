extends Node3D

func _on_terrain_3d_ready() -> void:
	var cam = $SubViewportContainer/SubViewport/Camera3D
	var terrain = $Terrain3D
	
	terrain.set_camera(cam)


func _on_quit_pressed() -> void:
	pass # Replace with function body.
