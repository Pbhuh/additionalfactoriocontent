local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
--local gleba_tree_variations = require("__space-age__.prototypes.entity.plants")

local seconds = 60
local minutes = 60*seconds

local plant_emissions = { pollution = -0.001 }
local plant_harvest_emissions = { spores = 15 }
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}
local tree_corpse_flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"}

local leaf_sound = sounds.tree_leaves
local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place

local leaf_sound_trigger =
{
  {
    type = "play-sound",
    sound = leaf_sound,
    damage_type_filters = "fire"
  }
}


local ashland_lichen_tree_pictures = {
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_00",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_00",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_01",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_01",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_02",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_02",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_03",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_03",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_04",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_04",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_05",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_05",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_06",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_06",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_07",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_07",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_08",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_08",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_09",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_09",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_10",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_10",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_11",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_11",{ scale = 0.5, draw_as_shadow = true}),
    }
  }
}

local function gleba_tree_variations(name, variation_count, per_row, scale_multiplier, width, height, shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local shift = shift or util.by_pixel(52, -40)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-trunk.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-harvest.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-normal.png",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        filenames =
        {
          "__space-age__/graphics/entity/plant/"..name.."/"..name.."-harvest-shadow.png",
          "__space-age__/graphics/entity/plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      --underwater       = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].underwater or nil,
      --water_reflection = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].water_reflection or nil,

      leaf_generation =
      {
        type = "create-particle",
        particle_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_vertical_speed = 0.01,
        initial_height_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        particle_name = "branch-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.01,
        frame_speed = 0.4,
        repeat_count = 15
      }
    }
    table.insert(variations, variation)
  end
  return variations
end

local function minor_tints() -- Only for leaves where most if the colour is baked in.
  return {
    {r = 255, g = 255, b =  255},
    {r = 220, g = 255, b =  255},
    {r = 255, g = 220, b =  255},
    {r = 255, g = 255, b =  220},
    {r = 220, g = 220, b =  255},
    {r = 255, g = 220, b =  220},
    {r = 220, g = 255, b =  220},
  }
end

