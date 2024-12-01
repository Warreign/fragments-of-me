extends Interactable

func _on_interact():
	Hud.show_dialog_panel("This might help me remember what is going on here...")
	
func get_action_text() -> String:
	return "Press 'Space' to look into the diary"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
