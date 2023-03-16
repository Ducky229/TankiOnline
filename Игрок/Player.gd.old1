extends CharacterBody2D

@export var speed = 100
@export var rotation_speed = 2

var rotation_direction = 0

var bullet = preload("res://Игрок/bullet.tscn")

func _process(_delta):
	Fire()
func Fire():
	if Input.is_action_pressed("move_fire"):
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = $M.position
		bullet_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(bullet_instance)

func get_input():
	rotation_direction = Input.get_axis("move_left", "move_right")
	velocity = transform.x * Input.get_axis("move_down", "move_up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
