extends Control

onready var background := $Background
onready var main_menu := $VBoxContainer/MainMenu
onready var fullscreen := $VBoxContainer/Fullscreen
onready var quit_game := $VBoxContainer/QuitGame
onready var music_slide := $VBoxContainer/Music
onready var sfx_slide := $VBoxContainer/SFX
onready var confirm_quit := $ConfirmQuit

onready var title_screen := load('res://ui/TitleScreen.tscn')
onready var transition_screen := load('res://ui/TransitionScreen.tscn')


var can_pause := true

func _ready():
	music_slide.value = db2linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index('Music')))
	sfx_slide.value = db2linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index('SFX')))
	fullscreen.pressed = OS.window_fullscreen

func _toggle_pause():
	var p_state := get_tree().paused
	p_state = not p_state

	get_tree().paused = p_state
	visible = p_state

func _process(delta):
	if Input.is_action_just_pressed('pause') && can_pause:
		_toggle_pause()

func _on_MainMenu_pressed():
	_toggle_pause()
	can_pause = false
	var trans = transition_screen.instance()
	get_tree().get_root().add_child(trans)
	yield(trans, 'covered')
	get_tree().change_scene_to(title_screen)


func _on_Fullscreen_pressed():
	if get_tree().paused:
		OS.window_fullscreen = !OS.window_fullscreen


func _on_QuitGame_pressed():
	confirm_quit.popup()


func _on_Music_value_changed(value):
	var conv_val = linear2db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Music'), conv_val)


func _on_SFX_value_changed(value):
	var conv_val = linear2db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('SFX'), conv_val)


func _on_Resume_pressed():
	_toggle_pause()


func _on_ConfirmQuit_confirmed():
	if get_tree().paused:
		get_tree().quit()