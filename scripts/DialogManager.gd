extends Node2D

@export var default_timeline : String
@export var loc : Memory.LOCATION
@onready var puppenspieler: Node2D = $Puppenspieler

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	puppenspieler.dialog_request.connect(start_dialog)
	start_dialog(default_timeline)

func _enter_tree():
	Memory.ActLoc = loc

func start_dialog(timeline: String):
	if Dialogic.current_timeline != null || timeline.is_empty():
		return
	Dialogic.start(timeline)
	get_viewport().set_input_as_handled()
