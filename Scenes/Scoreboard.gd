extends ColorRect

#text labels
onready var ones = $HBoxContainer/P1/AcesP1
onready var twos = $HBoxContainer/P1/Twosp1
onready var threes = $HBoxContainer/P1/ThreesP1
onready var fours = $HBoxContainer/P1/FoursP1
onready var fives = $HBoxContainer/P1/FivesP1
onready var sixes = $HBoxContainer/P1/SixesP1
onready var three_of_a_kind = $HBoxContainer/P1/ThreeOfAKindP1
onready var four_of_a_kind = $HBoxContainer/P1/FourOfAKindP1

func update_scoreboard(results):
	#We'll sort the results to make it easier to calculate some of the scores 
	results.sort()
	#Update all of the scoresheet
	update_scorecard_digits(1, results, ones)
	update_scorecard_digits(2, results, twos)
	update_scorecard_digits(3, results, threes)
	update_scorecard_digits(4, results, fours)
	update_scorecard_digits(5, results, fives)
	update_scorecard_digits(6, results, sixes)
	update_chance(results)
	update_of_a_kind(3, results, three_of_a_kind)
	update_of_a_kind(4, results, four_of_a_kind)
	update_full_house(results)


#We can optimize by breaking out of the loop if we go above our value,
#because the array has been sorted.

func update_scorecard_digits(value, results, label):
	var score = 0
	for i in results:
		if i == value:
			score = score + i
	label.text = str(score)


func update_chance(results):
	var score = 0 
	for i in results:
		score = score + i 
	$HBoxContainer/P1/ChanceP1.text = str(score)


func update_of_a_kind(kind_amount, results, label):
	var count = [0,0,0,0,0,0]
	var score = 0
	var valid = false
	
	for i in results:
		if i == 1:
			count[0] = count[0] + 1
			score = score + 1
		elif i == 2:
			count[1] = count[1] + 1
			score = score + 2
		elif i == 3: 
			count[2] = count[2] + 1
			score = score + 3
		elif i == 4:
			count[3] = count[3] + 1
			score = score + 4
		elif i == 5:
			count[4] = count[4] + 1
			score = score + 5
		else:
			count[5] = count[5] + 1
			score = score + 6
	
	for i in count:
		if i >= kind_amount:
			valid = true
	
	if valid:
		label.text = str(score)
	else:
		label.text = str(0)

func update_full_house(results):
	var valid = false
	var counts = [0,0,0,0,0,0]
	
	for i in results:
		counts[i - 1] = counts[i-1] + 1
	
	counts.sort() #0,0,0,2,3
	if counts.back() == 3:
		counts.pop_back()
		if counts.back() == 2:
			valid = true
	else:
		valid = false
	
	if valid:
		$HBoxContainer/P1/FullHouseP1.text = str(25)
