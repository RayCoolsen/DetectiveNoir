extends Node2D

@onready var buttonspieler: Node2D = $Buttonspieler
@onready var inventar_spieler: Node2D = $Inventarspieler

var current_szene
var szene_dict = {}

var inventory: Inventory = Inventory.new()

func _ready() -> void:
	buttonspieler.room_change_requested.connect(szenewechsel)
	inventar_spieler.item_pickup_requested.connect(on_item_pickup_requested)
	_load_scenes()
	szenewechsel(Memory.LOCATION.STUDY)

func _load_scenes() -> void:
	szene_dict[Memory.LOCATION.KUECHE]  = preload("res://scenes/Küche.tscn").instantiate()
	szene_dict[Memory.LOCATION.GARTEN]  = preload("res://scenes/Garten.tscn").instantiate()
	szene_dict[Memory.LOCATION.STUDY]  = preload("res://scenes/Study.tscn").instantiate()
	szene_dict[Memory.LOCATION.BEDROOM]  = preload("res://scenes/Bedroom.tscn").instantiate()

func on_item_pickup_requested(item:Item):
	inventory.add_item(item)

func szenewechsel(szene : Memory.LOCATION) -> void:
	if current_szene != null:
		self.remove_child(current_szene)
	Memory.change_active_location(szene)
	current_szene = szene_dict[szene]
	self.add_child(current_szene)
