extends Node2D

var elapsed_time = 0
var timer_running = true

func _process(delta):
	if timer_running:
		elapsed_time += delta
		update_scoreboard()

func update_scoreboard():
	# Update the scoreboard screen with the elapsed time
	# For example, if you have a label named "time_label":
	$ScoreboardScreen.time_label.text = format_time(elapsed_time)

func format_time(seconds):
	# Convert the elapsed time in seconds to a formatted string
	var minutes = int(seconds / 60)
	var seconds_remainder = int(seconds % 60)
	return String("%02d:%02d").format(minutes, seconds_remainder)
