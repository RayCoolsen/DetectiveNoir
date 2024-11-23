extends Node2D

@onready var detektive: Sprite2D = $Detektive
@onready var ehefrau: Sprite2D = $Ehefrau


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ehefrau.visible = false
	detektive.visible = true
	Dialogic.signal_event.connect(_on_dialogic_signal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent):
	if Dialogic.current_timeline != null:
		return
		
	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		visibility_characters(false)
		Dialogic.start('Intro')
		get_viewport().set_input_as_handled()

func visibility_characters(vis: bool):
	ehefrau.visible = vis
	detektive.visible = vis

func _on_dialogic_signal(argument: String):
	if argument == "ende" :
		visibility_characters(true)
