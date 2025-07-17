extends Node2D

signal stage_change_requested(target_location : Memory.LOCATION)

func _ready() -> void:
	Dialogic.signal_event.connect(on_dialogic_signal)
	for child in get_children():
		child.stage_change_requested.connect(on_stage_change_requested)

func on_stage_change_requested(target_location : Memory.LOCATION) -> void:
	stage_change_requested.emit(target_location)

func on_dialogic_signal(event: String) -> void:
	if event == "show_navigation": 
		visible = true
	elif event == "hide_navigation":
		visible = false
