extends CharacterBody2D


@export var speed: float = 600.0
@export var jump_velocity: float = -200.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar  = $HealthBar

var animation_locked: bool = false
var direction: Vector2 = Vector2.ZERO

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += 1 * delta

		
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	move_and_slide()
	update_animation()
	update_facing_direction()
	
func update_animation():
	if not animation_locked:
		if direction.x != 0 || direction.y !=0:
			animated_sprite.play("fla_run")
		else:
			animated_sprite.play("fla_idle")
		

func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
		
		
#falta fazer basicamente tudo nessa funcao
func hurt(damage : float):
	health_bar.value -= damage
