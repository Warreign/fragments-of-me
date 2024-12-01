class_name Note3
extends NoteInteractable
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_interact():
	#print("Action not implemented")
	$Sprite2D.hide()
	Hud.show_dialog_panel("ive them myself that easily. I’ve got a plan. I remember I have something in the safe. The code is 4820. It’s mine, and they won’t find it. They can’t. They won’t find me...")
	
func get_action_text() -> String:
	return "Press 'Space' to pick up a note fragment"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
