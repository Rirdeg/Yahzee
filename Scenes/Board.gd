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
		$Scoreboard.update_scoreboard(results)



func _on_Die1_finished_rolling():
	results[0] = die1.value


func _on_Die2_finished_rolling():
	results[1] = die2.value


func _on_Die3_finished_rolling():
	results[2] = die3.value


func _on_Die4_finished_rolling():
	results[3] = die4.value


func _on_Die5_finished_rolling():
	results[4] = die5.value
