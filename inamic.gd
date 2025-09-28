extends CharacterBody2D


@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0
var velo = Vector2()

@onready var area = $Area2D
var dirnumber = 0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity()
		
	dirnumber += 1
	if dirnumber > 30:
		dirnumber = 0
		velocity.x *= -1
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.name == "Player":
			body.hp -= 20
			if body.hp <= 0:
				get_tree().reload_current_scene()


func _on_ready() -> void:
	velocity.x = -1 * SPEED
