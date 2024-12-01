extends Interactable

@export var safe_explosion : AudioStreamMP3

@export var open_safe_texture : Texture2D
var is_safe_open : bool = false

func _on_interact():
	if (is_safe_open):
		$InteractionCollider.set_disabled(true)
		Controller.play_sound(NoteInteractable.pickup_audio)
		Hud.show_dialog_panel("Lately, I’ve been feeling more angry for no reason, and I’ve started remembering things that didn’t happen. Conversations, places—things that don’t make sense. It’s getting worse. I need to call the doctor tomorrow. Something’s wrong.")
		return

	
	if (!get_parent().got_tnt):
		Hud.show_dialog_panel("I can't move it, it's too heavy...")
	elif (!get_parent().got_lighter):
		Hud.show_dialog_panel("I can't light this thing with my bare hands...")
	else:
		#$Sprite2D.hide()
		#$StaticBody2D/CollisionCollider.set_disabled(true)
		$"../Hole".is_locked = false
		$Sprite2D.set_texture(open_safe_texture)
		Hud.show_dialog_panel("Take it, safe! Oh, what's in that hole?")
		is_safe_open = true
		Controller.play_sound(safe_explosion, -12)
	
func get_action_text() -> String:
	if (!is_safe_open):
		if (!get_parent().got_tnt):
			return "Press 'Space' to inspect the safe"
		else:
			return "Press 'Space' to blow up the safe"
	else:
		return "Press 'Space' to take a note fragment from the safe"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
