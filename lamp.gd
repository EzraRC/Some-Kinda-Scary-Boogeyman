extends Node2D

# Reference to the laptop's progress bar
var laptopProgressBar : TextureProgressBar

# Reference to the point light
var pointLight : PointLight2D

func _ready():
	# Load the laptop scene
	var laptopInstance = preload("res://laptop.tscn").instantiate()

	# Add the laptop scene as a child of this scene
	add_child(laptopInstance)

	# Get reference to the laptop's progress bar
	laptopProgressBar = laptopInstance.get_node("TextureProgressBar")

	# Get reference to the point light
	pointLight = get_node("PointLight2D")

	# Synchronize initial energy level
	synchronize_energy_level()

func _process(_delta):
	# Synchronize energy level every frame
	synchronize_energy_level()
	
# Synchronize the energy level of the point light with the progress bar value
func synchronize_energy_level():
	# Ensure the progress bar and point light exist
	if laptopProgressBar != null and pointLight != null:

		# Set the energy level of the point light based on the percentage
		pointLight.energy = laptopProgressBar.value / 1500
