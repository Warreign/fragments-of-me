extends Door

func get_action_text():
	if (is_locked):
		return ""
	else:
		return "Go to " + scene.get_file().get_basename().capitalize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
