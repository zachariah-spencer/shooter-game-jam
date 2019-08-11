extends Node

const void_type = 0
const fire = 1
const lightning = 2
const water = 3
const earth = 4
const air = 5

const damage_color = {
	void_type : Color.darkslategray,
	"void" : Color.darkslategray,
	"fire" : Color.red,
	fire : Color.red,
	"lightning" : Color.yellow,
	lightning : Color.yellow,
	"water" : Color.blue,
	water : Color.blue,
	"earth" : Color.green,
	earth : Color.green,
	air : Color.whitesmoke,
	"air" : Color.whitesmoke
}

enum damage_types { void_type, fire, lightning, water, earth, air}
