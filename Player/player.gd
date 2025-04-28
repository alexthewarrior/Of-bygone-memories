extends CharacterBody3D
class_name Player


@export_subgroup("Movement")
@export var speed : float
@export var normal_speed = 5.0
@export var sprint_speed = 7.0
@export var accel = 16.0
@export var jump = 8.0

@export_subgroup("Crouching")
@export var crouch_speed = 1.5
@export var crouch_height = 2.4
@export var crouch_transition = 8.0
@export var crouching_depth = -0.8
@export var crouch_transition_speed = 10.0

@export_subgroup("Camera")
@export var sensitivity = 0.2
@export var min_angle = -80
@export var max_angle = 90
@export var BOB_FREQ = 1.3
@export var BOB_AMP = 0.1
@export var t_bob = 0.0


@onready var head = $Head
@onready var standing_collision_shape: CollisionShape3D = $Standing_Collision_Shape
@onready var crouching_collision_shape: CollisionShape3D = $Crouching_Collision_Shape
@onready var top_cast = $TopCast
@onready var touching_ground: RayCast3D = $TouchingGround
@onready var ui = $UI
@onready var camera: Camera3D = $Head/Camera3D
@onready var walking_sound: AudioStreamPlayer = $Sounds/walking_sound
@onready var flashlight_sound: AudioStreamPlayer = $Sounds/flashlight_sound


@onready var flashlight: SpotLight3D = $Head/Camera3D/Node3D/Flashlight
var flashlight_on:bool = true

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var look_rot : Vector2
var stand_height : float
var old_vel : float = 0.0
var hurt_tween : Tween
var moving : bool = true


func _ready():
	look_rot.y = rotation_degrees.y
	stand_height = standing_collision_shape.shape.height
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta):
	# movement
	var move_speed = normal_speed
	
	if Input.is_action_pressed("shift"):
		speed = sprint_speed
		t_bob += delta * velocity.length() * float(is_on_floor())
		camera.transform.origin = _headbob(t_bob)
	else:
		speed = normal_speed

	
	if not is_on_floor():
		velocity.y -= gravity * delta
	elif moving:
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump
		elif Input.is_action_pressed("crouch") or top_cast.is_colliding():
			move_speed = crouch_speed
			crouch(delta)
		else:
			crouch(delta, true)

	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction and moving:
		velocity.x = lerp(velocity.x, direction.x * move_speed, accel * delta)
		velocity.z = lerp(velocity.z, direction.z * move_speed, accel * delta)
		
	
		
	else:
		velocity.x = lerp(velocity.x, 0.0, accel * delta)
		velocity.z = lerp(velocity.z, 0.0, accel * delta)
		

	move_and_slide()
	
	# rotation
	var plat_rot = get_platform_angular_velocity()
	look_rot.y += rad_to_deg(plat_rot.y * delta)
	head.rotation_degrees.x = look_rot.x
	rotation_degrees.y = look_rot.y
	

func crouch(delta : float, _reverse = false):
	if Input.is_action_pressed("crouch"):
		
		speed = crouch_speed
		head.position.y = lerp(head.position.y, 1.8 + crouching_depth, delta * crouch_transition_speed)
		standing_collision_shape.disabled = true
		crouching_collision_shape.disabled = false
		
	elif !top_cast.is_colliding():
		
		standing_collision_shape.disabled = false
		crouching_collision_shape.disabled = true
		head.position.y = lerp(head.position.y, 1.8, delta * crouch_transition_speed)


func _input(event):
	if event is InputEventMouseMotion and moving:
		look_rot.y -= (event.relative.x * sensitivity)
		look_rot.x -= (event.relative.y * sensitivity)
		look_rot.x = clamp(look_rot.x, min_angle, max_angle)
		
	if event.is_action_pressed("flashlight"):
		flashlight_on = !flashlight_on
		flashlight.visible = flashlight_on
		flashlight_sound.play()
		

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos
	
