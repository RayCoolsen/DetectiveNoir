extends Node

enum LOCATION {KUECHE, STUDY, GARTEN, BEDROOM}
enum CHARACTER{NOIR, LADY, KOCH, POLIZEI, SOHN, MAGD}

var LadyLoc : LOCATION = LOCATION.GARTEN
var KochLoc : LOCATION = LOCATION.KUECHE
var NoirLoc : LOCATION = LOCATION.STUDY
var PolizeiLoc : LOCATION = LOCATION.BEDROOM
var SohnLoc : LOCATION = LOCATION.BEDROOM
var MagdLoc : LOCATION = LOCATION.KUECHE

var ActLoc : LOCATION

func character_in_room(character : CHARACTER) -> bool:
	var charloc : LOCATION
	if character == CHARACTER.NOIR: charloc = NoirLoc
	elif character == CHARACTER.LADY: charloc = LadyLoc
	elif character == CHARACTER.KOCH: charloc = KochLoc
	elif character == CHARACTER.POLIZEI: charloc = PolizeiLoc
	elif character == CHARACTER.SOHN: charloc = SohnLoc
	elif character == CHARACTER.MAGD: charloc = MagdLoc
	return charloc == ActLoc
