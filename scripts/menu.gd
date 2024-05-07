extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/choose_team.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

