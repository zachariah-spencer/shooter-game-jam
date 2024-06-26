extends ProjectileSpawner

var number_projectiles := 8
var projectiles_to_fire := 0
var projectile_space := 0.02
var _direction := Vector2.RIGHT
var _rot := 0.0

func fire(offset):
	self.offset = offset
	if !$FireTimer.is_stopped():
		return
	else:
		projectiles_to_fire = number_projectiles
		$FireTimer.start()
		_fire()

func _fire() :
	if projectiles_to_fire > 0 :
		_add_projectile((player.global_position - global_position).normalized(), projectile, offset)
		projectiles_to_fire -= 1
		$DelayTimer.start(projectile_space)

func _add_projectile(direction, proj := projectile, off := offset, t := type):
	_rot += PI/4
	var to_add = proj.instance()
	to_add.speed = speed
	to_add.type = t
	to_add.direction = _direction.rotated(_rot)
	to_add.position = global_position + off*to_add.direction
	$Node.add_child(to_add)