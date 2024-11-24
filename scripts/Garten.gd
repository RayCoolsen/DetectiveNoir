extends Node2D

@onready var detektive: Sprite2D = $Detektive
@onready var ehefrau: Sprite2D = $Ehefrau


func _ready() -> void:
	ehefrau.visible = true
	detektive.visible = false
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _input(event: InputEvent):
	if Dialogic.current_timeline != null:
		return
		
	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		visibility_characters(false)
		Dialogic.start('Garten')
		get_viewport().set_input_as_handled()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func visibility_characters(vis: bool):
	ehefrau.visible = vis
	detektive.visible = vis

func _on_dialogic_signal(argument: String):
	if argument == "ende" :
		visibility_characters(true)
