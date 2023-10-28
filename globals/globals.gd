extends Node

signal state_change

var laser_amount = 50:
	get:
		return laser_amount
	set(value):
		laser_amount = value
		state_change.emit()

var grenade_amount = 3:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		state_change.emit()

var health = 60:
	get:
		return health
	set(value):
		health = value
		state_change.emit()
