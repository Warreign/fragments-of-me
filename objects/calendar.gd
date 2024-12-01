extends StaticInteractable

@export var texture_past : Texture2D
@export var texture_present : Texture2D

@onready var sprite : Sprite2D = $Sprite2D

func toggle_calendar(is_past :bool):
	if (is_past):
		sprite.set_texture(texture_past)
	else:
		sprite.set_texture(texture_present)
		

func _on_interact():
	Controller.toggle_time()
	Hud.show_dialog_panel("What happened?! My head hurts... (Press 'Q' to toggle time)")
	
func get_action_text() -> String:
	return "Press 'Space' to look at the calendar"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Controller.connect("time_changed", toggle_calendar, CONNECT_DEFERRED)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
