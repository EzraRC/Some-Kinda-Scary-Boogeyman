extends Area2D

var interactKey = "interact"
var broken = false
var canInteract = false
var breakTimer = 0

func _ready():
	var time_to_break = randf_range(1, 5) # Random time between 1 and 5 seconds
	$Timer.wait_time = time_to_break
	$Timer.start()

func _process(delta):
	# Check for player interaction
	if canInteract and Input.is_action_pressed(interactKey):
		interact()
		
	# Check if the window is broken
	if broken:
		breakTimer += delta
		if breakTimer >= 10:
			print("You lose! Window was broken for too long.")
			loseGame()
		# Perform actions for a broken window
		# For example, change the sprite or play a sound
		
	# Check if it's time to break the window again
	if !$Timer.is_queued():
		var time_to_break = randf_range(1, 5) # Random time between 1 and 5 seconds
		$Timer.wait_time = time_to_break
		$Timer.start()

func interact():
	broken = false
	breakTimer = 0
	print("Window is now fixed")

func _on_Timer_timeout():
	broken = true
	print("Window is now broken")

func _on_body_entered(body):
	canInteract = true

func _on_body_exited(body):
	canInteract = false

func loseGame():
	# Add actions to handle losing the game
	get_tree().change_scene("res://GameOverScreen.tscn")
