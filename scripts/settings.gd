extends Control
@export var config : Config

@onready var music_v: HSlider = $VBoxContainer/HBoxContainer/Music_v
@onready var sound_v: HSlider = $VBoxContainer/HBoxContainer2/Sound_v
@onready var win_opt: OptionButton = $VBoxContainer/HBoxContainer3/win_opt


func _ready():
	config = load("res://Dialogue/config.tres")
	#将配置文件中的数值读取到UI中
	music_v.value = config.music_volume
	SoundManager.set_volume(2, music_v.value)
	sound_v.value = config.sound_volume
	win_opt.selected = win_opt.get_item_index(config.window_mode)
	DisplayServer.window_set_mode(config.window_mode)
	#连接UI信号
	visibility_changed.connect(func ():
		get_tree().paused = visible
	)

	music_v.value_changed.connect(func (v: float):
		SoundManager.set_volume(2, v)
	)
	
	win_opt.item_selected.connect(func (index: int):
		DisplayServer.window_set_mode(win_opt.get_item_id(index))
	)


func _on_cancel_pressed() -> void:
	hide()
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		hide()
		get_window().set_input_as_handled()


func show_settings():
	show()
	music_v.grab_focus()


func _on_confirm_pressed() -> void:
	#从UI读取配置
	config.music_volume = music_v.value
	config.sound_volume = sound_v.value
	config.window_mode = win_opt.get_item_id(win_opt.selected)
	
	# 保存配置资源
	ResourceSaver.save(config, "res://Dialogue/config.tres")
	
	hide()
