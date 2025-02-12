extends Area2D

@onready var dialog: Control = $"../DialogLayer/Dialog"
@onready var dialogue_group = load("res://Dialogue/scene1_1.tres")

func interactive_event():
	dialog.start_dialogue(dialogue_group)
	#get_tree().change_scene_to_file("res://scenes/loby.tscn")
