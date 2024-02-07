extends Path2D

@onready var pathfallow = $PathFollow2D
@onready var enemy= $PathFollow2D/Enemy1

# Called when the node enters the scene tree for the first time.
func _ready():
	pathfallow.progress_ratio = 1
	#or
	#pathfallow.set_progress_ratio(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	pathfallow.progress_ratio -= 0.12 * delta
	if pathfallow.progress_ratio <= 0:
		queue_free()
		
