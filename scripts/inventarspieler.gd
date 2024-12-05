extends Node2D
@onready var texture_button: TextureButton = $TextureButton

signal item_collect(argument:Item)

func _ready() -> void:
	texture_button.knopfgedrueckt.connect(on_knopfgedrueckt)

func on_knopfgedrueckt(argument : Item):
	item_collect.emit(argument)
	print ("Ich wurde gedrückt!" + argument.name)
