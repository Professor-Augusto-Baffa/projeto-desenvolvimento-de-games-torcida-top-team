extends Control

#nao quer referenciar de nenhum jeito
#@onready var CityLake = $"../../../" # referencia 3 classes acima
signal resume
signal restart
signal quit

func _on_resume_down():
	resume.emit()
	#CityLake._pause_menu()


func _on_restart_down():
	get_tree().reload_current_scene()
	resume.emit()
	 # Replace with function body.


func _on_quit_down():
	quit.emit()
	#get_tree().quit()
