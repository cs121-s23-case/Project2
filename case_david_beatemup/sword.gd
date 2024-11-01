extends Area2D
var Val = 0


func _on_body_entered(body):
	if body is Player:
		body.Sword()
