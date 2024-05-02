class_name PlayerHealthManager extends CharacterHealthManager

@onready var player_instance: Player = get_parent()


func process_hit(area: Area2D):
	super.process_hit(area)
	if DebugStore.debug_mode:
		print("player_hit")
	PlayerStore.player_health_changed.emit(current_health)


func process_death():
	var death_node = death_particle.instantiate() as GPUParticles2D
	(death_node.process_material as ShaderMaterial).set_shader_parameter("sprite", death_sprite)
	death_node.global_position = player_instance.global_position
	get_tree().root.add_child(death_node)
	
	host_object.process_death()

