extends Area2D

@export var interact_name: String = ""
@export var is_interactable: bool = true

# This node only works when instanced under the interactable object
# It lives on Collision Layer 2 (the Interact layer)
# It has no Collision Shape by default because every interactable should have different interact ranges
# due to their different sizes. In other words, the shape needs to be created
# and defined in the actual interactable's scene

func interact():
	await get_parent().interact()   # call the parent’s unique interaction
