extends Area2D

func _on_ShotPowerUp_body_entered(body):
	if body.name == "Player":
		Global.poweredF = true
		queue_free()


