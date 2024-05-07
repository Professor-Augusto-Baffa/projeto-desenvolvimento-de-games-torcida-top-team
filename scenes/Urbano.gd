extends Node2D

#@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var pause_menu = $Player2/Camera2D/pause
var paused = false


func _process(_delta):
	if Input.is_action_just_pressed("ui_pause"):
		_pause_menu()

func _pause_menu():
	if paused: 
		print(!paused)
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
	print(paused)
	
func _quit():
	get_tree().quit()
