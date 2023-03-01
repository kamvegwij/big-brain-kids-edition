extends Node2D

var names: Array = ["zebra", "lion","giraffe", "turtle", "crocodile", "hippo"]
var names_shown: Array = [""]

var index_of_arr: int = 0

var score: int = 0
var max_ind: int = 5
var random = RandomNumberGenerator.new()

var correct: bool = false

func _ready():
	random.randomize()
	$Timer.start(5)
	
	$guessHeader.text = "Click on the:"
	index_of_arr = random.randi_range(0, max_ind)
	$guessName.text = names[index_of_arr].to_upper()
	
func _process(_delta):
	$scoreText.text = str(score)
	$timeLabel.text = str(round($Timer.time_left))
	if score == 6:
		get_tree().change_scene("res://scenes/LevelDone.tscn")

func _on_Timer_timeout():
	index_of_arr = random.randi_range(0, max_ind)
	print(names)
	$guessHeader.text = "Click on the:"
	$guessName.text = names[index_of_arr].to_upper()
	correct = false
	
func handle_Choice(i, sline):
	if names[index_of_arr] == i:
		score += 1
		sline.visible = true
		correct = true
		max_ind -= 1
		names.remove(index_of_arr)

func _on_zebra_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		handle_Choice("zebra", $nameplacer/zebra/text)
		$nameplacer/zebra/CollisionShape2D.disabled = true


func _on_lion_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		handle_Choice("lion", $nameplacer/lion/text)
		$nameplacer/lion/CollisionShape2D.disabled = true


func _on_giraffe_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		handle_Choice("giraffe", $nameplacer/giraffe/text)
		$nameplacer/giraffe/CollisionShape2D.disabled = true

func _on_turtle_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		handle_Choice("turtle", $nameplacer/turtle/text)
		$nameplacer/turtle/CollisionShape2D.disabled = true

func _on_croc_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		handle_Choice("crocodile", $nameplacer/croc/text)
		$nameplacer/croc/CollisionShape2D.disabled = true


func _on_hippo_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		handle_Choice("hippo", $nameplacer/hippo/text)
		$nameplacer/hippo/CollisionShape2D.disabled = true
