class_name  NoteInteractable
extends Interactable

static var pickup_audio : AudioStreamMP3 = preload("res://music/note.mp3")

func _on_interact_final():
	Controller.play_sound(pickup_audio)
	super._on_interact_final()
