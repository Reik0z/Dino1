extends Control

onready var player = get_parent().get_node("Player")


func _process(delta):
	$VBoxContainer/X/posx.text = player.velocity.x as String
	$VBoxContainer/Y/posy.text = player.velocity.y as String
	
	$VBoxContainer/HBoxContainer/framespersecond.text = Engine.get_frames_per_second() as String
	
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")
	var A = Input.is_action_pressed("jump")
	var X = Input.is_action_pressed("action")
	
	if A:
		$VBoxContainer/Button.frame =  1
	else:
		$VBoxContainer/Button.frame = 0
	
	if X:
		$VBoxContainer/Button2.frame = 7
	else:
		$VBoxContainer/Button2.frame = 6
		
	if left:
		$VBoxContainer/Button3.frame = 10
	else:
		$VBoxContainer/Button3.frame = 9
		
	if right:
		$VBoxContainer/Button4.frame = 4
	else:
		$VBoxContainer/Button4.frame = 3
		
