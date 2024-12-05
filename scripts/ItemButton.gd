extends TextureButton
@export var item:Item

signal knopfgedrueckt(argument : Item)

func _on_pressed() -> void:
	knopfgedrueckt.emit(item)
