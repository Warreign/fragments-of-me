extends Interactable

func _on_interact():
	if (!get_parent().got_tnt):
		Hud.show_dialog_panel("I can't move it, it's too heavy...")
	else:
		#$Sprite2D.hide()
		$InteractionCollider.set_disabled(true)
		$StaticBody2D/CollisionCollider.set_disabled(true)
		$"../Hole".is_locked = false
		Hud.show_dialog_panel("Oh, what's in that hole?")
	
func get_action_text() -> String:
	if (!get_parent().got_tnt):
		return "Press 'Space' to inspect the safe"
	else:
		return "Press 'Space' to blow up the safe"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass