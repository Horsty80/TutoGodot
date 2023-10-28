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
	$UI.update_laser_text()

func _on_player_shoot_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
#	var laser = laser_scene.instantiate()
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()
	
