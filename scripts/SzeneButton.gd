extends TextureButton

@export var target_location : Memory.LOCATION
signal room_change_requested(location : Memory.LOCATION)

func _on_pressed() -> void:
	room_change_requested.emit(target_location)
