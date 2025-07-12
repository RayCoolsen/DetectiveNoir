extends Node2D

signal room_change_requested(target_location: Memory.LOCATION)

var current_button_player: Node = null

func disconnect_current_buttons() -> void:
	if current_button_player and current_button_player.is_connected("room_change_requested", _on_room_change_requested):
		current_button_player.room_change_requested.disconnect(_on_room_change_requested)
	current_button_player = null

func connect_stage_buttons(stage: Node2D) -> void:
	# Finde neuen Buttonspieler
	current_button_player = stage.find_child("Buttonspieler")
	if not current_button_player:
		push_error("Buttonspieler not found in stage: " + stage.name)
		return
	
	# Verbinde neue Signale
	current_button_player.room_change_requested.connect(_on_room_change_requested)

func _on_room_change_requested(target_location: Memory.LOCATION) -> void:
	room_change_requested.emit(target_location)
