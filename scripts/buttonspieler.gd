extends Node2D

signal szenewechsel(argument : Memory.LOCATION)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		child.knopfgedrueckt.connect(on_knopfgedrueckt)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_knopfgedrueckt(argument : Memory.LOCATION):
	szenewechsel.emit(argument)
