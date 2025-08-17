extends Node3D
class_name Projectile

var velocity:Vector3
var lifespan:float = 5.0

func _physics_process(delta:float) -> void:
    translate(velocity * delta)
    lifespan -= delta
    if lifespan <= 0:
        queue_free()
