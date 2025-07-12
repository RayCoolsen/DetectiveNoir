extends Node2D

signal stage_change_requested(target_location: Memory.LOCATION)

var current_navigationspieler: Node = null

func disconnect_current_buttons() -> void:
	if current_navigationspieler and current_navigationspieler.is_connected("stage_change_requested", _on_stage_change_requested):
		current_navigationspieler.stage_change_requested.disconnect(_on_stage_change_requested)
	current_navigationspieler = null

func connect_stage_buttons(stage: Node2D) -> void:
	# Finde neuen Buttonspieler
	current_navigationspieler = stage.find_child("Buttonspieler")
	if not current_navigationspieler:
		push_error("Buttonspieler not found in stage: " + stage.name)
		return
	
	# Verbinde neue Signale
	current_navigationspieler.stage_change_requested.connect(_on_stage_change_requested)

func _on_stage_change_requested(target_location: Memory.LOCATION) -> void:
	stage_change_requested.emit(target_location)
