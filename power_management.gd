extends Node

var max_power = 100.0
var current_power = max_power
var power_drain_rate = 1.0 # Base power drain per second
var power_use_per_camera = 0.5 # Additional drain for camera use

# Power label (assumes you have a UI Label node)
var power_label

# Called when the node enters the scene tree
func _ready():
    power_label = $UI/PowerLabel

# Called every frame to reduce power
func _process(delta):
    current_power -= power_drain_rate * delta
    
    # Additional drain when using cameras
    if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
        current_power -= power_use_per_camera * delta

    # Update power label
    power_label.text = "Power: " + str(int(current_power)) + "%"

    # Check if power is depleted
    if current_power <= 0:
        game_over()

# Game over function when power is gone
func game_over():
    # Trigger game over logic
    print("Game Over - No Power")
    get_tree().quit()
