extends Control

@onready var start_button = $StartButton  # assuming your button node is named "StartButton"
@onready var quit_button = $QuitButton  # assuming your button node is named "QuitButton"

func _ready():
	# Ensure these nodes exist and are ready for connection
	if start_button and quit_button:
		start_button.connect("pressed", _on_start_button_pressed)
		quit_button.connect("pressed", _on_quit_button_pressed)
	else:
		print("Error: Buttons not found!")

func _on_start_button_pressed():
	print("Start button pressed!")
	# You can load a new scene here, for example:
	get_tree().change_scene("res://Bedroom.tscn")  # Example: Load "Bedroom.tscn"

func _on_quit_button_pressed():
	print("Quit button pressed!")
	get_tree().quit()  # This will exit the game
