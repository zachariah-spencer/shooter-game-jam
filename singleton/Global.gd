extends Node

var player
var boss
const CELL_SIZE = 64

var tilemap

const LIMIT_LEFT = -320
const LIMIT_RIGHT = 1760
const LIMIT_TOP = -1120
const LIMIT_BOT = 352

var won := true

var GAMEOVER = preload('res://map/GameOver.tscn')

func game_end(win : bool):
	won = win
	get_tree().change_scene_to(GAMEOVER)
