extends CharacterBody2D


var SPEED = 300.0
const JUMP_VELOCITY = -400.0
var is_sprint_pressed = false
var is_interact = false
var interacter

@onready var scene = $".."
@onready var camera_2d: Camera2D = $Camera2D
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	camera_2d.limit_top = scene.limit_top
	camera_2d.limit_bottom = scene.limit_bottom
	camera_2d.limit_left = scene.limit_left
	camera_2d.limit_right = scene.limit_right

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_sprint_pressed:
		SPEED = 600
	else:
		SPEED = 300.0
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite_2d.flip_h = direction > 0
		animated_sprite_2d.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.stop()

	move_and_slide()



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("sprint"):
		is_sprint_pressed = true
	elif event.is_action_released("sprint"):
		is_sprint_pressed = false

	if event.is_action_pressed("Interactive") and is_interact:
		interacter.interactive_event()


func _on_area_entered(area: Area2D) -> void:
	$Magnifiers.show()
	is_interact = true
	interacter = area
	pass # Replace with function body.


func _on_area_exited(_area: Area2D) -> void:
	$Magnifiers.hide()
	is_interact = false
	interacter = null
	pass # Replace with function body.
