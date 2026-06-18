extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GameHUD/MarginContainer/ListButton.hide()
	$Bunny/Camera2D.enabled = false
	$BunnyHouse.hide()
	$mainHUD._ready()

func new_game():
	$MainScreen.hide()
	$mainHUD.hide()
	$BunnyHouse.start()
	$Bunny/Camera2D.enabled = true
	$Bunny.start($BunnyHouse/EnterPosition.position)

func list_activate():
	$GameHUD/MarginContainer/ListButton.show()
