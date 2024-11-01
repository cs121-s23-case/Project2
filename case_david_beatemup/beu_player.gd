class_name Player
extends CharacterBody2D
@export var speed = 300
@export var Val = 0
@export var level_start_pos : Node2D
@onready var anim_tree = $AnimationTree
#@onready var sfx_jump = $sfx/Jump
#@onready var sfx_die = $sfx/Die
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_control : bool = true
var original_position=Vector2(-152, 497)
const JUMP_VELOCITY = -400.0
var facing = 1


func _process(delta):
	if Input.is_action_pressed("Escape"):
		get_tree().quit()
		
	var dir = Input.get_vector("Left", "Right", "jump", "attack")
	
	if dir.x < 0 and facing == 1:
		self.scale.x *= -1
		facing = -1
		
	if dir.x > 0 and facing == -1:
		self.scale.x *= -1
		facing = 1
		
	if velocity.length() > 0.01:
		anim_tree['parameters/conditions/walk'] = true
		anim_tree['parameters/conditions/idle'] = false
		
	else:
		anim_tree['parameters/conditions/walk'] = false
		anim_tree['parameters/conditions/idle'] = true
	
	if Input.is_action_just_pressed("attack") and Val == 1:
		anim_tree['parameters/conditions/attack'] = true
		anim_tree['parameters/conditions/jump'] = false
	else:
		anim_tree['parameters/conditions/attack'] = false
	
	if Input.is_action_pressed("Left"):
		self.position.x += -5;
		anim_tree['parameters/conditions/walk'] = true
		anim_tree['parameters/conditions/idle'] = false
		
	if Input.is_action_pressed("Right"):
		self.position.x += 5;
		anim_tree['parameters/conditions/walk'] = true
		anim_tree['parameters/conditions/idle'] = false
	

	move_and_slide()
	
func _physics_process(delta):
	if not can_control: return
	
	if not is_on_floor():
		anim_tree['parameters/conditions/jump'] = false
		velocity.y += gravity * delta #could turn this to 1 for faster gravity
	if Input.is_action_just_pressed("jump") and is_on_floor():
		#$AudioStreamPlayer2D.stream = sfx_jump
		anim_tree['parameters/conditions/jump'] = true
		velocity.y = JUMP_VELOCITY
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()

func _on_attack_region_body_entered(body: Node2D) -> void:
	body.on_attacked()

func handle_death() -> void:
	print("Player Died")
	visible = false
	can_control = false
	
	await get_tree().create_timer(1).timeout
	reset_player()

func reset_player() -> void:
	if can_control:
		return
	can_control=true
	transform=Transform2D(0,original_position)
	visible = true
	can_control = true
	
func climb_ladder() -> void:
	can_control = false
	await get_tree().create_timer(1.8).timeout
	climb()

func climb() -> void:
	if can_control:
		return
	can_control=true
	visible = true
	can_control = true

func Sword() -> void:
	Val += 1
	print(Val)
	
