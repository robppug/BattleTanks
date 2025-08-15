extends Area3D
class_name ControlPoint

signal captured(team_id:int)

var owner:int = -1
var capture_progress:float = 0.0
var capturing_team:int = -1

func _process(delta:float) -> void:
    var teams := {}
    for body in get_overlapping_bodies():
        if body.has_method("team_id"):
            var t = body.team_id()
            teams[t] = teams.get(t, 0) + 1
    if teams.size() == 1:
        var team = teams.keys()[0]
        if owner != team:
            if capturing_team != team:
                capturing_team = team
                capture_progress = 0
            var required = Balance.balance.cp_capture_time
            capture_progress += delta
            if capture_progress >= required:
                owner = team
                emit_signal("captured", team)
                capturing_team = -1
        else:
            capture_progress = 0
    elif teams.size() == 0:
        capture_progress = max(capture_progress - delta, 0)
        capturing_team = -1
    else:
        capturing_team = -1
