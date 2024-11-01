extends CharacterBody2D
var health = 1

func _physics_process(delta):
	velocity *= .9
	
	move_and_slide()
	
func on_attacked():
	$Saved.visible = false
	$Why.visible = true
	await get_tree().create_timer(2).timeout
	health -= 1
	print(health)
	if health <= 0:
		self.queue_free()
