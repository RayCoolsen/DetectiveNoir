extends TextureButton

@export var collectible_item: Item
signal item_pickup_requested(item: Item)

func _on_pressed() -> void:
	item_pickup_requested.emit(collectible_item)
