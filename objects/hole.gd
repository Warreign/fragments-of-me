extends Door

func get_action_text():
	if (is_locked):
		return ""
	else:
		return "Enter " + scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
