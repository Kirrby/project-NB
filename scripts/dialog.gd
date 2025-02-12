#extends Control
#
#@export_group("UI")
#@export var character_name_text : Label
#@export var text_box : Label
#
#@export_group("对话")
#@export var main_dialogue : DialogueGroup
#
#var dialogue_index := 0
#
#func display_next_dialogue():
	#if dialogue_index >= len(main_dialogue.dialogue_list):
		#visible = false
		#return
#
	#var dialogue := main_dialogue.dialogue_list[dialogue_index]
	#
	#character_name_text.text = dialogue.character_name
	#text_box.text = dialogue.content
	#
	#dialogue_index += 1
	#pass
#
#
#func _ready() -> void:
	#display_next_dialogue()

extends Control

signal dialogue_started
signal dialogue_ended

@export_group("UI")
@export var character_name_text: Label
@export var text_box: Label

@export_group("默认对话配置")
@export var default_dialogue: DialogueGroup  # 编辑器预设的默认对话

var current_dialogue_group: DialogueGroup   # 当前正在进行的对话
var current_dialogue_index := 0             # 当前对话索引

func _ready() -> void:
	visible = false  # 初始隐藏对话框
	# 如果配置了默认对话，自动开始（可按需注释）
	if default_dialogue:
		start_dialogue(default_dialogue)

# 外部调用接口：开始新对话
func start_dialogue(dialogue_group: DialogueGroup) -> void:
	if dialogue_group.dialogue_list.size() == 1:
		$Timer.start()
	
	if not dialogue_group or dialogue_group.dialogue_list.is_empty():
		push_error("Invalid dialogue group")
		return
	
	# 结束已有对话
	if current_dialogue_group:
		end_dialogue()
	
	current_dialogue_group = dialogue_group
	current_dialogue_index = 0
	visible = true
	emit_signal("dialogue_started")
	_display_next_line()

# 显示下一句对话（可外部调用）
func continue_dialogue() -> void:
	_display_next_line()

# 内部：显示下一句
func _display_next_line() -> void:
	if current_dialogue_index >= current_dialogue_group.dialogue_list.size():
		end_dialogue()
		return
	
	var dialogue = current_dialogue_group.dialogue_list[current_dialogue_index]
	character_name_text.text = dialogue.character_name
	text_box.text = dialogue.content
	current_dialogue_index += 1

# 结束对话
func end_dialogue() -> void:
	visible = false
	current_dialogue_group = null
	current_dialogue_index = 0
	emit_signal("dialogue_ended")

# 输入处理：按空格/回车继续对话
func _input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("ui_accept"):
		_display_next_line()


func _on_timer_timeout() -> void:
	hide()
	pass # Replace with function body.
