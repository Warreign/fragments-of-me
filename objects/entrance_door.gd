extends Door

@export var open_sound : AudioStreamMP3

func _on_interact():
	if (is_locked):
		if (Controller.picked_up_crowbar):
			Controller.play_sound(open_sound)
			Hud.show_dialog_panel("I'm finally out!")
			is_locked = false
		else:
			Hud.show_dialog_panel("Oh no, who did this??? I have to find a way out!")
	else:
		Controller.goto_main_menu()
		Controller.picked_up_crowbar = false
	
func get_action_text() -> String:
	if (is_locked):
		return "Press 'Space' to inspect the door"
	else:
		return "Press 'Space' to get out"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
