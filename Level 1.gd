extends Node2D


export var cont1 = 3
export var cont2 = 3

var ratio1
var ratio2

func _ready():
	set_process_input(false)


func _input(event):
	if event.is_action_released("player1_action"):
		cont1 -= 1
		press_action_bar("1")
	if event.is_action_released("player2_action"):
		cont2 -= 1
		press_action_bar("2")


func press_action_bar(index):
	var pointer = get_node("Player " + index + "/Bar/Pointer").position.y
	var max_point = get_node("Player " + index + "/Position2D").position.y
	var distance = max_point - pointer
	get_node("Player 1/Action/AnimationPlayer").play("action")
	
	if index == "1":
		ratio1 += distance
	if index == "2":
		ratio2 += distance
		
	
	if cont1 <= 0 and cont2 <= 0:
		next_level()


func activate_action_bar():
	var anim1 = get_node("Player 1/AnimationPlayer").play("action")
	var anim2 = get_node("Player 2/AnimationPlayer").play("action")

func _on_Timer_timeout():
	set_process_input(true)
	activate_action_bar()


func next_level():
	pass