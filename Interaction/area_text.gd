extends Node3D

@export var message_text: String = "You feel uneasy..."
@export var display_time: float = 3.0
@export var player_node_name: String = "Player"  # Can be customized if needed

@onready var area = $Area3D
@onready var label = $CanvasLayer/Label

func _ready():
	area.body_entered.connect(_on_body_entered)
	label.visible = false
	label.text = ""  # Start empty

func _on_body_entered(body):
	if body.name == player_node_name:
		show_message()

func show_message():
	label.text = message_text
	label.visible = true
	await get_tree().create_timer(display_time).timeout
	label.visible = false
	label.text = ""  # Reset after hiding
