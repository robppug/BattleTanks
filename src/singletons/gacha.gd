extends Node

var banner:String = "default_banner"
var pity_counter:int = 0

func pull() -> String:
    var table = Balance.droptables[banner]
    pity_counter += 1
    if pity_counter >= table.pity_hard:
        pity_counter = 0
        return "legendary"
    var r = randf()
    if pity_counter >= table.pity_soft:
        r -= 0.5
        if r < 0:
            r = 0
    var acc = 0.0
    for rarity in table.rates.keys():
        acc += table.rates[rarity]
        if r < acc:
            if rarity == "legendary":
                pity_counter = 0
            return rarity
    return "common"

func simulate_pulls(n:int) -> Dictionary:
    var counts = {"legendary":0,"rare":0,"common":0}
    var pity_hits = 0
    for i in range(n):
        var res = pull()
        counts[res] += 1
        if pity_counter == 0 and res == "legendary":
            if i+1 >= Balance.droptables[banner].pity_soft:
                pity_hits += 1
    return {"counts":counts, "pity_hits":pity_hits}
