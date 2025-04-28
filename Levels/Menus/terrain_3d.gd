extends Terrain3D
@onready var camera_3d: Camera3D = $"../SubViewportContainer/SubViewport/Camera3D"


func _process(delta: float) -> void:
	camera_3d.current = true
