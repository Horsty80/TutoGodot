extends StaticBody2D
class_name ItemContainer

# before ready()
@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
var opened: bool = false
signal open(pos, direction)

# ready:
# applying rotation
# creating the node
