extends Node2D

@onready var noir: TextureButton = $Noir
@onready var lady: TextureButton = $Lady
@onready var polizei: TextureButton = $Polizei
@onready var koch: TextureButton = $Koch
@onready var magd: TextureButton = $Magd
@onready var sohn: TextureButton = $Sohn

signal dialog_request(argument: String)

func _ready() -> void:
	noir.character_dialog_request.connect(_on_character_dialog_request)
	lady.character_dialog_request.connect(_on_character_dialog_request)
	polizei.character_dialog_request.connect(_on_character_dialog_request)
	koch.character_dialog_request.connect(_on_character_dialog_request)
	magd.character_dialog_request.connect(_on_character_dialog_request)
	sohn.character_dialog_request.connect(_on_character_dialog_request)

func update_visibility():
	noir.visible = Dialogic.VAR.Visibility.Noir
	lady.visible = Dialogic.VAR.Visibility.Lady
	polizei.visible = Dialogic.VAR.Visibility.Polizei
	koch.visible = Dialogic.VAR.Visibility.Koch
	magd.visible = Dialogic.VAR.Visibility.Magd
	sohn.visible = Dialogic.VAR.Visibility.Sohn

func _on_character_dialog_request(requested_timeline: String):
	dialog_request.emit(requested_timeline)
