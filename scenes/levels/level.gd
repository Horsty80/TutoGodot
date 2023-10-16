extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
	
func _on_player_shoot_lazer(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	# 3. I want to add the laser instance to a Node2D
	$Projectiles.add_child(laser)

func _on_player_shoot_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
#	var laser = laser_scene.instantiate()
	$Projectiles.add_child(grenade)

func _on_house_body_entered(_body):
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.set_loops()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1)
	tween.tween_property($Player/Camera2D, "modulate:a",0, 2)

func _on_house_body_exited(_body):
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6,0.6), 2)
