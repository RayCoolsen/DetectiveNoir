extends Node2D
@onready var item_button: TextureButton = $Lupe

signal item_pickup_requested(item: Item)

func _ready() -> void:
	item_button.item_pickup_requested.connect(on_item_pickup_requested)

func on_item_pickup_requested(item: Item) -> void:
	item_pickup_requested.emit(item)
	print("Item pickup requested: " + item.name)
