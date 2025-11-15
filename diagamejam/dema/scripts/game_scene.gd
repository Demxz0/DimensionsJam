extends Node2D


func _on_passport_pressed() -> void:
	$Node2D2.visible = true


func _on_dog_pressed() -> void:
	$Node2D3.visible = true


func _on_talk_pressed() -> void:
	$Logic.visible = true
	$Button2.visible = true

func _on_id_pressed() -> void:
	$Node2D4.visible = true


func _on_close_pressed() -> void:
	$Button2.visible = false
	$Logic.visible = false


func _on_next1_pressed() -> void:
	get_tree().change_scene_to_file("res://dema/scenes/character2_scene.tscn")
