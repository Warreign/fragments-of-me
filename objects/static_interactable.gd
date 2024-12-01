class_name StaticInteractable
extends Interactable

func _on_interact():
	Hud.show_dialog_panel("Why is this even here...")
	$napkin.hide()
	
func get_action_text() -> String:
	return "Press 'Space' to throw away a napkin"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
