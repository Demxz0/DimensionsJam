extends Node2D 

@onready var option_button = $"../Node2D5/choice"
@onready var report_button = $"../Node2D5/report"

func _ready():
	print("=== Script is running on node: ", self.name, " ===")
	print("option_button: ", option_button)
	print("report_button: ", report_button)
	
	if report_button == null:
		push_error("report_button is NULL! Script is on wrong node or path is wrong")
		return
	
	if option_button == null:
		push_error("option_button is NULL! Script is on wrong node or path is wrong")
		return
	
	print("Connecting signal...")
	report_button.pressed.connect(_on_report_button_pressed)
	print("Signal connected!")

func _on_report_button_pressed():
	print("=== BUTTON CLICKED! ===")
	
	var selected_index = option_button.get_selected_id()
	print("Selected index: ", selected_index)
	
	if selected_index == -1:
		print("Please select a character first!")
		return
	
	var selected_character = option_button.get_item_text(selected_index)
	print("Selected character: ", selected_character)
	
	match selected_character:
		"Amina":
			print("Going to lose_end...")
			get_tree().change_scene_to_file("res://dema/scenes/lose_end.tscn")
		"Ayman":
			print("Going to lose_end...")
			get_tree().change_scene_to_file("res://dema/scenes/lose_end.tscn")
		"Charbel":
			print("Going to win_end...")
			get_tree().change_scene_to_file("res://dema/scenes/win_end.tscn")
		_:
			print("No scene found for this selection!")
