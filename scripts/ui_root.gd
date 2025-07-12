extends CanvasLayer

@onready var inventory_dialog: InventoryDialog = %InventoryDialog
@onready var game: Node2D = $".."


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("inventory"):
		if Dialogic.current_timeline != null:
			return
		inventory_dialog.open(Memory.inventory)
