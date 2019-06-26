extends KinematicBody

var speed = 300
var gravity = -9.8
var Player

#Movement
var direction = Vector3()
var velocity = Vector3()
var reactTime = 100
var nextDirection = Vector3()
var nextDirectionTime = 0

#Ready
func _ready():
	Player = get_parent().get_node('Player')
	set_physics_process(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	#direction = Vector3(0,0,0)
	#X axis
	if Player.translation.x > self.translation.x and nextDirection.x != 1 :
		nextDirection.x +=1
		nextDirectionTime = OS.get_ticks_msec() + reactTime
	elif Player.translation.x < self.translation.x and nextDirection.x != -1:
		nextDirection.x -=1
		nextDirectionTime = OS.get_ticks_msec() + reactTime
	elif Player.translation.x == self.translation.x and nextDirection.x != 0:
		nextDirection.x = 0
		nextDirectionTime = OS.get_ticks_msec() + reactTime
	#Z axis
	if Player.translation.z > self.translation.z and nextDirection.z != 1 :
		nextDirection.z += 1
		nextDirectionTime = OS.get_ticks_msec() + reactTime
	elif Player.translation.z < self.translation.z and nextDirection.z != -1 :
		nextDirection.z -=1
		nextDirectionTime = OS.get_ticks_msec() + reactTime
	elif Player.translation.z == self.translation.z and nextDirection.z != 0:
		nextDirection.z = 0
		nextDirectionTime = OS.get_ticks_msec() + reactTime
	
	if OS.get_ticks_msec() > nextDirectionTime:
		direction = nextDirection
	
	direction = direction.normalized()
	direction = direction * speed * delta
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
#	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
#		velocity.y = 5
