extends RichTextLabel

const char_speed : float = 0.035

@onready var continue_button = $"../ContinueButton" 

func set_dialog(string : String):
	continue_button.hide()
	
	visible_characters = 0
	text = string
	
	for i in range(string.length()):
		visible_characters += 1
		await get_tree().create_timer(char_speed).timeout
	
	continue_button.show()
