extends CharacterBody2D

var speed = 600

func _ready():
	velocity = Vector2.ZERO
	velocity.y= 1

func _physics_process(delta):
	move_and_slide()
	#var collision = move_and_collide(velocity * speed * delta)
	#if collision:
	#	var reflect = collision.remainder.bounce(collision.normal)
	#	velocity = velocity.bounce(collision.normal)
	#	move_and_collide(reflect)
