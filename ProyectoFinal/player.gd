extends CharacterBody3D

var speed = 10.0
var direction = Vector3.ZERO
var paper_count = 0
var can_count = 0

func _input(event):
	if event.is_action_pressed("ui_right"):
		direction.x = 1
	elif event.is_action_pressed("ui_left"):
		direction.x = -1
	elif event.is_action_pressed("ui_up"):
		direction.z = -1
	elif event.is_action_pressed("ui_down"):
		direction.z = 1
	else:
		direction = Vector3.ZERO

func _physics_process(delta):
	var movement = Vector3.ZERO
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
	if Input.is_action_pressed("ui_left"):
		movement.x -= 1
	if Input.is_action_pressed("ui_up"):
		movement.z -= 1
	if Input.is_action_pressed("ui_down"):
		movement.z += 1
	
	if movement != Vector3.ZERO:
		movement = movement.normalized() * speed
		velocity = movement
		move_and_slide()
	
	$Camera_Controller.position = lerp($Camera_Controller.position, position, 0.5)

func _on_PaperArea_body_entered(body):
	if body.name == "Paper":
		paper_count += 1
		update_paper_counter()
		body.queue_free()

func _on_CanArea_body_entered(body):
	if body.name == "Can":
		can_count -= 1
		update_can_counter()
		body.queue_free()

func update_paper_counter():
	$contador.text = "Papeles recolectados: " + str(paper_count)

func update_can_counter():
	$contador.text = "Latas recolectadas: " + str(can_count)
