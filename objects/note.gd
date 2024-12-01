class_name Note5
extends NoteInteractable
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_interact():
	#print("Action not implemented")
	$Sprite2D.hide()
	Hud.show_dialog_panel("Doctor called me today. He said they’re coming for me—to take me to the hospital. He says I need help, but I won’t go. I won’t g")
	
func get_action_text() -> String:
	return "Press 'Space' to pick up a note fragment"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
