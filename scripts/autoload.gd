extends Node

@export var config : Config

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	config = load("res://Dialogue/config.tres")
	#DisplayServer.window_set_mode(config.window_mode)
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
