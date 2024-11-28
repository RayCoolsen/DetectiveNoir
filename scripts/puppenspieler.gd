extends Node2D

signal dialog_request(argument: String)

func _ready() -> void:
	Dialogic.signal_event.connect(update_visibility)
	for child in get_children():
		child.character_dialog_request.connect(_on_character_dialog_request)

func _enter_tree():
	set_visibility()

func _on_character_dialog_request(requested_timeline: String):
	dialog_request.emit(requested_timeline)

func set_visibility():
	for child in get_children():
		child.visibility_room()

func update_visibility(_argument):
	# Wie kann ich die Sichbarkeit updaten?
	pass
