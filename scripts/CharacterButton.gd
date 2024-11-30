extends TextureButton

@export var character : Memory.CHARACTER
@export var character_timeline : String

signal character_dialog_request(argument: String)

func _ready() -> void:
	Dialogic.signal_event.connect(visibility_dialog)

func _enter_tree() -> void:
	visibility_room()

func _on_pressed() -> void:
	character_dialog_request.emit(character_timeline)

func visibility_dialog(argument : String) -> void:
	if(argument == "hide"): visible = false
	else: visibility_room()

func visibility_room() -> void:
	visible = Memory.character_at_location(character)
