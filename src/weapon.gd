extends Node
class_name Weapon

var id:String
var name:String
var cost:float
var range:float
var refire_time:float
var projectile_speed:float
var damage_factor:float
var target_masks:Array
var aoe:float
var special_fx:String

func setup(data:Dictionary) -> void:
    for k in data.keys():
        self.set(k, data[k])

func fire_rate() -> float:
    return 1.0 / refire_time

func dps() -> float:
    return (4 * cost * fire_rate() * damage_factor) / (0.06 * range)
