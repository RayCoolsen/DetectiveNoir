extends TextureButton

@export var target_location : Memory.LOCATION
signal stage_change_requested(location : Memory.LOCATION)

func _on_pressed() -> void:
	stage_change_requested.emit(target_location)
