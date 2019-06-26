extends Navigation

#Navigation
var path
var startPosition = Vector3()
var endPosition = Vector3()
var Player
# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_parent().get_node('Player')
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	startPosition = get_parent().get_node('Enemy').translation
	endPosition = Player.translation
	#navmesh_add(get_parent().get_node('Wall').get_child(0),[0,0])
	path = get_simple_path(startPosition, endPosition, true)
	print(startPosition)
	print(endPosition)
	print(Navigation)
	print(path)
	path = Array(path)
	path.invert()
	print(path)
	set_process(false)
