extends Node2D

@onready var stage_manager: Node2D = $StageManager

var current_stage: Node2D = null
var stage_dict = {}

func _ready() -> void:
	stage_manager.stage_change_requested.connect(change_stage)
	_load_scenes()
	change_stage(Memory.LOCATION.STUDY)

func _load_scenes() -> void:
	stage_dict = {
		Memory.LOCATION.KUECHE: preload("res://scenes/stages/Küche.tscn"),
		Memory.LOCATION.GARTEN: preload("res://scenes/stages/Garten.tscn"),
		Memory.LOCATION.STUDY: preload("res://scenes/stages/Study.tscn"),
		Memory.LOCATION.BEDROOM: preload("res://scenes/stages/Bedroom.tscn")
	}

func change_stage(target_location: Memory.LOCATION) -> void:
	# 1. Signale der alten Stage trennen
	stage_manager.disconnect_navigation()
	
	# 2. Alte Stage entfernen
	if current_stage:
		remove_child(current_stage)
	
	Memory.change_active_location(target_location)
	
	# 3. Neue Stage instanziieren oder wiederverwenden
	if not (stage_dict[target_location] is Node):
		stage_dict[target_location] = stage_dict[target_location].instantiate()
	
	current_stage = stage_dict[target_location]
	add_child(current_stage)
	
	# 4. Signale der neuen Stage verbinden
	stage_manager.connect_navigation(current_stage)
