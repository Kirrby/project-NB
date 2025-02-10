extends Control

@export_group("UI")
@export var character_name_text : Label
@export var text_box : Label

@export_group("对话")
@export var main_dialogue : DialogueGroup

var dialogue_index := 0

func display_next_dialogue():
	if dialogue_index >= len(main_dialogue.dialogue_list):
		visible = false
		return

	var dialogue := main_dialogue.dialogue_list[dialogue_index]
	
	character_name_text.text = dialogue.character_name
	text_box.text = dialogue.content
	
	dialogue_index += 1
	pass


func _ready() -> void:
	display_next_dialogue()
