extends CharacterBody2D
class_name DraggablePiece

@export var texture: Texture
@export var containment_zone: Control 


@onready var item_bounds = $ItemBounds 
@onready var sprite = $Sprite2D
#flags
var dragging := false
var draggable := true
var is_packed := false 
var original_position := Vector2.ZERO 

func _ready():
	original_position = global_position
	sprite.texture = texture
	
func get_zone_rect() -> Rect2:
	if containment_zone:
		return containment_zone.get_global_rect()
	
	print_debug("ERROR: Containment Zone is not set for ", self.name)
	return Rect2()

func get_item_rect() -> Rect2:
	if item_bounds:
		return item_bounds.get_global_rect()
	
	print_debug("ERROR: ItemBounds node not found for ", self.name)
	return Rect2(global_position, Vector2(1, 1))

func _process(delta):
	if dragging and draggable:
		var target_pos = get_global_mouse_position()
		
		if is_packed:
			# If it's "packed", clamp its movement inside the zone
			var zone_rect = get_zone_rect()
			var item_rect = get_item_rect()
			
			var item_offset = item_rect.position - global_position
			
			# === THE FIX: Use .end.x and .end.y instead of .get_end().x ===
			target_pos.x = clampf(target_pos.x, zone_rect.position.x - item_offset.x, zone_rect.end.x - item_offset.x - item_rect.size.x)
			target_pos.y = clampf(target_pos.y, zone_rect.position.y - item_offset.y, zone_rect.end.y - item_offset.y - item_rect.size.y)
			
		global_position = target_pos

func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not draggable:
		return
	
	var is_press := false
	var is_release := false
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		is_press = event.pressed
		is_release = not event.pressed
	
	elif event is InputEventScreenTouch and event.index == 0:
		is_press = event.pressed
		is_release = not event.pressed

	if is_press:
		dragging = true
		if not is_packed:
			original_position = global_position
		
		
		z_index = 10
		
		
		get_viewport().set_input_as_handled()
	
	elif is_release:
		if dragging: 
			dragging = false
			
			z_index = 0
			
			if not is_packed:
				var zone_rect = get_zone_rect()
				var item_rect = get_item_rect()
				
				
				if zone_rect.has_point(item_rect.get_center()):
					is_packed = true 
				else:
					global_position = original_position
