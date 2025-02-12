extends Control

@onready var settings: Control = $CanvasLayer/Settings


func _on_settings_pressed() -> void:
	settings.show_settings()
	pass # Replace with function body.


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/fir_scene.tscn")
	pass # Replace with function body.


func _on_continue_pressed() -> void:
	pass # Replace with function body.


func _on_production_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
