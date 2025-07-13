extends Node2D

@export var default_timeline : String
@onready var puppenspieler: Node2D = $Puppenspieler

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	puppenspieler.dialog_requested.connect(start_dialog)
	connect_to_inventory_signals()
	start_dialog(default_timeline)

func connect_to_inventory_signals() -> void:
	if get_parent() == null: return
	
	for sibling in get_parent().get_children():
		if sibling.has_signal("dialog_triggered"):
			sibling.dialog_triggered.connect(start_dialog)
			return

func start_dialog(timeline: String) -> void:
	if Memory.inventory_open or Dialogic.current_timeline != null or timeline.is_empty():
		return
	Dialogic.start(timeline)
	get_viewport().set_input_as_handled()
