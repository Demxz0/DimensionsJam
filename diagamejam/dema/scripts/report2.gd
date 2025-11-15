extends Button

@export var option_button: OptionButton  # Drag and drop in Inspector!

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	if option_button == null:
		print("Please assign option_button in Inspector!")
		return
	
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
		"Charbel":
			get_tree().change_scene_to_file("res://dema/scenes/win_end.tscn")
		_:
			print("No scene found for this selection!")
