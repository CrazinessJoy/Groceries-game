extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BunnyHouse/Bunny/Camera2D.enabled = false
	$BunnyHouse.hide()
	$mainHUD._ready()

func new_game():
	$MainScreen.hide()
	$mainHUD.hide()
	$BunnyHouse.start()
