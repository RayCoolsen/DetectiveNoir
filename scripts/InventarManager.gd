extends Node2D

@onready var inventar_spieler: Node2D = $Inventarspieler


func _ready() -> void:
	inventar_spieler.item_pickup_requested.connect(on_item_pickup_requested)

func on_item_pickup_requested(item:Item):
	Memory.inventory.add_item(item)
