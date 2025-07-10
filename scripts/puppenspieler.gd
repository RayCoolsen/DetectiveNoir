extends Node2D

signal dialog_requested(timeline: String)

func _ready() -> void:
	for child in get_children():
		child.dialog_requested.connect(on_dialog_requested)

func on_dialog_requested(timeline: String) -> void:
	dialog_requested.emit(timeline)
