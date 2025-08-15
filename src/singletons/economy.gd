extends Node
class_name Economy

var force_gold:float = 0
var force_gold_timer:float = 0
var players:int = 1

signal force_gold_tick(team_share:float)

func start(players_count:int):
    players = players_count

func add_force_gold(amount:float):
    force_gold += amount

func _process(delta:float) -> void:
    force_gold_timer += delta
    if force_gold_timer >= Balance.balance.force_gold_period:
        force_gold_timer = 0
        var share = calc_team_share(force_gold)
        force_gold = 0
        emit_signal("force_gold_tick", share)

func calc_team_share(amount:float) -> float:
    var f = Balance.balance.force_gold_formula
    return amount * f.factor / (players * f.player_mult + f.base)

func passive_income_per_sec() -> float:
    var p = Balance.balance.passive_income
    return p.base / (players * p.player_mult + p.add)
