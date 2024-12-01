extends CanvasLayer

var is_dialog_shown : bool = false

#Text animation
var is_animating : bool
var percent_shown : float
var delta : float

@onready var pause_panel : Control = $PauseContainer

@onready var action_label : Label = $MarginContainer/ActionLabel

@onready var dialog_panel : Control = $DialogPanel
#@onready var dialog_panel : Control = $MainHud/DialogPanel
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
	show_text_animation(text.length())

func hide_dialog_panel():
	is_dialog_shown = false
	dialog_panel.hide()
	Controller.set_handling_movement(true)

func show_text_animation(charnum : int):
	is_animating = true
	percent_shown = 0
	delta = 0.01
	pass
	
func update_text_animation():
	if not percent_shown > 100:
		dialog_text.set_visible_ratio(percent_shown)
		percent_shown += delta
	else:
		is_animating = false
	pass
	
func skip_text_animation():
	is_animating = false
	percent_shown = 1
	dialog_text.set_visible_ratio(1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	action_label.hide()
	dialog_panel.hide()
	pause_panel.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("pause")):
		if (!pause_panel.visible):
			pause_game()
		else:
			unpause_game()
	
	if (!is_dialog_shown and Input.is_action_just_pressed("debug_dialog")):
		show_dialog_panel("ahahahaahahasdasdasdsaasdasdadasdasdasd asdasdasddasdasdasd sdasdasd")
	
	if (is_dialog_shown and Input.is_action_just_pressed("dialog_interaction")):
		if is_animating:
			skip_text_animation()
		else:
			hide_dialog_panel()
	
	if is_animating:
		update_text_animation()
	pass
	
func pause_game():
	if (Controller.is_in_menu):
		return
	pause_panel.show()
	Controller.set_handling_movement(false)

func unpause_game():
	pause_panel.hide()
	Controller.set_handling_movement(true)
	
func main_menu():
	unpause_game()
	Controller.goto_main_menu()
	
