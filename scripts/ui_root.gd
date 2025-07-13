extends CanvasLayer

@onready var inventory_dialog: InventoryDialog = %InventoryDialog

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("inventory"):
		if Dialogic.current_timeline != null:
			return
		if inventory_dialog.visible:
			inventory_dialog.hide()
			Memory.inventory_open = false
		else:
			inventory_dialog.open(Memory.inventory)
			Memory.inventory_open = true
