extends RichTextLabel
@export var textboxes = ["Test", "Test 2"]
var curText = 0
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer
	timer.timeout.connect(timeout)
	visible_characters = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = textboxes[curText]
	if Input.is_action_just_pressed("ui_accept"):
		if curText < textboxes.size() - 1:
			curText += 1
			visible_characters = 0
		else:
			get_parent().get_parent().queue_free()
	pass
	
func timeout():
	if (visible_characters < text.length()):
		visible_characters += 1
	timer.start()
	pass
	

