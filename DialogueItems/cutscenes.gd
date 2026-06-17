extends CanvasLayer

@onready var button = $DialogueItems/MarginContainer/Button
@onready var speaker = $DialogueItems/MarginContainer/Name
@onready var dialogue = $DialogueItems/MarginContainer/Dialogue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Bunny.hide()
	$Ray.hide()
	$DialogueItems.hide()

func scene1():
	bunny('default')
	ray('speak')
	set_left($Bunny)
	set_right($Ray)
	$DialogueItems.show()
	get_parent().process_mode = Node.PROCESS_MODE_DISABLED
	speaker.text = 'Ray-Ray'
	dialogue.text = "Bunny, I'm going to try to fix the cabinet doors today. Do you think you can go grocery shopping?"
	await button.pressed
	$Ray.animation = 'default'
	$Bunny.animation = 'happy'
	speaker.text = 'Bunny'
	dialogue.text = 'Yep! You can count on me!'
	await button.pressed
	$Ray.animation = 'speak'
	$Bunny.animation = 'default'
	speaker.text = 'Ray-Ray'
	dialogue.text = 'Thanks. I left the grocery list on the fridge.'
	await button.pressed
	get_parent().process_mode = Node.PROCESS_MODE_INHERIT
	$DialogueItems.hide()
	$Bunny.hide()
	$Ray.hide()

func bunny(anim: String):
	$Bunny.animation = anim
	$Bunny.play()
	$Bunny.show()

func ray(anim: String):
	$Ray.animation = anim
	$Ray.play()
	$Ray.show()

func set_left(chara: Node2D):
	chara.position = $Left.position
	chara.flip_h = false

func set_right(chara: Node2D):
	chara.position = $Right.position
	chara.flip_h = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
