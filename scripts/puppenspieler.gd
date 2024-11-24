extends Node2D

@onready var noir: TextureButton = $Noir
@onready var lady: TextureButton = $Lady
@onready var polizei: TextureButton = $Polizei
@onready var koch: TextureButton = $Koch
@onready var magd: TextureButton = $Magd
@onready var sohn: TextureButton = $Sohn

signal dialog_request(argument: String)

func _ready() -> void:
	Dialogic.signal_event.connect(_update_visibility)
	set_dialog_start_visibility()
	for child in get_children():
		child.character_dialog_request.connect(_on_character_dialog_request)

func set_dialog_start_visibility():
	Dialogic.VAR.Visibility.Noir = noir.visible
	Dialogic.VAR.Visibility.Lady = lady.visible
	Dialogic.VAR.Visibility.Polizei = polizei.visible
	Dialogic.VAR.Visibility.Koch = koch.visible
	Dialogic.VAR.Visibility.Magd = magd.visible
	Dialogic.VAR.Visibility.Sohn = sohn.visible

func _update_visibility(_argument):
	noir.visible = Dialogic.VAR.Visibility.Noir
	lady.visible = Dialogic.VAR.Visibility.Lady
	polizei.visible = Dialogic.VAR.Visibility.Polizei
	koch.visible = Dialogic.VAR.Visibility.Koch
	magd.visible = Dialogic.VAR.Visibility.Magd
	sohn.visible = Dialogic.VAR.Visibility.Sohn

func _on_character_dialog_request(requested_timeline: String):
	dialog_request.emit(requested_timeline)
