extends TextureButton

@export var nachricht : String

signal knopfgedrueckt(argument : String)

func _on_pressed() -> void:
	knopfgedrueckt.emit(nachricht)
