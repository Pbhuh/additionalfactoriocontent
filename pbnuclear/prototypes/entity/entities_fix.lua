local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend(
{
  {
    type = "burner-generator",
    name = "radiothermal-generator",
    icon  = "__outer_moons__/graphics/icons/RTG.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "radiothermal-generator"},
    fast_replaceable_group = "radiothermal-generator",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "nuclear-reactor-explosion",
	max_power_output = "250kW",
    consumption = "250kW",
    energy_source = {
		type = "electric",
		usage_priority = "secondary-output",
	},
    burner =
    {
      type = "burner",
      fuel_categories = {"radiothermal"},
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
    },
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
	
	always_draw_idle_animation = true,
	idle_animation = {
		layers = {
			{
				filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-shadow.png",
				priority = "high",
				width = 900,
				height = 500,
				frame_count = 1,
				line_length = 1,
				repeat_count = 80,
				animation_speed = 0.5,
				shift = util.by_pixel_hr(0, -32),
				draw_as_shadow = true,
				scale = 0.4,
			},
			{
				priority = "high",
				width = 400,
				height = 480,
				frame_count = 80,
				shift = util.by_pixel_hr(0, -32),
				animation_speed = 0.41,
				scale = 0.4,
				stripes = {
					{
						filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-animation-1.png",
						width_in_frames = 8,
						height_in_frames = 8,
					},
					{
						filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-animation-2.png",
						width_in_frames = 8,
						height_in_frames = 2,
					},
				},
			},
		},
	},
	animation = {
				
		fadeout = true,
		secondary_draw_order = 1,
		layers = {
			{
				priority = "high",
				size = { 400, 480 },
				shift = util.by_pixel_hr(0, -32),
				frame_count = 80,
				draw_as_glow = true,
				scale = 0.4,
				animation_speed = 1.5,
				blend_mode = "additive",
				stripes = {
					{
						filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-emission-1.png",
						width_in_frames = 8,
						height_in_frames = 8,
					},
					{
						filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-emission-2.png",
						width_in_frames = 8,
						height_in_frames = 2,
					},
				},
			}
		}
	},

    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 2.0},
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/nuclear-open.ogg", volume = 0.8},
    close_sound = {filename = "__base__/sound/open-close/nuclear-close.ogg", volume = 0.8},
    working_sound =
    {
      sound = sound_variations("__base__/sound/nuclear-reactor", 2, 0.55, volume_multiplier("main-menu", 0.8)),
      max_sounds_per_type = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    meltdown_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "atomic-rocket"
          }
        }
      }
    },

    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["nuclear-reactor"],
  },
  
  {
    type = "assembling-machine",
    name = "assembling-machine-solar-roof",
    icon = "__pbnuclear__/graphics/icons/assembling-machine-solar-roof.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine-1", result = "solar-panel"},
    max_health = 300,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "assembling-machine",
    next_upgrade = "assembling-machine-2",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__pbnuclear__/graphics/entity/assembling-machine-solar-roof/assembling-machine-solar-roof.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
    crafting_speed = 0.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "75kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5 },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
})

data:extend(
{
  {
    type = "mining-drill",
    name = "treetap",
    icon = "__pbnuclear__/graphics/icons/treetap.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "treetap"},
    resource_categories = {"basic-fluid"},
    max_health = 50,
    corpse = "pumpjack-remnants",
    dying_explosion = "pumpjack-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
    energy_source =
    {
      type = "electric",
      emissions_per_minute = { pollution = 5 },
      usage_priority = "secondary-input"
    },
    output_fluid_box =
    {
      volume = 500,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
          direction = defines.direction.north,
          positions = {{1, -1}, {1, -1}, {-1, 1}, {-1, 1}},
          flow_direction = "output"
        }
      }
    },
    energy_usage = "90kW",
    mining_speed = 1,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_slots = 1,
    radius_visualisation_picture =
    {
      filename = "__pbnuclear__/graphics/entity/treetap/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {78, 173, 255},
    base_render_layer = "lower-object-above-shadow",
    base_picture =
    {
      sheets =
      {
        {
          filename = "__pbnuclear__/graphics/entity/treetap/treetap-base.png",
          priority = "extra-high",
          width = 261,
          height = 273,
          shift = util.by_pixel(-2.25, -4.75),
          scale = 0.5
        },
        {
          filename = "__pbnuclear__/graphics/entity/treetap/pumpjack-base-shadow.png",
          width = 220,
          height = 220,
          scale = 0.5,
          draw_as_shadow = true,
          shift = util.by_pixel(6, 0.5)
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__pbnuclear__/graphics/entity/treetap/treetap-horsehead.png",
              animation_speed = 0.5,
              scale = 0.5,
              line_length = 8,
              width = 206,
              height = 202,
              frame_count = 40,
              shift = util.by_pixel(-4, -24)
            },
            {
              priority = "high",
              filename = "__pbnuclear__/graphics/entity/treetap/pumpjack-horsehead-shadow.png",
              animation_speed = 0.5,
              draw_as_shadow = true,
              line_length = 8,
              width = 309,
              height = 82,
              frame_count = 40,
              scale = 0.5,
              shift = util.by_pixel(17.75, 14.5)
            }
          }
        }
      }
    },
    open_sound = {filename = "__base__/sound/open-close/pumpjack-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/pumpjack-close.ogg", volume = 0.5},
    working_sound =
    {
      sound = {filename = "__base__/sound/pumpjack.ogg", volume = 0.7},
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 10
    },
    fast_replaceable_group = "pumpjack",

    circuit_connector = circuit_connector_definitions["pumpjack"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  }
}
)