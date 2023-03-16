extends CharacterBody2D

@export var speed = 600

func _ready():
	velocity = Vector2.ZERO
	velocity.x= -speed # Why?

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
	if (collision_info==$CharacterBody2D):
		#queue_free()
		pass
	await get_tree().create_timer(5).timeout
	queue_free()
	
