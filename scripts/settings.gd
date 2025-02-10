extends Control
@onready var h_slider: HSlider = $VBoxContainer/HBoxContainer/HSlider

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	visibility_changed.connect(func ():
		get_tree().paused = visible
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
	h_slider.grab_focus()
