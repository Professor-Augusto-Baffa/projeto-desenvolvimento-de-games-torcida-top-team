extends CharacterBody2D

@export var speed: float = 600.0
@export var jump_velocity: float = 300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar = $HealthBar

var animation_locked: bool = false
var direction: Vector2 = Vector2.ZERO
var attack_duration: float = 0.5  # Duração da animação de ataque em segundos
var attack_timer: float = 0.0

var jump_duration: float = 0.5  # Duração da animação de ataque em segundos
var jump_timer: float = 0.0

func _physics_process(delta):
	if attack_timer > 0:
		attack_timer -= delta
		if attack_timer <= 0:
			animation_locked = false
	if jump_timer > 0:
		jump_timer -= delta
		if jump_timer <= 0:
			animation_locked = false
	if not is_on_floor():
		velocity.y += 1 * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if direction and not animation_locked:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	if Input.is_action_just_pressed("jump") and  not animation_locked:
		velocity.y = jump_velocity
		animated_sprite.play("fla_jump")
		jump()
		animation_locked = true
		jump_timer = jump_duration
		

	if Input.is_action_just_pressed("attack") and not animation_locked:
		animated_sprite.play("fla_punch")
		attack()
		animation_locked = true
		attack_timer = attack_duration

	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	if not animation_locked:
		if direction.x != 0 or direction.y != 0:
			animated_sprite.play("fla_run")
		else:
			animated_sprite.play("fla_idle")

func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true

func hurt(damage: float):
	health_bar.value -= damage

func heal(amount: float):
	health_bar.value += amount
	if health_bar.value > health_bar.max_value:
		health_bar.value = health_bar.max_value
	
func jump():
	# Lógica para o ataque
	print("Pulo realizado!")
	
func attack():
	# Lógica para o ataque
	print("Ataque realizado!")
