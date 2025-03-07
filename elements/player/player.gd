class_name Player
extends CharacterBody2D

const SPEED = 200.0

@onready var sprite = $AnimatedSprite2D
@onready var int_label = $Interact_label
@onready var ray = $RayCast2D


func _ready():
	int_label.hide()


func _physics_process(_delta):
	if ray.is_colliding() and ray.get_collider() != null and ray.get_collider().has_method("use"):
		int_label.show()
		if Input.is_action_pressed("use_action"):
			ray.get_collider().use()
	else:
		int_label.hide()		
	var direction := Vector2(0,0)
	if Input.is_action_pressed("move_up"):
		ray.target_position = Vector2(0, -15)
		sprite.play("up")
		direction.y = -1
	if Input.is_action_pressed("move_down"):
		ray.target_position = Vector2(0, 15)
		sprite.play("down")
		direction.y = 1
	if Input.is_action_pressed("move_left"):
		ray.target_position = Vector2(-15, 0)
		sprite.play("left_right")
		sprite.flip_h = true
		direction.x = -1
	if Input.is_action_pressed("move_right"):
		ray.target_position = Vector2(15, 0)
		sprite.play("left_right")
		sprite.flip_h = false
		direction.x = 1
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
	

func random_tp()-> void:
	ray.target_position = Vector2(randi_range(-100, 100), randi_range(-100, 100))
	while ray.is_colliding():
		ray.rotation_degrees += 15
		if ray.rotation_degrees >= 360:
			return	
	self.global_position += ray.target_position
		
		
