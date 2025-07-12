extends Node

enum LOCATION {KUECHE, STUDY, GARTEN, BEDROOM}
enum CHARACTER{NOIR, LADY, KOCH, POLIZEI, SOHN, MAGD}

var character_dict = {
	CHARACTER.NOIR : LOCATION.STUDY,
	CHARACTER.KOCH : LOCATION.KUECHE,
	CHARACTER.LADY : LOCATION.GARTEN,
	CHARACTER.POLIZEI : LOCATION.BEDROOM,
	CHARACTER.SOHN : LOCATION.BEDROOM,
	CHARACTER.MAGD : LOCATION.KUECHE
}

var ActLoc : LOCATION

var inventory: Inventory = Inventory.new()

func change_active_location(location: LOCATION) -> void:
	ActLoc = location
	set_character_location(CHARACTER.NOIR, location)

func set_character_location(character: CHARACTER, location: LOCATION) -> void:
	character_dict[character] = location

func character_at_location(character : CHARACTER) -> bool:
	return character_dict[character] == ActLoc
