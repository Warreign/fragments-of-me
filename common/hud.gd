extends CanvasLayer

var is_dialog_shown : bool = false

@onready var action_label : Label = $MainHud/MarginContainer/ActionLabel

@onready var dialog_panel : Control = $MainHud/DialogPanel
@onready var dialog_text : RichTextLabel = dialog_panel.get_node("DialogText")

func set_action_label(text : String):
	if (text):
		action_label.show()
		action_label.text = text
	else:
		action_label.hide()

func show_dialog_panel(text : String):
	dialog_text.text = text
	is_dialog_shown = true
	dialog_panel.show()
	Controller.set_handling_movement(false)
	
func hide_dialog_panel():
	is_dialog_shown = false
	dialog_panel.hide()
	Controller.set_handling_movement(true)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	action_label.hide()
	dialog_panel.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!is_dialog_shown and Input.is_action_just_pressed("debug_dialog")):
		show_dialog_panel("ahahahaahah")
	
	if (is_dialog_shown and Input.is_action_just_pressed("primary_action")):
		hide_dialog_panel()
	pass
