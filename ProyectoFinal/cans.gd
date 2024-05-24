extends Area3D

signal can_collected

func _on_body_entered(body):
	if body.name == "Player":
		emit_signal("can_collected")
		queue_free()
