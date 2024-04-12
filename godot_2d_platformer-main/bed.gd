extends Area2D

# Variables
var progressBar : TextureProgressBar
var decreaseRate = 20
var interactKey = "interact"
var canInteract = false

const BAR_SPEED = 5

func _ready():
	# Get reference to the TextureProgressBar
	progressBar = get_node("TextureProgressBar") # or specify the correct path if it's nested
	if progressBar == null:
		print("Error: TextureProgressBar node not found.")
	else:
		print("TextureProgressBar node found:", progressBar)
		print(progressBar.value)

func _process(delta):
	# Decrease the progress bar over time
	progressBar.value -= decreaseRate * BAR_SPEED * delta
	progressBar.value = clamp(progressBar.value, 0, 10000)

	# Check for player interaction
	if canInteract:
		interact()

func interact():
	# Increase the progress bar by a set amount
	progressBar.value += 10
	progressBar.value = clamp(progressBar.value, 0, 10000)

func _on_body_entered(area):
	print(area)
	canInteract = true
	interact()

func _on_body_exited(area):
	canInteract = false
