extends TextureButton

@export var collectible_item: Item
signal item_pickup_requested(item: Item)

func _ready() -> void:
	if collectible_item and collectible_item.texture:
		texture_normal = collectible_item.texture


func _on_pressed() -> void:
	if Memory.inventory_open:
		return
	item_pickup_requested.emit(collectible_item)
	queue_free()
