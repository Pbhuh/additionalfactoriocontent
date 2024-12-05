local tile_trigger_effects = require("prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local semi_wet_sound = sound_variations("__space-age__/sound/walking/semi-wet-rock", 10, 0.7)
local semi_dry_sound = sound_variations("__space-age__/sound/walking/semi-dry-rock", 10, 0.8)
local soft_bark_sound = sound_variations("__space-age__/sound/walking/soft-bark", 10, 0.8)
local dry_rock_sound = sound_variations("__space-age__/sound/walking/dry-rock", 10, 0.8)
local slime_sound = sound_variations("__space-age__/sound/walking/slime", 10, 0.8)
local wetland_sound = sound_variations("__space-age__/sound/walking/wetland", 10, 0.6)
local tile_lightening = 28

local wetland_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-water-shallow.ogg", volume = 0.6,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}
local lake_ambience =
{
  {
    sound =
    {
      variations = sound_variations("__base__/sound/world/water/waterlap", 10, 0.4),
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
      }
    },
    radius = 7.5,
    min_entity_count = 10,
    max_entity_count = 30,
    entity_to_sound_ratio = 0.1,
    average_pause_seconds = 8
  },
  {
    sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/rain-on-water", 10, 0.2),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
        }
      },
      min_entity_count = 10,
      max_entity_count = 25,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 5,
  }
}

gleba_tile_offset = 65
gleba_lowland_tile_offset = 32

local lava_to_out_of_map_transition = space_age_tiles_util.lava_to_out_of_map_transition
local lava_stone_transitions_between_transitions = space_age_tiles_util.lava_stone_transitions_between_transitions

local function water_sound() return sound_variations("__base__/sound/walking/shallow-water", 7, 1, volume_multiplier("main-menu", 2.9)) end
local function mud_sound() return sound_variations("__base__/sound/walking/decorative-mud", 10, 0.3, volume_multiplier("main-menu", 2.9)) end
local function carpet_sound() return sound_variations("__base__/sound/walking/grass", 10, 0.8, volume_multiplier("main-menu", 2.9)) end
local function bark_sound() return sound_variations("__base__/sound/walking/dirt-1", 10, 0.8, volume_multiplier("main-menu", 2.9)) end
local function rock_sound() return sound_variations("__base__/sound/walking/concrete", 11, 0.5) end


local function lowland_tile_variations_template_with_transitions_and_puddle_transitions(high_res_picture, options)
  local result = tile_variations_template_with_transitions(high_res_picture, options)

  if result.transition then
    result.transition.auxiliary_effect_mask_layout =
    {
      spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
      scale = 0.5,
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 1,
      o_transition_count = 1,
      u_transition_line_length = 1,
      o_transition_line_length = 2,
      inner_corner_x = 0,
      outer_corner_x = 576,
      side_x = 1152,
      u_transition_x = 1728,
      o_transition_x = 2304
    }
  end

  return result
end

data:extend({
	{
    type = "tile",
    name = "natural-teflilly-soil",
    order = "d[teflilly]-c[natural-teflilly-soil]",
    subgroup = "gleba-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "gleba_fertile_solid * 50000 - 40000 - gleba_biome_mask_green * 1000000"},
    layer_group = "ground-natural",
    layer = gleba_tile_offset + 20,
    searchable = true,

    transitions = lava_stone_transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions(
      "__pbpetrus__/graphics/terrain/natural-teflilly-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = semi_wet_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    build_sound = data.raw["tile"]["landfill"].build_sound,
    map_color={185, 166, 5},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "artificial-teflilly-soil",
    order = "d[teflilly]-d[artificial-teflilly-soil]",
    subgroup = "gleba-tiles",
    minable = {mining_time = 0.5, result = "artificial-teflilly-soil"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg", volume = 0.8}, -- sound?
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = gleba_tile_offset + 22,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions(
      "__pbpetrus__/graphics/terrain/artificial-teflilly-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = semi_wet_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    build_sound = data.raw["tile"]["landfill"].build_sound,
    map_color={204, 183, 6},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "overgrowth-teflilly-soil",
    order = "d[teflilly]-e[overgrowth-teflilly-soil]",
    subgroup = "gleba-tiles",
    minable = {mining_time = 0.5, result = "overgrowth-teflilly-soil"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg", volume = 0.8}, -- sound?
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = gleba_tile_offset + 24,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions(
      "__pbpetrus__/graphics/terrain/overgrowth-teflilly-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = semi_wet_sound,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = wetland_driving_sound,
    build_sound = data.raw["tile"]["landfill"].build_sound,
    map_color={204, 183, 6},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  }
})