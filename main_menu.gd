extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BunnyHouse.hide()
	$mainHUD._ready()

func new_game():
	$BunnyHouse.start()
