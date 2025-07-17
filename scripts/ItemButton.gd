@tool
extends TextureButton

@export var collectible_item: Item:
	set(value):
		collectible_item = value
		update_texture()

signal item_pickup_requested(item: Item)

func _ready() -> void:
	if Engine.is_editor_hint():
		update_texture()
	else:
		if collectible_item and collectible_item.texture:
			texture_normal = collectible_item.texture

func update_texture() -> void:
	if collectible_item and collectible_item.texture:
		texture_normal = collectible_item.texture
	else:
		texture_normal = null

func _on_pressed() -> void:
	if Memory.inventory_open:
		return
	item_pickup_requested.emit(collectible_item)
	queue_free()
