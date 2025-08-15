extends SceneTree

func _init() -> void:
    Balance.load_all()
    test_dps()
    test_bounty_clamp()
    test_assist_formula()
    test_cp_capture()
    test_force_income()
    test_gacha_pity()
    print("Tests completed")
    quit()

func test_dps() -> void:
    var w = Weapon.new()
    w.cost = 100
    w.range = 800
    w.refire_time = 1.0
    w.damage_factor = 1.0
    var expected = (4 * 100 * 1 * 1.0) / (0.06 * 800)
    assert(abs(w.dps() - expected) < 0.01)

func test_bounty_clamp() -> void:
    Game.register_player(1, 1000)
    Game.update_bounty_on_gold(1, 10000)
    var b = Game.players[1].bounty
    var max_b = 125 + 1000 / Balance.balance.bounty_max_factor
    assert(b <= max_b + 0.1)
    Game.bounty_on_death(1)
    var min_b = 125 + 1000 / Balance.balance.bounty_min_factor
    assert(Game.players[1].bounty >= min_b - 0.1)

func test_assist_formula() -> void:
    var gold = Game.assist_gold(300, 2)
    var expected = (1.5 * 300 / (7 - 2)) / 2
    assert(abs(gold - expected) < 0.01)

func test_cp_capture() -> void:
    var cp = ControlPoint.new()
    cp.get_overlapping_bodies = func(): return []
    cp._process(1.0)
    assert(cp.capture_progress == 0)
    var mock = Node.new()
    mock.team_id = func(): return 1
    cp.get_overlapping_bodies = func(): return [mock]
    for i in range(int(Balance.balance.cp_capture_time)):
        cp._process(1.0)
    assert(cp.owner == 1)

func test_force_income() -> void:
    Economy.start(2)
    var share = Economy.calc_team_share(1000)
    var f = Balance.balance.force_gold_formula
    var expected = 1000 * f.factor / (2 * f.player_mult + f.base)
    assert(abs(share - expected) < 0.01)

func test_gacha_pity() -> void:
    Gacha.pity_counter = Balance.droptables[Gacha.banner].pity_hard - 1
    var res = Gacha.pull()
    assert(res == "legendary")
