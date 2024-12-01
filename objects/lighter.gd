extends Interactable

func _on_interact():
	$Sprite2D.hide()
	get_parent().got_lighter = true
	Hud.show_dialog_panel("This will help me ignite something")
	
func get_action_text() -> String:
	return "Press 'Space' to inspect lighter"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
