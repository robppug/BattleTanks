extends Node
class_name Game

signal gold_gain(player_id:int, amount:float)
signal xp_gain(player_id:int, amount:float)
signal assist(victim_id:int, assister_id:int, amount:float)
signal cp_capture(team_id:int, cp_id:int)

var players := {}

func register_player(id:int, tank_worth:float) -> void:
    var min_bounty = 125.0 + tank_worth / Balance.balance.bounty_min_factor
    players[id] = {
        "tank_worth": tank_worth,
        "bounty": min_bounty,
        "kill_spree": 0,
        "assist_spree": 0
    }

func update_bounty_on_gold(id:int, gold:float) -> void:
    if not players.has(id):
        return
    players[id].bounty += gold * 0.05
    _clamp_bounty(id)

func bounty_on_death(id:int) -> void:
    if not players.has(id):
        return
    players[id].bounty *= 0.88
    _clamp_bounty(id)
    players[id].kill_spree = 0
    players[id].assist_spree = 0

func _clamp_bounty(id:int) -> void:
    var worth = players[id].tank_worth
    var min_bounty = 125.0 + worth / Balance.balance.bounty_min_factor
    var max_bounty = 125.0 + worth / Balance.balance.bounty_max_factor
    players[id].bounty = clamp(players[id].bounty, min_bounty, max_bounty)

func assist_gold(victim_bounty:float, num_assisters:int) -> float:
    return (1.5 * victim_bounty / (7 - num_assisters)) / num_assisters

func spree_bonus(spree:int) -> float:
    return min(spree * 0.05, 0.5)
