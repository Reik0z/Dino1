extends KinematicBody2D

export (int) var speed = 100
export (int) var gravity = 100
var velocity =  Vector2()
var jumping = false


func _physics_process(delta):
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	
	if right:
		velocity.x += 1
	if left:
		velocity.x -= 1

	velocity.y += gravity * delta
	velocity = velocity.normalized()
	velocity.x *= 2
	
	var jump = Input.is_action_just_pressed("jump")
	
	if jump and is_on_floor():
		velocity.y = -10
		$AnimationPlayer.play("jump")
	
	if jumping and is_on_floor():
		jumping = false
	
	move_and_slide(velocity * speed, Vector2(0,-1))
	
	if abs(velocity.x) < 0.05:
		$AnimationPlayer.play("idle")
	else:
		if velocity.x > 0:
			$AnimationPlayer.play("walk")
		elif velocity.x < 0:
			$Sprite.flip_h = true
			$AnimationPlayer.play("walk")
