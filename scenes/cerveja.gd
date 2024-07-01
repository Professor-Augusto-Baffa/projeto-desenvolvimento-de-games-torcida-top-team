extends RigidBody2D

@export var health_increase: int = 10

func _ready():
	connect("body_entered", Callable(self,"_on_body_entered"))

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.heal(health_increase)
		queue_free()
		
		
