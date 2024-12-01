extends Control

@export_file("*.tscn") var start_scene

func start_game():
	Controller.start_game()

func quit_game():
	Controller.quit_game()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
