local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend(
{
  {
    type = "tool",
    name = "nuclear-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__pbpetrus__/graphics/icons/nuclear-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "M" },
    order = "m",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "item",
    name = "titanium-platform-foundation",
    icon = "__pbpetrus__/graphics/icons/titanium-platform-foundation.png",
    subgroup = "space-platform",
    order = "a[space-platform-foundation]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 100,
    weight = 10*kg,
    place_as_tile =
    {
      result = "titanium-platform-foundation",
      condition_size = 1,
      condition = {layers={empty_space=true}},
      invert = true,
    }
  },
  {
    type = "item",
    name = "lead-ore", --galena
    icon = "__pbpetrus__/graphics/icons/lead-ore.png",
    pictures =
    {
      { size = 64, filename = "__pbpetrus__/graphics/icons/lead-ore.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/lead-ore-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/lead-ore-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/lead-ore-3.png", scale = 0.5, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    color_hint = { text = "T" },
    order = "h[lead-ore]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 5*kg
  },
  {
    type = "item",
    name = "lead-plate",
    icon = "__pbpetrus__/graphics/icons/lead-plate.png",
    subgroup = "raw-material",
    color_hint = { text = "I" },
    order = "a[smelting]-c[lead-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust,
    weight = 5*kg
  },
  {
    type = "item",
    name = "potassium-nitrate",
    icon = "__pbpetrus__/graphics/icons/potassium-nitrate.png",
    pictures =
    {
      {size = 64, filename = "__pbpetrus__/graphics/icons/potassium-nitrate.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__pbpetrus__/graphics/icons/potassium-nitrate.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__pbpetrus__/graphics/icons/potassium-nitrate.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__pbpetrus__/graphics/icons/potassium-nitrate.png", scale = 0.5, mipmap_count = 4}
    },
    subgroup = "raw-resource",
    color_hint = { text = "I" },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-d[potassium-nitrate]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2 * kg
  },
  {
    type = "item",
    name = "potassium-bacteria",
    icon = "__pbpetrus__/graphics/icons/potassium-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__pbpetrus__/graphics/icons/potassium-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/potassium-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/potassium-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/potassium-bacteria.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-d[potassium-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "gleba",
    weight = 1 * kg,
    spoil_ticks = 1 * minute,
    spoil_result = "potassium-nitrate"
  },
  {
    type = "ammo",
    name = "lead-core-magazine",
    icon = "__base__/graphics/icons/firearm-magazine.png",
    ammo_category = "bullet",
    ammo_type =
    {
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = {amount = 5, type = "physical"}
                },
                {
                  type = "activate-impact",
                  deliver_category = "bullet"
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-b[lead-core-magazine]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 10*kg
  },
  --{
  --  type = "item",
  --  name = "micro-semi-conductor",
  --  icon = "__pbpetrus__/graphics/icons/micro-semi-conductor.png",
  --  subgroup = "intermediate-product",
  --  color_hint = { text = "4" },
  --  order = "b[circuits]-d[micro-semi-conductor]",
  --  inventory_move_sound = item_sounds.electric_small_inventory_move,
  --  pick_sound = item_sounds.electric_small_inventory_pickup,
  --  drop_sound = item_sounds.electric_small_inventory_move,
  --  stack_size = 100,
  --  ingredient_to_weight_coefficient = 0.25
  --},
  --{
  --  type = "item",
  --  name = "holmium-waste",
  --  icon = "__space-age__/graphics/icons/holmium-plate.png",
  --  color_hint = { text = "4" },
  --  subgroup = "fulgora-processes",
  --  order = "b[holmium]-b[holmium-waste]",
  --  inventory_move_sound = item_sounds.electric_small_inventory_move,
  --  pick_sound = item_sounds.electric_small_inventory_pickup,
  --  drop_sound = item_sounds.electric_small_inventory_move,
  --  stack_size = 100,
  --  ingredient_to_weight_coefficient = 0.25
  --},
  {
    type = "capsule",
    name = "boompuff",
    icon = "__pbpetrus__/graphics/icons/boompuff-bulb.png",
    pictures =
    {
      { size = 64, filename = "__pbpetrus__/graphics/icons/boompuff-bulb.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/boompuff-bulb.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/boompuff-bulb.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/boompuff-bulb.png", scale = 0.5, mipmap_count = 4 }
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-c[boompuff]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "2MJ",
    stack_size = 50,
    default_import_location = "gleba",
    weight = 1 * kg,
    spoil_ticks = 60 * minute,
    spoil_result = "spoilage",
    capsule_action = item_effects.yumako_regen
	--todo replace regen with explosiveness
  },
  {
    type = "capsule",
    name = "boompuff-powder",
    icon = "__pbpetrus__/graphics/icons/boompuff-powder.png",
    subgroup = "agriculture-products",
    order = "a[organic-processing]-d[boompuff-powder]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "1MJ",
    stack_size = 100,
    default_import_location = "gleba",
    spoil_ticks = 3 * minute,
    spoil_result = "spoilage",
    weight = 0.5 * kg,
    capsule_action = item_effects.yumako_regen
  },
  {
    type = "item",
    name = "boompuff-seed",
    localised_name = {"item-name.boompuff-seed"},
    localised_description = {"item-description.boompuff-seed"},
    icon = "__pbpetrus__/graphics/icons/boompuff-seed.png",
    pictures =
    {
      { size = 64, filename = "__pbpetrus__/graphics/icons/boompuff-seed.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/boompuff-seed.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/boompuff-seed.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/boompuff-seed.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "a[seeds]-c[boompuff-seed]",
    plant_result = "boompuff-tree",
    place_result = "boompuff-tree",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "gleba",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "4MJ"
  },
  {
    type = "item",
    name = "artificial-boompuff-soil",
    icon = "__pbpetrus__/graphics/icons/artificial-boompuff-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-e[artificial-boompuff-soil]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    place_as_tile =
    {
      result = "artificial-boompuff-soil",
      condition_size = 1,
      condition = {layers={}},
      tile_condition = {
		--todo, check what limits are desirable for natural		
		"midland-yellow-crust",
		"midland-yellow-crust-2",
		"midland-yellow-crust-3",
		"midland-yellow-crust-4",
		
		}
    }
  },
  {
    type = "item",
    name = "overgrowth-boompuff-soil",
    icon = "__pbpetrus__/graphics/icons/overgrowth-boompuff-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-e[overgrowth-boompuff-soil]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    place_as_tile =
    {
      result = "overgrowth-boompuff-soil",
      condition_size = 1,
      condition = {layers={}},
      tile_condition = {
		"midland-yellow-crust",
		"midland-yellow-crust-2",
		"midland-yellow-crust-3",
		"midland-yellow-crust-4",
		--todo, check what limits are desirable for overgrowth
        "lowland-olive-blubber",
        "lowland-olive-blubber-2",
        "lowland-olive-blubber-3",
        "lowland-brown-blubber",
        "lowland-pale-green"
      }
    }
  },
  {
    type = "item",
    name = "artificial-teflilly-soil",
    icon = "__pbpetrus__/graphics/icons/artificial-teflilly-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-e[artificial-teflilly-soil]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    place_as_tile =
    {
      result = "artificial-teflilly-soil",
      condition_size = 1,
      condition = {layers={}},
      tile_condition = {
		--todo add tiles for feronia		
		}
    }
  },
  {
    type = "item",
    name = "overgrowth-teflilly-soil",
    icon = "__pbpetrus__/graphics/icons/overgrowth-teflilly-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-e[overgrowth-teflilly-soil]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    place_as_tile =
    {
      result = "overgrowth-teflilly-soil",
      condition_size = 1,
      condition = {layers={}},
      tile_condition = {
		--todo add tiles for feronia
      }
    }
  },
  {
    type = "item",
    name = "teflilly-seed",
    localised_name = {"item-name.teflilly-seed"},
    localised_description = {"item-description.teflilly-seed"},
    icon = "__pbpetrus__/graphics/icons/teflilly-seed.png",
    pictures =
    {
      { size = 64, filename = "__pbpetrus__/graphics/icons/teflilly-seed.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/teflilly-seed.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/teflilly-seed.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__pbpetrus__/graphics/icons/teflilly-seed.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "feronia-agriculture",
    order = "a[feronia-seeds]-d[teflilly-seed]",
    plant_result = "teflilly-plant",
    place_result = "teflilly-plant",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "feronia",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "4MJ"
  },
})

--data.raw["recipe"]["productivity-module-3"].ingredients = 
--{
--  {type = "item", name = "productivity-module-2", amount = 4},
--  {type = "item", name = "advanced-circuit", amount = 5},
--  {type = "item", name = "processing-unit", amount = 5},
--  {type = "item", name = "uranium-fuel-cell", amount = 5}
--}
--data.raw["recipe"]["productivity-module-3"].enabled = true