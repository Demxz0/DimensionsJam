extends Node2D 

var option_button
var report_button

func _ready():
	print("=== READY FUNCTION STARTED ===")
	
	# Get nodes directly in _ready() instead of using @onready
	option_button = get_node("../Node2D5/choice")
	report_button = get_node("../Node2D5/report")
	
	print("option_button: ", option_button)
	print("report_button: ", report_button)
	
	if report_button == null:
		push_error("report_button is null!")
		return
	
	if option_button == null:
		push_error("option_button is null!")
		return
	
	print("About to connect signal...")
	report_button.pressed.connect(_on_report_button_pressed)
	print("Signal connected successfully!")

func _on_report_button_pressed():
	print("=== BUTTON PRESSED! ===")
	
	var selected_index = option_button.get_selected_id()
	print("Selected index: ", selected_index)
	
	if selected_index == -1:
		print("Please select a character first!")
		return
	
	var selected_character = option_button.get_item_text(selected_index)
	print("Selected character: ", selected_character)
	
	match selected_character:
		"Amina":
			print("Changing to lose_end scene...")
			get_tree().change_scene_to_file("res://dema/scenes/lose_end.tscn")
		"Ayman":
			print("Changing to lose_end scene...")
			get_tree().change_scene_to_file("res://dema/scenes/lose_end.tscn")
		"Charbel":
			print("Changing to win_end scene...")
			get_tree().change_scene_to_file("res://dema/scenes/win_end.tscn")
		_:
			print("No scene found for this selection!")
