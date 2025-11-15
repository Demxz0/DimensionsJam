extends Node2D

signal dialogue_action_requested(action_key: String)

@onready var dialogue_box_parent = $Dialog
@onready var name_label = $Dialog/Name
@onready var dialogue_text_node = $Dialog/Script
@onready var continue_button = $Dialog/ContinueButton

@export var dialogue_json_path: String = "res://dema/copy_for_reuse/fragments_dialogue.json"

var dialogue_data: Array = []
var current_line_index: int = 0

func get_dialogue_index():
	return current_line_index

func _ready():
	_load_and_setup_dialogue()
	
	continue_button.hide()

func load_dialogue_from_json(path: String) -> Array:
	if not FileAccess.file_exists(path):
		print_debug("Failed to load JSON: File not found at ", path)
		return []

	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()

	var json = JSON.new()
	var error = json.parse(content)

	if error != OK:
		print_debug("Failed to parse JSON: ", json.get_error_message(), " at line ", json.get_error_line())
		return []

	if not json.data is Array:
		print_debug("Failed to parse JSON: Root data is not an Array.")
		return []

	return json.data

func _load_and_setup_dialogue():
	dialogue_data = load_dialogue_from_json(dialogue_json_path)
	
	if dialogue_data.is_empty():
		print_debug("FAILED TO LOAD DIALOGUE. dialogue_data is empty.")
		dialogue_box_parent.hide()
		return

	current_line_index = 0
		
	name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	dialogue_box_parent.show()
	display_line()
		
func advance_dialogue():
	continue_button.hide()

	if dialogue_text_node.visible_characters < dialogue_text_node.text.length():
		dialogue_text_node.visible_characters = dialogue_text_node.text.length()
		continue_button.show()
		return

	current_line_index += 1
	display_line()

func display_line():
	while current_line_index < dialogue_data.size():
		var line = dialogue_data[current_line_index]
		
		if line.has("speaker") and line.has("text"):
			
			if line.has("action"):
				dialogue_action_requested.emit(line.action)
			
			name_label.text = line.speaker
			
			dialogue_text_node.text = line.text
			dialogue_text_node.visible_characters = 0
			
			dialogue_text_node.set_dialog(line.text)
			
			continue_button.show()
			return
		
		else:
			current_line_index += 1
			continue
	
	# This is the only line that runs at the end now:
	dialogue_box_parent.hide()
