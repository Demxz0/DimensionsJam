extends Node2D


func _on_backtomainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://main menu/main_menu.tscn")
