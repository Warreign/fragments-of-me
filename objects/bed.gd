extends StaticInteractable

func _on_interact():
	print("Interacted with " + name)

func get_action_text():
	return "Press Space to Sleep"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass