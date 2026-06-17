extends Sprite2D

func interact():
	print("picked up grocery list")
	$".".hide()
	$Interactable/CollisionShape2D.disabled = true
