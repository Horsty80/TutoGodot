extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
signal shoot_lazer(pos, direction)
signal shoot_grenade(pos, direction)

@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * speed
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()

	if Input.is_action_pressed("primary action") and can_laser:
		$GPUParticles2D.emitting = true
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$Laser.start()
		# emit the position we selected
		shoot_lazer.emit(selected_laser.global_position, player_direction)
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		var grenade_markers =  $LaserStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		can_grenade = false
		$Grenade.start()
		shoot_grenade.emit(selected_grenade.global_position, player_direction)

func _on_laser_timeout():
	can_laser = true


func _on_grenade_timeout():
	can_grenade = true
