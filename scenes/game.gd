extends Node2D

@onready var buttonspieler: Node2D = $Buttonspieler

const KUECHE = preload("res://scenes/Küche.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buttonspieler.szenewechsel.connect(szenewechsel)

func szenewechsel(argument : String):
	print(argument)
	if(argument == "kueche"):
		var szene = preload("res://scenes/Küche.tscn").instantiate()
		self.add_child(szene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
