extends Area2D


func _on_body_shape_entered(body_rst: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	if body.name != "BEUPlayer":
		body.queue_free()
		
