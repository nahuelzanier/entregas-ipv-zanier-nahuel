extends Node

func rectangle(x_size, y_size, tag):
	var array = []
	for y in y_size:
		var arr_row = []
		for x in x_size:
			arr_row.append(tag)
		array.append(arr_row)
	return array

func room(array):
	for y in array.size():
		for x in array[0].size():
			if y==0 || y==array.size()-1:
				array[y][x] = 'wlx'
			if x==0 || x==array[y].size()-1:
				array[y][x] = 'wly'
	array[0][0] = 'col'
	array[0][array[0].size()-1] = 'col'
	array[array.size()-1][0] = 'col'
	array[array.size()-1][array[0].size()-1] = 'col'
	return array

func line_x(array_string, size, tags):
	randomize()
	for i in range(size):
		array_string[(array_string.size()/2)-i] = tags[randi()%tags.size()]
		array_string[(array_string.size()/2)+i] = tags[randi()%tags.size()]

func island(size, x_size, y_size, tags, water):
	var array = rectangle(x_size, y_size, water)
	for i in range(size):
		line_x( array[(array.size()/2)-i], size-i, tags )
		line_x( array[(array.size()/2)+i], size-i, tags )
	return array
