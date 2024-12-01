class_name Note1

extends Interactable
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_interact():
	#print("Action not implemented")
	$Sprite2D.hide()
	
func get_action_text() -> String:
	return "Press 'Space' to pick up a note fragment"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
