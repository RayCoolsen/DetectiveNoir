extends Node2D

signal room_change_requested(target_location : Memory.LOCATION)

func _ready() -> void:
	for child in get_children():
		child.room_change_requested.connect(on_room_change_requested)

func on_room_change_requested(target_location : Memory.LOCATION) -> void:
	room_change_requested.emit(target_location)
