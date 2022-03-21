extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var velocitat_de_salt = -550

var gravetat = Vector2.DOWN*980

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat*delta
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed ("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
		
	if Input.is_action_just_pressed("mou adalt") and is_on_floor():
		velocitat.y = velocitat_de_salt
	if Input.is_action_just_pressed("mou adalt") and is_on_wall():
		velocitat.y = velocitat_de_salt
		
	velocitat = move_and_slide(velocitat, Vector2.UP)
