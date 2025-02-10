extends Node2D
var current_image_index = 1
var max_images = 10
var image_folder = "res://photo/"

var game_scene_instance = null
@onready var settings: Control = $CanvasLayer/Settings
@onready var dialog: Control = $Dialog



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#DialogueManager.show_dialogue_balloon(dialog,"test")
	game_scene_instance = get_tree().current_scene
	load_image(current_image_index)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func load_image(index):
	var image_path = image_folder + str(index) + ".png"
	var image = ResourceLoader.load(image_path)
	if image:
		$Sprite2D.texture = image
	else:
		print("Error: Image not found at path:", image_path)

func next_image():
	current_image_index += 1
	if current_image_index > max_images:
		end()
		return
	load_image(current_image_index)

func end_scene():
	pass



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		next_image()
		dialog.display_next_dialogue()

	if event.is_action_pressed("ui_cancel"):
		settings.show_settings()
		pass


func end():
	get_tree().change_scene_to_file("res://scenes/scene1.tscn")
