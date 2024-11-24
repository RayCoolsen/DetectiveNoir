extends Node2D

@onready var noir: Sprite2D = $Noir
@onready var lady: Sprite2D = $Lady
@onready var polizei: Sprite2D = $Polizist
@onready var koch: Sprite2D = $Koch
@onready var magd: Sprite2D = $Magd
@onready var sohn: Sprite2D = $Sohn

func update_visibility():
	noir.visible = Dialogic.VAR.Visibility.Noir
	lady.visible = Dialogic.VAR.Visibility.Lady
	polizei.visible = Dialogic.VAR.Visibility.Polizei
	koch.visible = Dialogic.VAR.Visibility.Koch
	magd.visible = Dialogic.VAR.Visibility.Magd
	sohn.visible = Dialogic.VAR.Visibility.Sohn
