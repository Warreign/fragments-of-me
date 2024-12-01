class_name Interactable
extends Area2D

@export var is_interactable_once : bool = false
var was_interacted : bool = false

func _on_interact_final():
	print("was interacted")
	if (is_interactable_once):
		$InteractionCollider.set_disabled(true)
		if (was_interacted):
			print("already interacted")
			return
		
	_on_interact()
	was_interacted = true

func get_action_text_final():
	if (is_interactable_once and was_interacted):
		return ""
	return get_action_text()

func _on_interact():
	print("Action not implemented")
	
func get_action_text() -> String:
	return "Action not implemented"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
