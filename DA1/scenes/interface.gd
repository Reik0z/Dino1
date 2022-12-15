extends Control

onready var player = get_parent().get_node("Player")


func _process(delta):
	$VBoxContainer/X/posx.text = player.velocity.x as String
	$VBoxContainer/Y/posy.text = player.velocity.y as String
