extends CharacterBody2D

@export var SPEED : int = 100
@export var GRAVITY : int = 30
@export var JUMP_IMPULSE : float = 4.5
@export var WALK_SPEED : int = 2
var vel =  Vector2()
var jumping = false


func _physics_process(delta):
	var _right = Input.is_action_pressed("right")
	var _left = Input.is_action_pressed("left")
	var _jump = Input.is_action_just_pressed("jump")
	
	vel.y += GRAVITY * delta
	
	if _right:
		vel.x = WALK_SPEED
	elif _left:
		vel.x = -WALK_SPEED
	else:
		vel.x = 0

	if is_on_floor():
		vel.y = 0
	
	if _jump and is_on_floor():
		vel.y = -JUMP_IMPULSE
		$AnimationPlayer.play("jump")
	
	if jumping and is_on_floor():
		jumping = false
	
	set_velocity(vel * SPEED)
	set_up_direction(Vector2(0,-1))
	move_and_slide()
	
	if abs(vel.x) < 0.1:
		$AnimationPlayer.play("idle")
	else:
		if vel.x > 0:
			$Sprite2D.scale.x = 1
			$AnimationPlayer.play("walk")
		elif vel.x < 0:
			$Sprite2D.scale.x = -1
			$AnimationPlayer.play("walk")

func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()
