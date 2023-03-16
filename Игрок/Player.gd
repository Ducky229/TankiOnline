extends CharacterBody2D

@export var speed = 100
@export var rotation_speed = 2

var rotation_direction

var bullet = preload("res://Игрок/bullet.tscn")

var can_fire = 5

func _process(_delta):
	if Input.is_action_just_pressed("move_fire") && (can_fire >= 1):
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = get_position()
		bullet_instance.rotation = get_global_rotation()
		get_parent().add_child(bullet_instance)
		can_fire-=1
	if (can_fire < 5):
		await get_tree().create_timer(2).timeout
		can_fire+=1
		pass

func _physics_process(delta):
	rotation_direction = Input.get_axis("move_left", "move_right")
	velocity = transform.x * Input.get_axis("move_down", "move_up") * speed
	rotation += rotation_direction * rotation_speed * delta
	if (velocity!=Vector2.ZERO) || (rotation_direction!=0):
		get_node("AnimatedSprite2D").play("go")
	if (velocity==Vector2.ZERO) && (rotation_direction==0):
		get_node("AnimatedSprite2D").play("idle")
	move_and_slide()
