extends Node2D

# The InteractRange scans Collision layer 2 (the Interact layer) for Area2Ds. 
# If an Area2D enters the InteractRange collision area, then that means an Interactable is within range

var current_interactions := []
var can_interact:= true

func _input(event):
	if event.is_action_pressed("interact") and can_interact:
		if current_interactions:
			can_interact = false
			$InteractIcon.hide()
			$InteractTimer.start()
			await current_interactions[0].interact.call()
			$InteractLabel.show()
			await $InteractTimer.timeout
			$InteractLabel.hide()
			can_interact = true

func _process(_delta: float): 
	if current_interactions and can_interact:
		$InteractIcon.show()
	else:
		$InteractIcon.hide()

func _on_interact_range_area_entered(area: Area2D) -> void:
	current_interactions.push_back(area)
	current_interactions.sort_custom(_sort_by_nearest)

func _on_interact_range_area_exited(area: Area2D) -> void:
	current_interactions.erase(area)

func _sort_by_nearest(area1, area2):
	var area1_dist = global_position.distance_to(area1.global_position)
	var area2_dist = global_position.distance_to(area2.global_position)
	return area1_dist < area2_dist
	
