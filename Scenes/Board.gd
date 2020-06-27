extends Node2D

#Dice initialisation
onready var die1 = $Dice/Die1
onready var die2 = $Dice/Die2
onready var die3 = $Dice/Die3
onready var die4 = $Dice/Die4
onready var die5 = $Dice/Die5

var results = [0,0,0,0,0]

func _process(delta):
	if Input.is_action_just_pressed("roll1"):
		die1.start_rolling()
	if Input.is_action_just_pressed("roll2"):
		die2.start_rolling()
	if Input.is_action_just_pressed("roll3"):
		die3.start_rolling()
	if Input.is_action_just_pressed("roll4"):
		die4.start_rolling()
	if Input.is_action_just_pressed("roll5"):
		die5.start_rolling()
		
	if Input.is_action_just_pressed("ui_accept"):
		update_results()
		$Scoreboard.update_scoreboard(results)



func update_results():
	results[0] = $Dice/Die1.value
	results[1] = $Dice/Die2.value
	results[2] = $Dice/Die3.value
	results[3] = $Dice/Die4.value
	results[4] = $Dice/Die5.value
