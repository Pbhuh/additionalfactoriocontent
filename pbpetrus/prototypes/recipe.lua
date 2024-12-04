data:extend(
{
	----------------------- additional gleba seeds
  {
    type = "recipe",
    name = "boompuff-processing",
    icon = "__pbpetrus__/graphics/icons/boompuff-processing.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "a[seeds]-d[boompuff-processing]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients = {{type = "item", name = "boompuff-powder", amount = 1}},
    results =
    {
      {type = "item", name = "boompuff-seed", amount = 1, probability = 0.02},
      {type = "item", name = "sulfur", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.976, g = 0.006, b = 0.310, a = 1.000},
      secondary = {r = 0.805, g = 0.701, b = 0.293, a = 1.000},

    }
  },
  {
    type = "recipe",
    name = "artificial-boompuff-soil",
    icon = "__pbpetrus__/graphics/icons/artificial-boompuff-soil.png",
    category = "crafting",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "boompuff-seed", amount = 2},
      {type = "item", name = "nutrients", amount = 50},
      {type = "item", name = "landfill", amount = 5}
    },
    results = {{type="item", name="artificial-boompuff-soil", amount=10}}
  },
  {
    type = "recipe",
    name = "overgrowth-boompuff-soil",
    icon = "__pbpetrus__/graphics/icons/overgrowth-boompuff-soil.png",
    category = "crafting-with-fluid",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "artificial-boompuff-soil", amount = 2},
      {type = "item", name = "boompuff-seed", amount = 5},
      {type = "item", name = "biter-egg", amount = 10},
      {type = "item", name = "spoilage", amount = 50},
      {type="fluid", name="water", amount=100}
    },
    results = {{type="item", name="overgrowth-boompuff-soil", amount=1}}
  },
  {
    type = "recipe",
    name = "ethanol-from-nutrients",
    icon = "__pbpetrus__/graphics/icons/fluid/ethanol-from-nutrients.png",
    category = "organic",
    subgroup = "agriculture-products",
    order = "a[organic-products]-b[biolubricant]",
    auto_recycle = false,
    energy_required = 3,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "nutrients", amount = 10},
      {type = "fluid", name="water", amount = 20}
    },
    results =
    {
      {type = "fluid", name="ethanol", amount = 20}
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.3, g = 1, b = 0.3, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "lead-plate",
    category = "smelting",
    energy_required = 3.2,
    ingredients = {{type = "item", name = "lead-ore", amount = 1}},
    results = {{type="item", name="lead-plate", amount=1}},
    allow_productivity = true
  },
  --{
  --  type = "recipe",
  --  name = "micro-semi-conductor",
  --  category = "crafting-with-fluid",
  --  enabled = false,
  --  energy_required = 10,
  --  ingredients =
  --  {
  --    {type = "item", name = "advanced-circuit", amount = 10},
  --    {type = "item", name = "processing-unit", amount = 2},
  --    --{type = "fluid", name = "holmium-solution", amount = 5}
  --    {type = "fluid", name = "holmium-waste", amount = 5}
  --  },
  --  results = {{type="item", name="micro-semi-conductor", amount=1}},
  --  allow_productivity = true
  --}
}
)
