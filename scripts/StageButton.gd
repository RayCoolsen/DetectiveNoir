extends Control

@export var target_location : Memory.LOCATION
@export var hover_offset: Vector2 = Vector2(-100, 0)
@export var animation_speed: float = 0.2

var original_position: Vector2
var tween: Tween

signal stage_change_requested(location : Memory.LOCATION)

func _ready() -> void:
	original_position = position

func _on_mouse_entered() -> void:
	if should_ignore_input(): return
	animate_position(original_position + hover_offset)

func _on_mouse_exited() -> void:
	if should_ignore_input(): return
	animate_position(original_position)

func _on_pressed() -> void:
	if should_ignore_input(): return
	stage_change_requested.emit(target_location)

# Hilfsfunktion für Animationen
func animate_position(target_pos: Vector2) -> void:
	if tween && tween.is_running():
		tween.kill()
	
	tween = create_tween()
	tween.tween_property(self, "position", target_pos, animation_speed)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_CUBIC)

# Prüft ob Eingaben ignoriert werden sollten
func should_ignore_input() -> bool:
	return Memory.inventory_open
