extends TextureButton

@export var character: Memory.CHARACTER
@export var dialog_timeline: String

signal dialog_requested(timeline: String)

func _ready() -> void:
	Dialogic.signal_event.connect(on_dialogic_signal)

func _enter_tree() -> void:
	update_visibility()

func _on_pressed() -> void:
	if Memory.inventory_open:
		return
	dialog_requested.emit(dialog_timeline)

func on_dialogic_signal(event: String) -> void:
	if event == "hide": 
		visible = false
	else: 
		update_visibility()

func update_visibility() -> void:
	visible = Memory.character_at_location(character)
