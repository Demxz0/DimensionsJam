extends Node2D


func _on_movetoscene_1_pressed() -> void:
	get_tree().change_scene_to_file("res://dema/scenes/character1_scene.tscn")
