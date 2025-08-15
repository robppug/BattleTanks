extends Node
class_name Shop

func buy_item(tank:Tank, item_id:String) -> bool:
    for it in Balance.items:
        if it.id == item_id and tank.gold >= it.cost:
            tank.gold -= it.cost
            var item = Item.new()
            item.setup(it)
            tank.items.append(item)
            return true
    return false

func switch_tank(player_id:int, current:Tank, new_tank_id:String) -> Tank:
    var ratio = Balance.economy.tank_refund_ratio
    Game.update_bounty_on_gold(player_id, current.gold * ratio)
    var base = Base.new()
    var new_tank = base.spawn_tank(new_tank_id)
    new_tank.items = current.items
    current.queue_free()
    return new_tank
