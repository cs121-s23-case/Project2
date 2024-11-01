extends Node2D
@onready var Sword = $Sword
@export var level_start_pos : Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var Val = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.

func Sword_Collected() -> void:
	Val += 1
