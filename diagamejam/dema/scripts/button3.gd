extends Button

func _ready():
	pressed.connect(self._on_i_was_pressed)

func _on_i_was_pressed():
	owner.hide()
