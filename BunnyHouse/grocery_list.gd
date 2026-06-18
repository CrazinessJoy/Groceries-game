extends TextureRect

func interact():
	$".".hide()
	$Interactable/CollisionShape2D.disabled = true
	get_parent().grocery_list()
