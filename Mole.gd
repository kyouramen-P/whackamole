extends Area2D

signal increase_score

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Mole_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed: #&& event.button_index == BUTTON_LEFT
		#print("Click Detected in Area")
		emit_signal("increase_score")
		$Sound.play()
		$AnimatedSprite.hide()
		$CollisionShape2D.queue_free()

func _on_Sound_finished():
	queue_free()


func _on_Dissapear_timeout():
	queue_free()
