class_name Main_Menu
extends Control
@onready var Level_1: Button = $Start_Game as Button
@onready var Quit_Game: Button = $Quit as Button
@onready var start_level = preload("res://Level1.tscn") as PackedScene
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	Level_1.button_down.connect(on_Level_1_pressed)
	Quit_Game.button_down.connect(on_Quit_Game_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_Level_1_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	
func on_Quit_Game_pressed() -> void:
	get_tree().quit()
	
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
