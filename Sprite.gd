extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocitat = Vector2 (-250,-180)
export var velocitat_deg = (-180)
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(450,330)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocitat * delta
	rotation_degrees += velocitat_deg * delta
	
	if position.x >= 1024 or position.x <= 0 :
		velocitat.x *= -1
	if position.y >= 600 :
		position.y = 600
		velocitat.y *= -1
	if position.y <= 0:
		position.y = 0
		velocitat.y *= -1
