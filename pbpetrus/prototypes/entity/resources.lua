local resource_autoplace = require("resource-autoplace")
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

-- Initialize the core patch sets in a predictable order
resource_autoplace.initialize_patch_set("crude-oil", false, "aquilo")
resource_autoplace.initialize_patch_set("lithium-brine", false, "aquilo")
resource_autoplace.initialize_patch_set("fluorine-vent", false, "aquilo")

local function create_tiles()
  return {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      source_effects =
      {
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-inner-explosion",
          offsets = {{0.5, 0.5}}
        },
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-outer-explosion",
          offsets = {{0.5, 0.5}}
        }
      }
    }
  }
end

data.raw.resource["crude-oil"].created_effect = create_tiles("snow-flat")

local function resource(resource_parameters, autoplace_parameters)
  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__pbpetrus__/graphics/icons/" .. resource_parameters.name .. ".png",
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = resource_parameters.minable or
    {
      mining_particle = resource_parameters.name .. "-particle",
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.name
    },
    category = resource_parameters.category,
    subgroup = resource_parameters.subgroup,
    walking_sound = resource_parameters.walking_sound,
    collision_mask = resource_parameters.collision_mask,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
    autoplace = autoplace_parameters.probability_expression ~= nil and
    {
      --control = resource_parameters.name,
      order = resource_parameters.order,
      probability_expression = autoplace_parameters.probability_expression,
      richness_expression = autoplace_parameters.richness_expression
    }
    or resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      autoplace_control_name = resource_parameters.autoplace_control_name,
      base_density = autoplace_parameters.base_density,
      base_spots_per_km = autoplace_parameters.base_spots_per_km2,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
      tile_restriction = autoplace_parameters.tile_restriction
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__pbpetrus__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint,
    factoriopedia_simulation = resource_parameters.factoriopedia_simulation
  }
end

data:extend({
  -- Usually earlier order takes priority, but there's some special
  -- case buried in the code about resources removing other things
  -- (though maybe there shouldn't be, and we should just place things in a different order).
  -- Trees are "a", and resources will delete trees when placed.
  -- Oil is "c" so won't be placed if another resource is already there.
  -- "d" is available for another resource, but isn't used for now.

  resource(
    {
      name = "lead-ore",
      order = "d",
      map_color = {0.52, 0.48, 0.6},
      mining_time = 0.5,
      walking_sound = sounds.ore,
      resource_patch_search_radius = 12,
      mining_visualisation_tint = {r = 0.77, g = 0.77, b = 0.9, a = 1.000}, -- #fae1a4ff
      factoriopedia_simulation = simulations.factoriopedia_scrap,
    },
    {
      probability_expression = 0
    }
  ),

  {
    type = "resource",
    name = "ethanol-geyser",
    icon = "__pbpetrus__/graphics/icons/ethanol-geyser.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    subgroup = "mineable-fluids",
    order="b",
    infinite = true,
    highlight = true,
    minimum = 20000,
    normal = 100000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 16,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "ethanol",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
    walking_sound = sounds.oil,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
      --control = "fluorine-vent",
      order="a[resources]-a[ethanol]",
      --default_enabled = false,
      probability_expression = "aquilo_flourine_vent_probability", --todo
      richness_expression = "aquilo_flourine_vent_richness" --todo
    },
    stage_counts = {0},
    stages =
    {
      layers =
      {
        util.sprite_load("__pbpetrus__/graphics/entity/ethanol-geyser/ethanol-geyser", --todo
        {
          priority = "extra-high",
          frame_count = 4,
          scale = 0.5
        })
      }
    },
    draw_stateless_visualisation_under_building = false,
    stateless_visualisation =
    {
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-1", --todo
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = {r=0.25, g=0.5, b=0.5,a= 1},
          scale = 0.75,
          shift = {0,-0.23}
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-2",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = {r=0, g=0.9, b=1,a= 0.35},
          scale = 0.75,
          shift = {0,-0.23}
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__pbpetrus__/graphics/entity/ethanol-geyser/ethanol-geyser-gas-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, 24 -152),
          scale = 1.5,
          tint = util.multiply_color({r=0.5, g=1, b=1}, 0.1)
        }
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__pbpetrus__/graphics/entity/ethanol-geyser/ethanol-geyser-gas-inner.png",
          frame_count = 47,
          line_length = 16,
          width = 40,
          height = 84,
          animation_speed = 0.5,
          shift = util.by_pixel(0, 24 -78),
          scale = 1.5,
          tint = util.multiply_color({r=0, g=0.9, b=1}, 0.1)
        }
      }
    },
    map_color = {0.0, 0.8, 1.0},
    map_grid = false,
    created_effect = create_tiles("snow-patchy")
  },

  {
    type = "resource",
    name = "steam-geyser",
    icon = "__pbpetrus__/graphics/icons/steam-geyser.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    subgroup = "mineable-fluids",
    order="b",
    infinite = true,
    highlight = true,
    minimum = 20000,
    normal = 100000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 16,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "steam",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
    walking_sound = sounds.oil,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
      --control = "fluorine-vent",
      order="a[resources]-a[steam]",
      --default_enabled = false,
      probability_expression = "aquilo_flourine_vent_probability", --todo
      richness_expression = "aquilo_flourine_vent_richness" --todo
    },
    stage_counts = {0},
    stages =
    {
      layers =
      {
        util.sprite_load("__pbpetrus__/graphics/entity/steam-geyser/steam-geyser",
        {
          priority = "extra-high",
          frame_count = 4,
          scale = 0.5
        })
      }
    },
    draw_stateless_visualisation_under_building = false,
    stateless_visualisation =
    {
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-1", --todo
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = {r=0.25, g=0.5, b=0.5,a= 1},
          scale = 0.75,
          shift = {0,-0.23}
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-2",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = {r=0, g=0.9, b=1,a= 0.35},
          scale = 0.75,
          shift = {0,-0.23}
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__pbpetrus__/graphics/entity/steam-geyser/steam-geyser-gas-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, 24 -152),
          scale = 1.5,
          tint = util.multiply_color({r=0.5, g=1, b=1}, 0.1)
        }
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__pbpetrus__/graphics/entity/steam-geyser/steam-geyser-gas-inner.png",
          frame_count = 47,
          line_length = 16,
          width = 40,
          height = 84,
          animation_speed = 0.5,
          shift = util.by_pixel(0, 24 -78),
          scale = 1.5,
          tint = util.multiply_color({r=0, g=0.9, b=1}, 0.1)
        }
      }
    },
    map_color = {0.0, 0.8, 1.0},
    map_grid = false,
    created_effect = create_tiles("snow-patchy")
  }
})