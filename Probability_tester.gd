extends Node2D

onready var die = $Die

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		test_die()
	

func test_die():
	var i = 0
	var results = [0,0,0,0,0,0]
	
	while i < 100000:
		die.roll()
		
		results[die.value - 1] = results[die.value -1] + 1
		i += 1
	
	print(results)
