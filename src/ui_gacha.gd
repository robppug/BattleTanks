extends Control
class_name UI_Gacha

func pull_once():
    var result = Gacha.pull()
    print("Pulled", result)
