extends Node3D
class_name Tower

var range:float = 600.0
var target:Node3D

func select_target(candidates:Array) -> void:
    var closest = null
    var dist = INF
    for c in candidates:
        var d = global_position.distance_to(c.global_position)
        if d < dist and d <= range:
            dist = d
            closest = c
    target = closest
