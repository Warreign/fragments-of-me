extends Interactable

func _on_interact() -> void:
	print("Window interaction")
	
func get_action_text() -> String:
	return "Press Space to check window"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
