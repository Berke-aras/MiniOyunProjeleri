extends RigidBody2D
var force = 800


# Called when the node enters the scene tree for the first time.
func _ready():
	print(force)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(Engine.get_frames_per_second())
	pass

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(force, 0)) 
	if Input.is_action_pressed("move_left"):
		apply_force(Vector2(-force, 0)) 
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2(0, -force)) 
	if Input.is_action_pressed("move_down"):
		apply_force(Vector2(0, force)) 
	





	#test()
	#print(test2(10))

var result #null
var pl = "PLAYER"
var my_int = 12
var my_bool = true


func test():
	print(pl)


func test2(input_number):
	result = (input_number * 2)
	return result
	
