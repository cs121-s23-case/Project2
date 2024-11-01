extends Control
@onready var Level_2: Button = $Level_2 as Button
@onready var End_Game: Button = $End_Game as Button
@onready var Level2 = preload("res://Level2.tscn") as PackedScene
@onready var end_screen = preload("res://End_Screen.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Level_2.button_down.connect(on_Level_2_pressed)
	End_Game.button_down.connect(on_End_Game_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_Level_2_pressed() -> void:
	get_tree().change_scene_to_packed(Level2)
	
func on_End_Game_pressed() -> void:
	get_tree().change_scene_to_packed(end_screen)
