extends Node2D

@export var default_timeline : String
@onready var puppenspieler: Node2D = $Puppenspieler


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	puppenspieler.dialog_request.connect(_on_dialog_request)

func _input(event: InputEvent):
	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		start_dialog(default_timeline)

func _on_dialogic_signal(argument: String):
	puppenspieler.update_visibility()

func _on_dialog_request(requested_timeline: String):
	start_dialog(requested_timeline)

func start_dialog(timeline: String):
	if Dialogic.current_timeline != null || timeline.is_empty():
		return
	Dialogic.start(timeline)
	get_viewport().set_input_as_handled()
