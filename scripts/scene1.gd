extends Node2D
class_name 地图场景

@export var bgm : AudioStream
@onready var settings: Control = $SettingLayer/Settings

var limit_top = 0
var limit_bottom = 648
var limit_left = 0
var limit_right = 3232


func _ready() -> void:
	if bgm:
		SoundManager.play_bgm(bgm)
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		settings.show_settings()
		pass
