extends Area2D

var interactKey = "interact"
var broken = false
var canInteract = false
var breakTimer = 0
var timerRunning = false

func _ready():
	var time_to_break = randf_range(10, 20) # Random time between 10 and 20 seconds
	$Timer.wait_time = time_to_break
	$Timer.start()
	timerRunning = true

func _process(delta):
	# Check for player interaction
	if canInteract and Input.is_action_pressed(interactKey):
		interact()
		
	# Check if the window is broken
	print(breakTimer)
	if broken:
		breakTimer += delta
		if breakTimer >= 10:
			get_tree().change_scene_to_file("res://GameOverScreen.tscn")
		# Perform actions for a broken window
		# For example, change the sprite or play a sound
		
	# Check if it's time to break the window again
	if !timerRunning:
		var time_to_break = randf_range(10, 50) # Random time between 10 and 20 seconds
		$Timer.wait_time = time_to_break
		$Timer.start()
		timerRunning = true

func interact():
	broken = false
	breakTimer = 0
	print("Window is now fixed")
	$AnimatedSprite2D.play("fixed-window")
	$fixing.play()

func _on_Timer_timeout():
	broken = true
	print("Window is now broken")
	timerRunning = false
	$AnimatedSprite2D.play("broken-window")
	$broken.play()

func _on_body_entered(body):
	canInteract = true
	print(body)

func _on_body_exited(body):
	canInteract = false
