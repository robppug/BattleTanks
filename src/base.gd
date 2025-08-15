extends Node3D
class_name Base

var team_id:int

func spawn_tank(tank_id:String) -> Tank:
    var data = null
    for t in Balance.tanks:
        if t.id == tank_id:
            data = t
            break
    if data == null:
        return null
    var tank = Tank.new()
    tank.id = tank_id
    add_child(tank)
    return tank
