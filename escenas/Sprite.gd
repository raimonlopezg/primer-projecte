extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocitat = Vector2 (-250,-180)
export var velocitat_deg = (-180)
var direccio = Vector2(0,0)
var modulate_inicial = Color (1,1,1)
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(450,330)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direccio = Vector2.ZERO
	if Input.is_action_pressed("mou dreta"):
		direccio += Vector2.LEFT 
	if Input.is_action_pressed("mou esquerra"):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("mou adalt"):
		direccio += Vector2.DOWN
	if Input.is_action_pressed("mou abaix"):
		direccio += Vector2.UP 
	
		
	position += direccio.normalized() * velocitat * delta
	
func _on_player_area_entered(area):
	area.modulate = Color (1,1,1)
	
	if area.is_in_group('Final'):
		modulate = Color (0,1,0)
	elif area.is_in_group('Inici'):
		modulate = Color (1,0,0)

func _on_player_area_exited(area):
	modulate = Color (1,1,1)
	area.modulate = modulate_inicial

