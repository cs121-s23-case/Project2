extends CharacterBody2D
var health = 5
@onready var health_bar = $ProgressBar
func _ready():
	pass
	
func hit(hit_dir):
	self.velocity = hit_dir.normalized() * 100
	health -= 1
	health_bar.value = health
	print(health)
	if health <= 0:
		self.queue_free()

func _process(delta):
	velocity *= .9
	move_and_slide()
	pass
