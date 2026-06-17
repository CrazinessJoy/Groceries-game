extends Node2D

var interact_label
var interacted = false

func start():
	$Bunny.start($EnterPosition.position)
	$Ray.start($CounterPosition.position)
	interact_label = $Bunny/InteractingComponent/InteractIcon
	$Bunny/Camera2D.enabled = true
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
		$Cutscenes.scene1()
		$GroceryList/Interactable/CollisionShape2D.disabled = false
		interacted = true
		# Move Ray-Ray along CabinetDoorsPath here

# Called when the node enters the scene tree for the first time.
func _ready():
	start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
