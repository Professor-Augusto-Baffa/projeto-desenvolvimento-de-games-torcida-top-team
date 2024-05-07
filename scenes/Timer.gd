extends Timer

var cerveja = preload("res://scenes/cerveja.tscn")
#var vida = preload("res://scenes/vida.tscn")

func _on_timeout():
	randomize()
	
	#adicionar nome demais itens no vetor "itens"
	var itens = [cerveja]
	
	var itenTipo = itens[randi()%itens.size()]
	var itenObj = itenTipo.instantiate()
	
	#arrumar coordenadas abaixo
	itenObj.position = Vector2(randf_range(450.0,1150.0), randf_range(750.0, 1300.0))
	add_child(itenObj)
	wait_time = randf_range(130,150)
