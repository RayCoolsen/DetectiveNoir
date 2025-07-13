extends Node2D

signal item_pickup_requested(item: Item)

func _ready() -> void:
	for child in get_children():
		child.item_pickup_requested.connect(on_item_pickup_requested)

func on_item_pickup_requested(item: Item) -> void:
	item_pickup_requested.emit(item)
