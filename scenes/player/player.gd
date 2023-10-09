extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()

	if Input.is_action_pressed("primary action") and can_laser:
		can_laser = false
		print("should laser")
		$Timer.start()
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		print("should grenade")
		$GrenadeReloadTimer.start()


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
