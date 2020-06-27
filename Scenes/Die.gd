extends AnimatedSprite

var value = 0
var current_frame = 0
var sides = 6 
var held = false

signal finished_rolling

func _ready():
	randomize()
	current_frame = randi() % sides


func _process(delta):
	pass


func start_rolling():
	if $Timer.is_stopped():
		$Timer.start()
		$FrameSwitchTimer.start()


func roll():
	frame = randi() % sides
	value = int(frame) + 1
	emit_signal("finished_rolling")


func _on_FrameSwitchTimer_timeout():
	frame = randi() % sides


func _on_Timer_timeout():
	$FrameSwitchTimer.stop()
	roll()


func hold_die():
	held = !held
	if held:
		modulate = "aaaaaa"
	else:
		modulate = "ffffff"


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_pressed():
		hold_die()
