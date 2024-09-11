extends CharacterBody2D

const FRICTION = 30
const SPEED = 400
const ACCELERATION = 100

@export var bullet_resource = preload("res://bullet.tscn")
var input_vector = Vector2.ZERO

func _physics_process(delta: float) -> void:
	movement(delta, SPEED)
	shoot()
	
func movement(delta, speed):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * speed, FRICTION * delta)
		velocity = velocity.limit_length(speed * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	move_and_collide(velocity)	
	move_and_slide()

func shoot():
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_resource.instantiate()
		add_child(bullet)
		bullet.global_position = self.position + Vector2(0, -45)
	
	
	
