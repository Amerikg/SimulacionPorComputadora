extends Area3D

signal paper_collected

func _on_body_entered(body):
	if body.name == "Player":
		emit_signal("paper_collected")
		queue_free()
