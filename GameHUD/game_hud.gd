extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ToDoList.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Pause the game, bring up a sprite2D? with Labels on it that detail the objectives
func _on_to_do_list_pressed() -> void:
	$ToDoList.show()
	get_parent().process_mode = Node.PROCESS_MODE_DISABLED

func set_text(words: String):
	$ToDoList/HBoxContainer/Label.text += "\n" + words

func _on_texture_button_pressed() -> void:
	$ToDoList.hide()
	get_parent().process_mode = Node.PROCESS_MODE_INHERIT
