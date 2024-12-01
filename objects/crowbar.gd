extends Interactable


func _on_interact():
	Hud.show_dialog_panel("I can finally get out!!!")
	$InteractionCollider.set_disabled(true)
	$Sprite2D.hide()
	Controller.picked_up_crowbar = true
	
func get_action_text() -> String:
	return "Press 'Space' to pick up the crowbar"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
