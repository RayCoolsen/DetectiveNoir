extends Node2D

@export var timeline : String
@onready var puppenspieler: Node2D = $Puppenspieler


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _input(event: InputEvent):
	if Dialogic.current_timeline != null:
		return
		
	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		Dialogic.start(timeline)
		get_viewport().set_input_as_handled()

func _on_dialogic_signal(argument: String):
	puppenspieler.update_visibility()