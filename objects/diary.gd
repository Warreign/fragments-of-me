class_name Note0
extends NoteInteractable
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_interact():
	print("Action not implemented")
	$Sprite2D.hide()
	Hud.show_dialog_panel("Doctor says I should keep a diary. He thinks it’ll help me remember things better, keep track of everything that happens. He wants me to call him once a week too, to check in, make sure I’m doing okay. I guess it can’t hurt to try.")
	
func get_action_text() -> String:
	return "Press 'Space' to pick up a note fragment"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
