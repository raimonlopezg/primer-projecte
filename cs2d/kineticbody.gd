extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var velocitat_de_salt = -550
var posicio = position 
var gravetat = Vector2.DOWN*980

func _physics_process(delta):

#	$AnimatedSprite.play('default')
	velocitat.x = 200
	velocitat += gravetat*delta

#	if Input.is_action_pressed("mou dreta"):
#		velocitat += Vector2.RIGHT * velocitat_base
#	if Input.is_action_pressed ("mou esquerra"):
#		velocitat += Vector2.LEFT * velocitat_base

	if Input.is_action_just_pressed("mou adalt") :

		velocitat.y = velocitat_de_salt
		
	velocitat = move_and_slide(velocitat, Vector2.UP)

func _on_restart_body_entered(body):
	if body.name == 'Flappy':
		get_tree().reload_current_scene()




func _on_meta_body_entered(body):
	if body.name == 'Flappy':
		get_tree().change_scene("res://flappy bird/escena final.tscn")
