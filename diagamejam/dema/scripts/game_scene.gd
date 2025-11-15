extends Node2D


func _on_passport_pressed() -> void:
	$Node2D.visible = true


func _on_dog_pressed() -> void:
	$Node2D3.visible = true


func _on_talk_pressed() -> void:
	$Logic.visible = true
	

func _on_id_pressed() -> void:
	$Node2D2.visible = true


func _on_close_pressed() -> void:
	$Logic.visible = false
	

func _on_next1_pressed() -> void:
	get_tree().change_scene_to_file("res://dema/scenes/Charbel2_scene.tscn")
