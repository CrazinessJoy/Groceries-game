extends Node2D

const JUMP_VELOCITY = -350.0
var speed = 200
var jump_speed = -850
var gravity = 2500
var screen_size
var velocity = Vector2.ZERO
var being_moved_by_path = false
var last_position = Vector2.ZERO

func _ready():
	velocity = Vector2.ZERO
	hide()

func _process(delta):
	velocity = (global_position - last_position) / delta
	last_position = global_position
	var new_anim = "idle"
	
	if abs(velocity.y) < 20: # The PathFollow creates jitters that Ray registers as micro-jumps
		velocity.y = 0

	if velocity.x > 0:
		new_anim = "walk_right"
		if velocity.y < 0:
			new_anim = "jump_horiz_right"
	elif velocity.x < 0:
		new_anim = "walk_left"
		if velocity.y < 0:
			new_anim = "jump_horiz_left"
	elif velocity.y < 0:
		new_anim = "jump_vert"
		
	elif velocity.y > 0:
		new_anim = "fall"
		
	if $AnimatedSprite2D.animation != new_anim:  # Checks if the animation has changed every second so it doesn't keep playing the first frame from reassignment every frame
		$AnimatedSprite2D.play(new_anim)

func interact(): 
	await get_parent().interact_ray()
	
func start(pos):
	position = pos
	show()
