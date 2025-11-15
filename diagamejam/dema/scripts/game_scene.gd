extends Node2D


func _on_passport_pressed() -> void:
	$passport_scene.visible = true


func _on_dog_pressed() -> void:
	$dog_scene.visible = true


func _on_talk_pressed() -> void:
	$Logic.visible = true
	$close_button.visible = true

func _on_id_pressed() -> void:
	$id_scene.visible = true


func _on_close_pressed() -> void:
	$Logic.visible = false
	$close_button.visible = false

func _on_next1_pressed() -> void:
	get_tree().change_scene_to_file("res://dema/scenes/character2_scene.tscn")
