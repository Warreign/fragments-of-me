extends Interactable

func _on_interact():
	$Sprite2D.hide()
	get_parent().got_tnt = true
	Hud.show_dialog_panel("I can probably open the safe with this...")
	
func get_action_text() -> String:
	return "Press 'Space' to pick up the TNT"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