data:extend({
	{
	type = "plant",
	name = "rubber-tree",
    icon = "__pbnuclear__/graphics/icons/rubber-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
	minable =
	{
		mining_particle = "wooden-particle",
		mining_time = 0.55,
		result = "wood",
		count = 4,
		mining_trigger =
		{
		{
			type = "direct",
			action_delivery =
			{
			{
				type = "instant",
				target_effects = leaf_sound_trigger
			}
			}
		}
		}
	},
	corpse = "rubber-tree-stump",
	damaged_trigger_effect = leaf_sound_trigger,
	mined_sound = sounds.tree_mined,
	remains_when_mined = "rubber-tree-stump",
	emissions_per_second = tree_emissions,
    harvest_emissions = plant_harvest_emissions,
	growth_ticks = 5 * minutes,    
	max_health = 50,	
	colors = minor_tints(),
	map_generator_bounding_box = {{-0.8, -0.8}, {0.8, 0.8}},
	collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
	selection_box = {{-0.9, -2.2}, {0.9, 0.6}},
	--drawing_box_vertical_extension = tree_data.drawing_box_vertical_extension or 1.8,
    subgroup = "plants",
    order = "b[vulcanus]-a[ashland-lichen-plant]",
	impact_category = "tree",
	factoriopedia_simulation = simulations.factoriopedia_ashland_lichen_tree,
	autoplace =
    {
      --order = "b[tree]-b[normal]",
      --probability_expression = "0",
		control = "trees", -- makes it appear on Nauvis
		order = "a[tree]-b[forest]-c[medium]-c[hot]",
		probability_expression = "tree_09",
		richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
		--tile_restriction = { "volcanic-soil-dark", "volcanic-soil-light", "volcanic-ash-soil", "volcanic-ash-flats", "volcanic-ash-light", "volcanic-ash-dark"}
	},
	variations = gleba_tree_variations("funneltrunk", 5, 4),
	agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    map_color = {255, 255, 255},
	darkness_of_burnt_tree = 0.5,
	agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/funneltrunk", 7, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 3,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 12
    },
	},
	{
	type = "plant",
	name = "rubber-tree-tapped",
    icon = "__pbnuclear__/graphics/icons/rubber-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
	minable =
	{
		mining_particle = "wooden-particle",
		mining_time = 0.55,
		result = "wood",
		count = 4,
		mining_trigger =
		{
		{
			type = "direct",
			action_delivery =
			{
			{
				type = "instant",
				target_effects = leaf_sound_trigger
			}
			}
		}
		}
	},
	corpse = "rubber-tree-stump",
	damaged_trigger_effect = leaf_sound_trigger,
	mined_sound = sounds.tree_mined,
	remains_when_mined = "rubber-tree-geyser",
	emissions_per_second = tree_emissions,
    harvest_emissions = plant_harvest_emissions,
	growth_ticks = 5 * minutes,    
	max_health = 50,
	map_generator_bounding_box = {{-0.8, -0.8}, {0.8, 0.8}},
	collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
	selection_box = {{-0.9, -2.2}, {0.9, 0.6}},
	--drawing_box_vertical_extension = tree_data.drawing_box_vertical_extension or 1.8,
    subgroup = "plants",
    order = "b[vulcanus]-a[ashland-lichen-plant]",
	impact_category = "tree",
	factoriopedia_simulation = simulations.factoriopedia_ashland_lichen_tree,
	autoplace =
    {
      --order = "b[tree]-b[normal]",
      --probability_expression = "0",
		control = "trees", -- makes it appear on Nauvis
		order = "a[tree]-b[forest]-c[medium]-c[hot]",
		probability_expression = "tree_09",
		richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
		--tile_restriction = { "volcanic-soil-dark", "volcanic-soil-light", "volcanic-ash-soil", "volcanic-ash-flats", "volcanic-ash-light", "volcanic-ash-dark"}
	},
	variations = gleba_tree_variations("funneltrunk", 5, 4),
	colors = minor_tints(),
	-- or add in pictures
    --pictures = ashland_lichen_tree_pictures,
	agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    map_color = {255, 255, 255},
	darkness_of_burnt_tree = 0.5,
	-- water_reflection = tree_data.water_reflection
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/funneltrunk", 7, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 3,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 12
    },
	}
})

data:extend(
{
  {
    type = "corpse",
    name = "rubber-tree-stump",
    icon = "__pbnuclear__/graphics/icons/rubber-tree-stump.png",
    flags = tree_corpse_flags,
    hidden_in_factoriopedia = true,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    subgroup = "remnants",
    order="d[remnants]-b[tree]",
  }
})

data:extend({
  {
    type = "resource",
	name = "rubber-tree-geyser",
    icon = "__pbnuclear__/graphics/icons/rubber-tree.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    subgroup = "mineable-fluids",
    order="a-b-a",
    infinite = true,
    highlight = true,
    minimum = 60000,
    normal = 300000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 12,
    draw_stateless_visualisation_under_building = false,
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "latex",
          amount_min = 10,
          amount_max = 10,
          probability = 1
        }
      }
    },
    walking_sound = sounds.oil,
    working_sound =
    {
      sound =
      {
        category = "world-ambient", variations = sound_variations("__space-age__/sound/world/resources/sulfuric-acid-geyser", 1, 0.3),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 0.0}, to = {2.0, 100.0}}}
        }
      },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.3,
    },
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	
	--map_generator_bounding_box = {{-0.8, -0.8}, {0.8, 0.8}},
	--collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
	--selection_box = {{-0.9, -2.2}, {0.9, 0.6}},
    stage_counts = {0},
    stages =
    {
      layers =
      {
        util.sprite_load("__pbnuclear__/graphics/entity/rubber-tree-geyser/rubber-tree-geyser",
        {
          priority = "high",
          frame_count = 4,
          scale = 0.5,
        })
      }
    },
    map_color = {255, 255, 255},
    map_grid = false
  },
})