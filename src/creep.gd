extends Node3D
class_name Creep

signal died(killer_id:int)

var id:String
var hp:float
var bounty:float

func setup(data:Dictionary) -> void:
    for k in data.keys():
        set(k, data[k])

func take_damage(amount:float, killer_id:int) -> void:
    hp -= amount
    if hp <= 0:
        emit_signal("died", killer_id)
        queue_free()
