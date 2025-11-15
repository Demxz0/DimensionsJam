extends Node2D 

@onready var option_button = $"../Node2D5/CheckBox3"
@onready var report_button = $"../Node2D5/Button"

func _ready():

	report_button.pressed.connect(_on_report_button_pressed)

func _on_report_button_pressed():
	var selected_index = option_button.get_selected_id()
	
	if selected_index == -1:
		print("Please select a character first!")
		return
	
	var selected_character = option_button.get_item_text(selected_index)

	match selected_character:
		"Amina":
			get_tree().change_scene_to_file("res://dema/scenes/lose_end.tscn")
		"Ayman":
			get_tree().change_scene_to_file("res://dema/scenes/lose_end.tscn")
		"Chabler":
			get_tree().change_scene_to_file("res://dema/scenes/win_end.tscn")
		_:
			print("No scene found for this selection!")
