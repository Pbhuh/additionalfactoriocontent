data:extend(
{
  {
    type = "recipe",
    name = "uranium-sludge-from-uranium",
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-sludge.png",
    category = "chemistry",
	subgroup = "uranium-processes",
	order = "x[uranium]-a[uranium-sludge]",
    auto_recycle = false,
    energy_required = 3,
    --enabled = false,
    ingredients =
    {
      {type = "item", name = "uranium-ore", amount = 1},
      {type = "fluid", name="sulfuric-acid", amount = 1}
    },
    results =
    {
      {type = "fluid", name="uranium-sludge", amount = 1}
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.49, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "yellowcake-from-uranium-sludge",
    icon = "__pbnuclear__/graphics/icons/yellowcake-U3O8.png",
    category = "crafting-with-fluid",
	--enabled = false,
	energy_required = 10,
	auto_recycle = false,
	ingredients =
	{
	  {type = "fluid", name = "uranium-sludge", amount = 1}
	},
	results = {{type="item", name="yellowcake", amount=1}},
	allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.9, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "uranium-tetrachloride",
    icon = "__pbnuclear__/graphics/icons/uranium-tetrachloride.png",
    category = "crafting-with-fluid",
	--enabled = false,
	energy_required = 10,
	auto_recycle = false,
	ingredients =
	{
	  {type = "fluid", name = "chlorine", amount = 4},
	  {type = "item", name = "yellowcake", amount = 1}
	},
	results = {{type="item", name="uranium-tetrachloride", amount=1}},
	allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.9, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "uranium-hexafluoride-diffusion",
    energy_required = 12,
    enabled = false,
    --category = "centrifuging",
    category = "cryogenics",
    ingredients = {{type = "fluid", name = "uranium-hexafluoride", amount = 10}},
    icon = "__base__/graphics/icons/uranium-processing.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-a[uranium-processing]",
    results =
    {
      {
        type = "fluid",
        name = "uranium-235-hexafluoride",
        probability = 0.007,
        amount = 1
      },
      {
        type = "fluid",
        name = "uranium-238-hexafluoride",
        probability = 0.993,
        amount = 1
      }
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "uranium-hexafluoride",
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-hexafluoride.png",
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-a[acid-neutralisation]",
    auto_recycle = false,
    --enabled = false,
    ingredients =
    {
      {type = "item", name = "yellowcake", amount = 1},
      {type = "fluid", name = "fluorine", amount = 1000},
    },
    energy_required = 5,
    results =
    {
      {type = "fluid", name = "uranium-hexafluoride", amount = 1000}
    },
    allow_productivity = false,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.912, b = 0.036, a = 1.000}, -- #ffe809ff
      secondary = {r = 0.707, g = 0.797, b = 0.335, a = 1.000}, -- #b4cb55ff
      tertiary = {r = 0.681, g = 0.635, b = 0.486, a = 1.000}, -- #ada17bff
      quaternary = {r = 1.000, g = 0.804, b = 0.000, a = 1.000}, -- #ffcd00ff
    }
  },
  {
    type = "recipe",
    name = "uranium-tetrachloride-seperation",
    energy_required = 172,
    enabled = false,
    category = "centrifuging",
    ingredients = {{type = "item", name = "uranium-tetrachloride", amount = 143}},
    icon = "__base__/graphics/icons/uranium-processing.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-a[uranium-processing]",
    results =
    {
      {
        type = "item",
        name = "low-enriched-uranium",
        amount = 1
      },
      {
        type = "item",
        name = "uranium-238",
        amount = 142
      }
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "spent-uranium-fuel-cell-reprocessing", --pyrex process
    energy_required = 10,
    enabled = false,
    category = "centrifuging",
    ingredients = {{type = "item", name = "depleted-uranium-fuel-cell", amount = 5}},
    icon = "__base__/graphics/icons/nuclear-fuel-reprocessing.png",
    subgroup = "uranium-processing",
    order = "b[uranium-products]-b[nuclear-fuel-reprocessing]",
    main_product = "",
    results = 
	{
		{
			type="item", name="uranium-238", amount=4
		},
		{
			type="item", name="plutonium-239", amount=1
		},
	},
    allow_decomposition = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "mixed-oxide-fuel-cell",
    energy_required = 7,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 7},
      {type = "item", name = "plutonium-239", amount = 1},
      {type = "item", name = "yellowcake", amount = 13}
    },
    results = {{type="item", name="mixed-oxide-fuel-cell", amount=7}},
    subgroup = "uranium-processing",
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "plutonium-implosion-bomb",
    enabled = false,
    energy_required = 50,
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 10},
      {type = "item", name = "explosives", amount = 20},
      --{type = "item", name = "battery", amount = 10},
      {type = "item", name = "plutonium-239", amount = 10}
    },
    results = {{type="item", name="atomic-bomb", amount=1}}
  },
}
)
