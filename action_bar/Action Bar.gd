extends Node2D

var pointer
var bar_position


func _ready():
	bar_position = get_node("bar/Position2D").position.x
	set_process(true)


func hit():
	pointer = get_node("bar/pointer").position.x
	var result =  bar_position - pointer
	

