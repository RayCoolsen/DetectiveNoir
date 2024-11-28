extends TextureButton

@export var character : Memory.CHARACTER
@export var character_timeline : String

signal character_dialog_request(argument: String)

func _on_pressed() -> void:
	character_dialog_request.emit(character_timeline)

func visibility_room() -> void:
	visible = Memory.character_in_room(character)
