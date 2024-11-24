extends TextureButton

@export var character_timeline : String

signal character_dialog_request(argument: String)

func _on_pressed() -> void:
	character_dialog_request.emit(character_timeline)
