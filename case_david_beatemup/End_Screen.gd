class_name End_Screen
extends Control
@onready var Quit_Game: Button = $Quit as Button

func _ready() -> void:
	Quit_Game.button_down.connect(on_Quit_Game_pressed)

func on_Quit_Game_pressed() -> void:
	get_tree().quit()
	
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
