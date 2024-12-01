extends Room

@export var knock_sound : AudioStreamMP3 = preload("res://music/knockking.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Hud.show_dialog_panel(" Who is knocking on the window?!")
	Controller.play_sound(knock_sound, -15)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
