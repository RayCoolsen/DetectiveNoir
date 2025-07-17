extends TextureButton

@export var character: Memory.CHARACTER
@export var dialog_timeline: String

signal dialog_requested(timeline: String)

func _ready() -> void:
	Dialogic.timeline_started.connect(on_timeline_started)
	Dialogic.timeline_ended.connect(on_timeline_ended)

func _enter_tree() -> void:
	update_visibility()

func _on_pressed() -> void:
	if Memory.inventory_open:
		return
	dialog_requested.emit(dialog_timeline)

func on_timeline_started() -> void:
	visible = false

func on_timeline_ended() -> void:
	update_visibility()

func update_visibility() -> void:
	visible = Memory.character_at_location(character)
