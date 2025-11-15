extends Control
@onready var sfx: AudioStreamPlayer2D = $sfx

func _on_start_pressed() -> void:
	sfx.play()
	await get_tree().create_timer(sfx.stream.get_length()).timeout
	get_tree().change_scene_to_file("res://dema/scenes/begain.tscn")

func _on_quit_pressed() -> void:
	sfx.play()
	await get_tree().create_timer(sfx.stream.get_length()).timeout
	get_tree().quit()
