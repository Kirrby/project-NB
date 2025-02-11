extends Control
@export var config : Config

@onready var music_v: HSlider = $VBoxContainer/HBoxContainer/Music_v
@onready var sound_v: HSlider = $VBoxContainer/HBoxContainer2/Sound_v
@onready var win_mod: CheckButton = $VBoxContainer/HBoxContainer3/Win_mod

enum win_md { win, mini, max, full, sefu }

func _ready():
	config = load("res://Dialogue/config.tres")
	
	music_v.value = config.music_volume
	SoundManager.set_volume(2, music_v.value)
	sound_v.value = config.sound_volume
	win_mod.button_pressed = bool(config.window_mode)

	visibility_changed.connect(func ():
		get_tree().paused = visible
	)

	music_v.value_changed.connect(func (v: float):
		SoundManager.set_volume(2, v)
	)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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


#func _on_confirm_pressed() -> void:
	#config.music_volume  = music_v.value
	#config.sound_volume = sound_v.value
	#config.window_mode = int(win_mod.button_pressed)
	#pass # Replace with function body.

func _on_confirm_pressed() -> void:
	config.music_volume = music_v.value
	config.sound_volume = sound_v.value
	config.window_mode = int(win_mod.button_pressed)
	
	# 保存配置资源
	ResourceSaver.save(config, "res://Dialogue/config.tres")
	
	hide()
