extends KinematicBody2D

export (int) var SPEED = 100
export (int) var GRAVITY = 30
export (int) var JUMP_IMPULSE = 4
export (int) var WALK_SPEED = 2
var velocity =  Vector2()
var jumping = false


func _physics_process(delta):
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_just_pressed("jump")
	
	velocity.y += GRAVITY * delta
	
	if right:
		velocity.x = WALK_SPEED
	elif left:
		velocity.x = -WALK_SPEED
	else:
		velocity.x = 0

	if is_on_floor():
		velocity.y = 0
	
	if jump and is_on_floor():
		velocity.y = -JUMP_IMPULSE
		$AnimationPlayer.play("jump")
	
	if jumping and is_on_floor():
		jumping = false
	
	move_and_slide(velocity * SPEED, Vector2(0,-1))
	
	if abs(velocity.x) < 0.1:
		$AnimationPlayer.play("idle")
	else:
		if velocity.x > 0:
			$Sprite.scale.x = 1
			$AnimationPlayer.play("walk")
		elif velocity.x < 0:
			$Sprite.scale.x = -1
			$AnimationPlayer.play("walk")
