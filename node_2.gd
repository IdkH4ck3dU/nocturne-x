extends Node

@onready var key: Sprite2D = $Sprite2D5
@onready var portal: Sprite2D = $Sprite2D6
@onready var button: Button = $Button
@onready var button2: Button = $Button2
@onready var player: CharacterBody2D = %Player
@onready var camera: Camera2D = $Camera2D  # Only if you’re using one


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	portal.visible = !portal.visible
	button.pressed.connect(_on_key_pressed)
	button2.pressed.connect(_on_portal_pressed)

#button.pressed.connect(_on_button_pressed)

func _on_key_pressed() -> void:
	key.queue_free()
	portal.visible = true
	button.disabled = true # optional:
	print("Hello world!!!")

func _on_portal_pressed() -> void:
	player.position = Vector2(12400, 900)
	button2.disabled = true

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
