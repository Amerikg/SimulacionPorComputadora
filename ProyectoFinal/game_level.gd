extends Node3D

var total_papers = 7
var papers_collected = 0

@onready var score_label = $CanvasLayer/Control/Label
var paper_scene = preload("res://paper.tscn")
var can_scene = preload("res://cans.tscn")

func _ready():
	score_label.text = str(papers_collected) + "/" + str(total_papers)
	_spawn_papers()
	_spawn_cans()

func _spawn_papers():
	for i in range(total_papers):
		var paper_instance = paper_scene.instantiate()
		paper_instance.position = Vector3(randf() * 10, 1, randf() * 10) # Cambia las coordenadas según sea necesario
		add_child(paper_instance)
		paper_instance.connect("paper_collected", Callable(self, "_on_paper_collected"))

func _spawn_cans():
	var total_cans = total_papers / 2 # Por ejemplo, la mitad del número de papeles
	for i in range(int(total_cans)):
		var can_instance = can_scene.instantiate()
		can_instance.position = Vector3(randf() * 10, 1, randf() * 10) # Cambia las coordenadas según sea necesario
		add_child(can_instance)
		can_instance.connect("can_collected", Callable(self, "_on_can_collected"))

func _on_paper_collected():
	papers_collected += 1
	score_label.text = str(papers_collected) + "/" + str(total_papers)
	if papers_collected == total_papers:
		print("¡Todos los papeles recogidos!")

func _on_can_collected():
	papers_collected -= 1
	score_label.text = str(papers_collected) + "/" + str(total_papers)

