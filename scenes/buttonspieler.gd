extends Node2D

@onready var kueche_button: TextureButton = $"KücheButton"

signal szenewechsel(argument : String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	kueche_button.knopfgedrueckt.connect(on_knopfgedrueckt)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_knopfgedrueckt(argument : String):
	szenewechsel.emit(argument)
