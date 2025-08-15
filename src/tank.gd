extends Node3D
class_name Tank

signal gold_gain(amount:float)
signal xp_gain(amount:float)

var id:String
var weapons:Array = []
var items:Array = []
var gold:float = 0
var xp:float = 0

func add_weapon(weapon_id:String) -> void:
    for w in Balance.weapons:
        if w.id == weapon_id:
            var inst = Weapon.new()
            inst.setup(w)
            add_child(inst)
            weapons.append(inst)
            return

func gain_gold(amount:float) -> void:
    gold += amount
    Game.update_bounty_on_gold(get_instance_id(), amount)
    emit_signal("gold_gain", amount)

func gain_xp(amount:float) -> void:
    xp += amount
    emit_signal("xp_gain", amount)
