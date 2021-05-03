extends Node2D

export (PackedScene) var Mole

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screen_size
var margin = 50
var current_score = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().get_visible_rect().size
	$SpawnTime.start()
	$BgMusic.play()
	
func create_mole():
	randomize()
	var mole = Mole.instance()
	mole.position = Vector2(rand_range(margin, screen_size.x - margin), rand_range(margin+50, screen_size.y - margin))
	mole.connect("increase_score",self,"update_score")
	add_child(mole)

func update_score():
	var score_text = "Score: "
	$ViewportSize/Score.text = score_text + "%d " % current_score
	current_score += 1

func _on_SpawnTime_timeout():
	create_mole()


func _on_Back_pressed():
	Global.goto_scene("res://MainMenu.tscn")
