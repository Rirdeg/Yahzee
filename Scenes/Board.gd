extends Node2D

#Dice initialisation
onready var die1 = $Dice/Die1
onready var die2 = $Dice/Die2
onready var die3 = $Dice/Die3
onready var die4 = $Dice/Die4
onready var die5 = $Dice/Die5

#Values of each individual die
var results = [0,0,0,0,0]
#array of the die gameobjects 
var dice = []
var rolls_remaining = 3

func _ready():
	#populate the dice array
	dice.append(die1)
	dice.append(die2)
	dice.append(die3)
	dice.append(die4)
	dice.append(die5)
	$CanvasLayer/Label.text = str(rolls_remaining)

func _process(delta):
	#This function wont be required and should be removed as game logic is developed
	if Input.is_action_just_pressed("ui_accept"):
		update_results()
		$Scoreboard.update_scoreboard(results)


func update_results():
	#This will update the results array with each die value
	results[0] = $Dice/Die1.value
	results[1] = $Dice/Die2.value
	results[2] = $Dice/Die3.value
	results[3] = $Dice/Die4.value
	results[4] = $Dice/Die5.value


func _on_Button_pressed():
	#attached to the roll die button
	if rolls_remaining > 0:
		$CanvasLayer/Button/RollTimer.start()
		$CanvasLayer/Button.disabled = true
		for i in dice:
			if not i.held:
				i.start_rolling() 
		rolls_remaining -= 1
		$CanvasLayer/Label.text = str(rolls_remaining)


func _on_RollTimer_timeout():
	if rolls_remaining >0:
		$CanvasLayer/Button.disabled = false
