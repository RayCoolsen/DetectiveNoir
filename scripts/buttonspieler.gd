extends Node2D

signal stage_change_requested(target_location : Memory.LOCATION)

func _ready() -> void:
	for child in get_children():
		child.stage_change_requested.connect(on_stage_change_requested)

func on_stage_change_requested(target_location : Memory.LOCATION) -> void:
	stage_change_requested.emit(target_location)
