extends Node2D


func _ready():
	randomize()

func generate_area(size_x, size_y):
	var area = []
	for y in range(size_y):
		var row_x = []
		for x in range(size_x):
			if x == 0 || x == size_x-1 || y == 0 || y == size_y-1:
				row_x.append(1)
				
			else:
				row_x.append(randi()%5)
		area.append(row_x)
	return area
