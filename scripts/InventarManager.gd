extends Node2D

@onready var inventar_spieler: Node2D = $Inventarspieler

signal dialog_triggered(timeline: String)

func _ready() -> void:
	inventar_spieler.item_pickup_requested.connect(on_item_pickup_requested)

func on_item_pickup_requested(item:Item):
	Memory.add_item_to_inventory(item)
	
	if item and item.pick_up_timeline and not item.pick_up_timeline.is_empty():
		dialog_triggered.emit(item.pick_up_timeline)
