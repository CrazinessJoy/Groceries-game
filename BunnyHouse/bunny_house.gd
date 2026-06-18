extends Node2D

var interacted = false

func start():
	$Ray.start($CounterPosition.position)
	show()

# Trigger a cutscene of Ray-Ray asking Bunny to do the groceries 
# while she fixes the cabinet doors. Bunny happily agrees, and a pop-up or something appears
# telling the player how to access the grocery list (thinking of putting a list icon in the corner to click on)
# And then it goes back to the regular scene,
# Ray-Ray follows the CabinetDoorsPath to go the CabinetDoors and stands over there.
# If Bunny interacts with him again she tells her he's busy right now.
func interact_ray():
	# add an if statement here so he doesn't keep repeating scene1
	if !interacted:
		$Ray/Interactable.is_interactable = false
		await $"../Cutscenes".scene1()
		$GroceryList/Interactable/CollisionShape2D.disabled = false
		
		# Move Ray-Ray along CabinetDoorsPath here
		
		$CabinetDoorsPath/PathFollow2D/RemoteTransform2D.update_position = true
		interacted = true

		# When Ray-Ray has finished moving, renable interaction. Also enable leaving the house
		# This is done in physics_process
	else:
		await $"../Cutscenes".cabinets()

func grocery_list():
	get_parent().list_activate()

# Called when the node enters the scene tree for the first time.
func _ready():
	$CabinetDoorsPath/PathFollow2D/RemoteTransform2D.remote_path = "../Ray"
	start()
	
func _physics_process(delta):
	if interacted:
		$CabinetDoorsPath/PathFollow2D.progress += $Ray.speed * delta
		$Ray.global_position = $CabinetDoorsPath/PathFollow2D.global_position
		print($Ray/Interactable.is_interactable)
		if($CabinetDoorsPath/PathFollow2D.progress_ratio == 1.0):
			print("its true")
			$Ray/Interactable.is_interactable = true
			set_physics_process(false)
