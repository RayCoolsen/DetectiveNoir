extends Node2D

@onready var buttonspieler: Node2D = $Buttonspieler

var KUECHE
var GARTEN
var STUDY
var aktuell

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Memory.KochLoc = Memory.LOCATION.KUECHE
	Memory.LadyLoc = Memory.LOCATION.GARTEN
	Memory.NoirLoc = Memory.LOCATION.STUDY
	Memory.PolizeiLoc = Memory.LOCATION.BEDROOM
	Memory.SohnLoc = Memory.LOCATION.BEDROOM
	Memory.MagdLoc = Memory.LOCATION.KUECHE
	
	buttonspieler.szenewechsel.connect(szenewechsel)
	KUECHE = preload("res://scenes/Küche.tscn").instantiate()
	GARTEN = preload("res://scenes/Garten.tscn").instantiate()
	STUDY = preload("res://scenes/Study.tscn").instantiate()
	szenewechsel(Memory.LOCATION.STUDY)

func szenewechsel(argument : Memory.LOCATION):
	if aktuell != null:
		self.remove_child(aktuell)
	if argument == Memory.LOCATION.KUECHE:
		aktuell = KUECHE
	elif argument == Memory.LOCATION.GARTEN:
		aktuell = GARTEN
	elif argument == Memory.LOCATION.STUDY:
		aktuell = STUDY
	self.add_child(aktuell)
