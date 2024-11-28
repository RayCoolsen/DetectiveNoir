extends Node

enum LOCATION {KUECHE, STUDY, GARTEN, BEDROOM}
enum CHARACTER{NOIR, LADY, KOCH, POLIZEI, SOHN, MAGD}

var LadyLoc : LOCATION
var KochLoc : LOCATION
var NoirLoc : LOCATION
var PolizeiLoc : LOCATION
var SohnLoc : LOCATION
var MagdLoc : LOCATION

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
