extends Node2D

@onready var buttonspieler: Node2D = $Buttonspieler
@onready var inventar_spieler: Node2D = $Inventarspieler

var aktuell
var szene_dict = {}

func _ready() -> void:
	buttonspieler.szenewechsel.connect(szenewechsel)
	inventar_spieler.item_collect.connect(on_item_picked_up)
	szene_dict[Memory.LOCATION.KUECHE]  = preload("res://scenes/Küche.tscn").instantiate()
	szene_dict[Memory.LOCATION.GARTEN]  = preload("res://scenes/Garten.tscn").instantiate()
	szene_dict[Memory.LOCATION.STUDY]  = preload("res://scenes/Study.tscn").instantiate()
	szene_dict[Memory.LOCATION.BEDROOM]  = preload("res://scenes/Bedroom.tscn").instantiate()
	szenewechsel(Memory.LOCATION.STUDY)

func on_item_picked_up(argument:Item):
	print("I got a ", argument.name)

func szenewechsel(szene : Memory.LOCATION) -> void:
	if aktuell != null:
		self.remove_child(aktuell)
	Memory.change_active_location(szene)
	aktuell = szene_dict[szene]
	self.add_child(aktuell)
