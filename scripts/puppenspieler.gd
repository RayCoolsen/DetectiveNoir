extends Node2D

@onready var noir: TextureButton
@onready var lady: TextureButton
@onready var polizei: TextureButton
@onready var koch: TextureButton
@onready var magd: TextureButton
@onready var sohn: TextureButton

signal dialog_request(argument: String)

func _ready() -> void:
	Dialogic.signal_event.connect(_update_visibility)
	set_dialog_start_visibility()
	for child in get_children():
		child.character_dialog_request.connect(_on_character_dialog_request)

func _enter_tree():
	noir = $Noir
	lady = $Lady
	polizei = $Polizei
	koch = $Koch
	magd = $Magd
	sohn = $Sohn
	set_visibility()

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

func set_visibility():
	print("ActLoc:" + str(Memory.ActLoc))
	print("NoirLoc" + str(Memory.NoirLoc))
	print(Memory.ActLoc == Memory.NoirLoc)
	noir.visible = Memory.ActLoc == Memory.NoirLoc
	lady.visible = Memory.ActLoc == Memory.LadyLoc
	koch.visible = Memory.ActLoc == Memory.KochLoc
	polizei.visible = Memory.ActLoc == Memory.PolizeiLoc
	magd.visible = Memory.ActLoc == Memory.MagdLoc
	sohn.visible =Memory.ActLoc == Memory.SohnLoc
