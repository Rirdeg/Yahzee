extends Node2D

onready var die = $Die
var test_amount = 100000

func _input(event):
	if event.is_action_pressed("ui_accept"):
		test_die()

func test_die():
	var i = 0
	var results = [0,0,0,0,0,0]
	
	while i < test_amount:
		die.roll()
		
		results[die.value - 1] = results[die.value -1] + 1
		i += 1
	
	print(results)
