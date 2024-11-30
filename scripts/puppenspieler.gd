extends Node2D

signal dialog_request(argument: String)

func _ready() -> void:
	for child in get_children():
		child.character_dialog_request.connect(_on_character_dialog_request)

func _on_character_dialog_request(requested_timeline: String) -> void:
	dialog_request.emit(requested_timeline)
