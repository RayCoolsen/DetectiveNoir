extends Node

enum LOCATION {KUECHE, STUDY, GARTEN, BEDROOM}
enum CHARACTER{NOIR, LADY, KOCH, POLIZEI, SOHN, MAGD, RIVALE}

var character_dict = {
	CHARACTER.NOIR : LOCATION.STUDY,
	CHARACTER.KOCH : LOCATION.KUECHE,
	CHARACTER.LADY : LOCATION.GARTEN,
	CHARACTER.POLIZEI : LOCATION.BEDROOM,
	CHARACTER.SOHN : LOCATION.BEDROOM,
	CHARACTER.MAGD : LOCATION.KUECHE,
	CHARACTER.RIVALE : LOCATION.GARTEN
}

var ActLoc : LOCATION

var inventory: Inventory = Inventory.new()
var all_items: ResourceGroup 
var _all_items: Dictionary = {}

var inventory_open: bool = false

func _ready() -> void:
	var loaded_resource = ResourceLoader.load("res://data/all_items.tres")
	
	if loaded_resource is ResourceGroup:
		all_items = loaded_resource
		
		# Temporäres Array zum Laden der Ressourcen
		var temp_array: Array[Item] = []
		all_items.load_all_into(temp_array)
		
		# Konvertiere Array in Dictionary
		for item in temp_array:
			if item:
				_all_items[item.name] = item
			else:
				push_warning("Ungültiges Item in ResourceGroup gefunden")
	else:
		push_error("Failed to load all_items.tres or incorrect resource type!")

func has_item_in_inventory(item: Item) -> bool:
	return inventory.has_item(item)

func add_item_to_inventory(item: Item) -> void:
	inventory.add_item(item)

func remove_item_from_inventory(item: Item) -> void:
	inventory.remove_item(item)

func change_active_location(location: LOCATION) -> void:
	ActLoc = location
	set_character_location(CHARACTER.NOIR, location)

func set_character_location(character: CHARACTER, location: LOCATION) -> void:
	character_dict[character] = location

func character_at_location(character : CHARACTER) -> bool:
	return character_dict[character] == ActLoc
