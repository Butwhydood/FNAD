extends KinematicBody

# Define waypoints (rooms) for animatronics to move between
var waypoints = []
var current_waypoint = 0
var move_speed = 2.0

# Called when the node enters the scene tree
func _ready():
    waypoints = [
        $Waypoint1,
        $Waypoint2,
        $Waypoint3,
        $Office
    ]

# Move animatronic towards the current waypoint
func _process(delta):
    var direction = (waypoints[current_waypoint].global_transform.origin - global_transform.origin).normalized()
    move_and_slide(direction * move_speed)

    if global_transform.origin.distance_to(waypoints[current_waypoint].global_transform.origin) < 1.0:
        current_waypoint += 1
        if current_waypoint >= waypoints.size():
            current_waypoint = 0 # Loop back to start or add logic for game over
