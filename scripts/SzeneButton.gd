extends TextureButton

@export var nachricht : Memory.LOCATION

signal knopfgedrueckt(argument : Memory.LOCATION)

func _on_pressed() -> void:
	knopfgedrueckt.emit(nachricht)
