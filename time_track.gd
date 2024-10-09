extends Node

var current_time = 0.0
var time_to_win = 360.0 # 6 minutes to represent 6 hours in game time

# Called every frame to track time
func _process(delta):
    current_time += delta
    
    if current_time >= time_to_win:
        win_game()

# Win function
func win_game():
    print("You survived the night!")
    get_tree().quit()
