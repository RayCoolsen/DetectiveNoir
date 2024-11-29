extends TextureButton

@export var character : Memory.CHARACTER
@export var character_timeline : String

signal character_dialog_request(argument: String)

func _ready() -> void:
	Dialogic.signal_event.connect(dialog_visibility)

func _enter_tree():
	visibility_room()

func _on_pressed() -> void:
	character_dialog_request.emit(character_timeline)

func dialog_visibility(argument : String) -> void:
	if(argument == "hide"): visible = false
	else: visibility_room()

func visibility_room() -> void:
	visible = Memory.character_in_room(character)
