extends Node2D
class_name 地图场景

@onready var settings: Control = $CanvasLayer/Settings
var limit_top = 0
var limit_bottom = 648
var limit_left = 0
var limit_right = 2464

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		settings.show_settings()
		pass
