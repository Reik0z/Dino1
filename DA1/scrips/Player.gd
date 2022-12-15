extends KinematicBody2D

var speed = 100
var gravity = 1200
var velocity: Vector2

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("action"):
		$AnimationPlayer.play("kick")

	velocity = velocity.normalized()
	
	if velocity == Vector2.ZERO:
		$AnimationPlayer.play("idle")
	else:
		if velocity.x > 0:
			$AnimationPlayer.play("walk")
		elif velocity.x < 0:
			$Sprite.flip_h = true
			$AnimationPlayer.play("walk")
		if velocity.y < 0:
			$AnimationPlayer.play("jump")
		elif velocity.y > 0:
			$AnimationPlayer.play("fall")
		
	move_and_slide(velocity * speed)
