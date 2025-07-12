extends Node2D

@onready var buttonspieler: Node2D = $Buttonspieler

var current_szene
var szene_dict = {}

func _ready() -> void:
	buttonspieler.room_change_requested.connect(szenewechsel)
	_load_scenes()
	szenewechsel(Memory.LOCATION.STUDY)

func _load_scenes() -> void:
	szene_dict[Memory.LOCATION.KUECHE]  = preload("res://scenes/stages/Küche.tscn").instantiate()
	szene_dict[Memory.LOCATION.GARTEN]  = preload("res://scenes/stages/Garten.tscn").instantiate()
	szene_dict[Memory.LOCATION.STUDY]  = preload("res://scenes/stages/Study.tscn").instantiate()
	szene_dict[Memory.LOCATION.BEDROOM]  = preload("res://scenes/stages/Bedroom.tscn").instantiate()

func szenewechsel(szene : Memory.LOCATION) -> void:
	if current_szene != null:
		self.remove_child(current_szene)
	Memory.change_active_location(szene)
	current_szene = szene_dict[szene]
	self.add_child(current_szene)
