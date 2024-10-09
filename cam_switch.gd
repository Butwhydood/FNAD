extends Node

# Array of cameras
var cameras = []
var current_camera = 0

# Called when the node enters the scene tree
func _ready():
    cameras = [
        $Camera1,
        $Camera2,
        $Camera3,
        $Camera4
    ]
    set_camera(current_camera)

# Function to activate a camera
func set_camera(index):
    for i in range(len(cameras)):
        cameras[i].current = (i == index)

# Function to switch between cameras using left/right arrow keys
func _process(delta):
    if Input.is_action_just_pressed("ui_left"):
        current_camera = (current_camera - 1 + cameras.size()) % cameras.size()
        set_camera(current_camera)
    elif Input.is_action_just_pressed("ui_right"):
        current_camera = (current_camera + 1) % cameras.size()
        set_camera(current_camera)
