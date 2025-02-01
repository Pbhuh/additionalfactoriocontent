data:extend(
{
  --{
  --  type = "recipe",
  --  name = "uranium-sludge-from-uranium",
  --  icon = "__pbnuclear__/graphics/icons/fluid/uranium-sludge.png",
  --  category = "chemistry",
	--subgroup = "uranium-processes",
	--order = "x[uranium]-a[uranium-sludge]",
  --  auto_recycle = false,
  --  energy_required = 3,
  --  --enabled = false,
  --  ingredients =
  --  {
  --    {type = "item", name = "uranium-ore", amount = 1},
  --    {type = "fluid", name="sulfuric-acid", amount = 1}
  --  },
  --  results =
  --  {
  --    {type = "fluid", name="uranium-sludge", amount = 1}
  --  },
  --  allow_productivity = true,
  --  crafting_machine_tint =
  --  {
  --    primary = {r = 0.49, g = 1, b = 0, a = 1.000},
  --    secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
  --  }
  --},
  --{
  --  type = "recipe",
  --  name = "yellowcake-from-uranium-sludge",
  --  icon = "__pbnuclear__/graphics/icons/yellowcake-U3O8.png",
  --  category = "crafting-with-fluid",
	--enabled = false,
	--energy_required = 10,
	--auto_recycle = false,
	--ingredients =
	--{
	--  {type = "fluid", name = "uranium-sludge", amount = 1}
	--},
	--results = {{type="item", name="yellowcake", amount=1}},
	--allow_productivity = true,
  --  crafting_machine_tint =
  --  {
  --    primary = {r = 0.9, g = 1, b = 0, a = 1.000},
  --    secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
  --  }
  --},
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
	  {type = "item", name = "uranium-ore", amount = 1}
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
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-235-hexafluoride.png",
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
    name = "uranium-hexafluoride-diffusion-abstracted",
    energy_required = 22,
    enabled = false,
    --category = "centrifuging",
    category = "cryogenics",
    ingredients = 
    {
      {type = "item", name = "uranium-ore", amount = 10},
      {type = "fluid", name = "hydrofluoric-acid", amount =60},
    },
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-235-hexafluoride.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-a[uranium-processing]",
    results =
    {
      {
        type = "item",
        name = "uranium-235",
        probability = 0.007,
        amount = 10
      },
      {
        type = "fluid",
        name = "uranium-238-hexafluoride",
        probability = 0.993,
        amount = 10
      }
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "uranium-tetrafluoride",
    icon = "__pbnuclear__/graphics/icons/uranium-tetrafluoride.png",
    category = "chemistry",	
	subgroup = "uranium-processing",
	order = "a[uranium-processing]-b[uranium-tetrafluoride]",
	--enabled = false,
	energy_required = 10,
	auto_recycle = false,
	ingredients =
    {
      {type = "item", name = "uranium-ore", amount = 1}, --just using UO2 as it's chemical comp.
      {type = "fluid", name = "hydrofluoric-acid", amount =4},
    },
    energy_required = 5,
    results =
    {
      {type = "item", name = "uranium-tetrafluoride", amount = 1},
      {type = "fluid", name = "water", amount = 2}
    },
	allow_productivity = true,
    main_product = "uranium-tetrafluoride",
    crafting_machine_tint =
    {
      primary = {r = 0.9, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "hydrofluoric-acid",
    icon = "__pbnuclear__/graphics/icons/fluid/hydrofluoric-acid.png",
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-a[acid-neutralisation]",
    auto_recycle = false,
    --enabled = false,
    ingredients =
    {
      {type = "fluid", name = "hydrogen", amount =1},
      {type = "fluid", name = "fluorine", amount =1}
    },
    energy_required = 5,
    results =
    {
      {type = "fluid", name = "hydrofluoric-acid", amount = 2}
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
    name = "uranium-hexafluoride",
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-hexafluoride.png",
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-a[acid-neutralisation]",
    auto_recycle = false,
    --enabled = false,
    ingredients =
    {
      {type = "item", name = "uranium-tetrafluoride", amount = 1},
      {type = "fluid", name = "fluorine", amount = 1},
    },
    energy_required = 5,
    results =
    {
      {type = "fluid", name = "uranium-hexafluoride", amount = 1}
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
    name = "deuterium-enrichment",
    icon = "__pbnuclear__/graphics/icons/fluid/deuterium-atom-large.png",
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-a[acid-neutralisation]",
    auto_recycle = false,
    --enabled = false,
    ingredients =
    {
		  {type = "fluid", name = "water", amount = 10},
		  {type = "fluid", name = "sulfane", amount = 10},
    },
    energy_required = 1,
    results =
    {
		{type="fluid", name="deuterium", amount=1, probability=0.00156},
		{type = "fluid", name = "sulfane", amount = 10},
		{type = "fluid", name = "water", amount = 10}
    },
    allow_productivity = false,
    main_product = "deuterium",
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
  --{
  --  type = "recipe",
  --  name = "uranium-tetrachloride-seperation",
  --  energy_required = 172,
  --  enabled = false,
  --  category = "centrifuging",
  --  ingredients = {{type = "item", name = "uranium-tetrachloride", amount = 143}},
  --  icon = "__base__/graphics/icons/uranium-processing.png",
  --  subgroup = "uranium-processing",
  --  order = "a[uranium-processing]-a[uranium-processing]",
  --  results =
  --  {
  --    {
  --      type = "item",
  --      name = "low-enriched-uranium",
  --      amount = 1
  --    },
  --    {
  --      type = "item",
  --      name = "uranium-238",
  --      amount = 142
  --    }
  --  },
  --  allow_productivity = true
  --},
  {
    type = "recipe",
    name = "uranium-processing",
    energy_required = 12,
    enabled = false,
    category = "centrifuging",
    ingredients = {{type = "item", name = "uranium-tetrachloride", amount = 10}},
    icon = "__base__/graphics/icons/uranium-processing.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-a[uranium-processing]",
    results =
	{
	  {
		type = "item",
		name = "uranium-235",
		probability = 0.007,
		amount = 1
	  },
	  {
		type = "item",
		name = "uranium-238",
		probability = 0.993,
		amount = 1
	  }
	},
    allow_productivity = true
  },
  {
    type = "recipe",
	name = "nuclear-fuel-reprocessing",
    energy_required = 12,
    enabled = false,
    category = "centrifuging",
	ingredients = {
		{type = "item", name = "depleted-uranium-fuel-cell", amount = 1},
		{type = "fluid", name = "nitric-acid", amount = 10}
	},
	icon = "__base__/graphics/icons/nuclear-fuel-reprocessing.png",
	subgroup = "uranium-processing",
	order = "b[uranium-products]-b[nuclear-fuel-reprocessing]",
	main_product = "",
    results = 
	{
		{
			type="item", name="uranium-238", amount=2
		},
		{
			type="item", name="plutonium-239", amount=1, probability = 0.011
		},
	},
    allow_decomposition = false,
    allow_productivity = true
  },
  {
    type = "recipe",
	name = "MOX-fuel-reprocessing",
    energy_required = 12,
    enabled = false,
    category = "centrifuging",
	ingredients = {
		{type = "item", name = "depleted-MOX-fuel-cell", amount = 7},
		{type = "fluid", name = "nitric-acid", amount = 10}
	},
	icon = "__pbnuclear__/graphics/icons/mox-fuel-reprocessing.png",
	subgroup = "uranium-processing",
	order = "b[uranium-products]-b[nuclear-fuel-reprocessing]",
	main_product = "",
    results = 
	{
		{
			type="item", name="uranium-238", amount=13
		},
		{
			type="item", name="plutonium-239", amount=1
		},
		{
			type="item", name="plutonium-239", amount=1, probability = 0.077
		},
	},
    allow_decomposition = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "MOX-fuel-cell",
    energy_required = 7,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 7},
      {type = "item", name = "plutonium-239", amount = 1},
      {type = "item", name = "uranium-238", amount = 13}
    },
    results = {{type="item", name="MOX-fuel-cell", amount=7}},
    subgroup = "uranium-processing",
    allow_productivity = true
  },
  --{
  --  type = "recipe",
  --  name = "weapon-grade-enrichment",
  --  energy_required = 12,
  --  enabled = false,
  --  category = "centrifuging",
  --  ingredients = {{type = "item", name = "low-enriched-uranium", amount = 16}}, --20 for 100% enrichment
  --  icon = "__base__/graphics/icons/uranium-processing.png",
  --  subgroup = "uranium-processing",
  --  order = "a[uranium-processing]-a[uranium-processing]",
  --  results =
  --  {
  --    {
  --      type = "item",
  --      name = "weapon-grade-uranium",
  --      amount = 1
  --    },
  --    {
  --      type = "item",
  --      name = "uranium-238",
  --      amount = 15 --19 for 100% 235
  --    }
  --  },
  --  allow_productivity = true
  --},
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
		results = {{type="item", name="plutonium-implosion-bomb", amount=1}}
	  },
	  {
		type = "recipe",
		name = "plutonium-atom-bomb",
		icon = "__pbnuclear__/graphics/icons/plutonium-implosion-bomb.png",
		subgroup = "ammo",
		order = "d[rocket-launcher]-d[atomic-bomb]",
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
	  {
		type = "recipe",
		name = "uranium-decay",
		icon = "__pbnuclear__/graphics/icons/u238-decay-3.png",
		subgroup = "fluid-recipes",
		category = "crafting-with-fluid",
		auto_recycle = false,
		enabled = false,
		ingredients = {
			{type = "item", name = "uranium-238", amount = 1000}
		},
		energy_required = 100,
		results = {
			{type = "fluid", name = "helium", amount = 1, probability = 0.0022},
			{type = "item", name = "uranium-238", amount = 1, probability = 0.9978},
			{type = "item", name = "uranium-238", amount = 999}
		},
		allow_productivity = true,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.433, g = 0.773, b = 1.000, a = 1.000}, -- #6ec5ffff
		  secondary = {r = 0.591, g = 0.856, b = 1.000, a = 1.000}, -- #96daffff
		  tertiary = {r = 0.381, g = 0.428, b = 0.436, a = 0.502}, -- #616d6f80
		  quaternary = {r = 0.499, g = 0.797, b = 0.793, a = 0.733}, -- #7fcbcabb
		},
		show_amount_in_title = false
	},
	{
		type = "recipe",
		name = "deuterium-venting",
		icon = "__pbnuclear__/graphics/icons/fluid/deuterium-atom-large.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "deuterium", amount = 10}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "tritium-venting",
		icon = "__pbnuclear__/graphics/icons/fluid/tritium-atom-large.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "tritium", amount = 10}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "hydrofluoric-acid-venting",
		icon = "__pbnuclear__/graphics/icons/fluid/hydrofluoric-acid.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "hydrofluoric-acid", amount = 10}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.484, g = 0.241, b = 0.731, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "helium-3-venting",
		icon = "__pbnuclear__/graphics/icons/fluid/helium-atom-large.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "helium-3", amount = 10}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "noble-gas-seperation",
		icon = "__pbnuclear__/graphics/icons/fluid/noble-gas-mixture.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		auto_recycle = false,
		energy_required = 5,
		ingredients = {{type = "fluid", name = "noble-gas-mixture", amount = 10}},
		results = {
			{type="fluid", name="argon", amount=10, probability=0.934},
			{type="fluid", name="neon", amount=1, probability=0.0182},
			{type="fluid", name="helium", amount=1, probability=0.00524},
			{type="fluid", name="krypton", amount=1, probability=0.00114},
			{type="fluid", name="xenon", amount=1, probability=0.0000899999},
		},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "fusion-power-cell",
		category = "cryogenics",
		subgroup = "aquilo-processes",
		order = "c[lithium]-d[fusion-power-cell]",
		auto_recycle = false,
		energy_required = 10,
		ingredients =
		{
		{type = "item", name = "lithium-plate", amount = 10},
		{type = "item", name = "holmium-plate", amount = 1}, --find replacement
		{type = "fluid", name = "deuterium", amount = 5}
		},
		results = {{type="item", name="fusion-power-cell", amount=1}},
		allow_productivity = true,
		enabled = false,
		crafting_machine_tint =
		{
		primary = {r = 0.054, g = 0.897, b = 1.000, a = 1.000}, -- #0de4ffff
		secondary = {r = 1.000, g = 0.779, b = 0.974, a = 1.000}, -- #ffc6f8ff
		tertiary = {r = 0.497, g = 0.655, b = 0.757, a = 1.000}, -- #7ea7c1ff
		quaternary = {r = 0.761, g = 0.312, b = 1.000, a = 1.000}, -- #c14fffff
		}
	},
	{
		type = "recipe",
		name = "seperate-gadolinite-ore", -- (Ce,La,Nd,Y)2FeBe2Si2O10
		icon = "__pbnuclear__/graphics/icons/gadolinite-ore.png",
		category = "crafting",
		auto_recycle = false,
		energy_required = 25,
		ingredients = {{type = "item", name = "gadolinite-ore", amount = 1}},
		results = {
			{type="item", name="scandium", amount=1, probability = 0.01},
			{type="item", name="yttrium-plate", amount=2, probability = 0.25},
			{type="item", name="lanthanum-plate", amount=2, probability = 0.25},
			{type="item", name="cerium-plate", amount=2, probability = 0.25},
			{type="item", name="beryllium-ore", amount=2},
			{type="item", name="silicon-ore", amount=2},
			{type="item", name="iron-ore", amount=1},
			{type="item", name="praesodymium-plate", amount=1, probability = 0.01},
			{type="item", name="neodymium-plate", amount=2, probability = 0.25},
		},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "reprocess-slag",
		icon = "__pbnuclear__/graphics/icons/slag.png",
		category = "crafting",
		auto_recycle = false,
		energy_required = 25,
		ingredients = {{type = "item", name = "slag", amount = 30}},
		results = {
			{type="item", name="stone", amount=20},
			{type="item", name="silicon-ore", amount=10},
			{type="item", name="nickel-plate", amount=1, probability = 0.3},
			{type="item", name="zinc", amount=1, probability = 0.15},
			{type="item", name="manganese", amount=1, probability = 0.25},
		},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "pyromorphite-heating",
		icon = "__pbnuclear__/graphics/icons/pyromorphite-ore.png",
		category = "smelting",
		energy_required = 3.2,
		ingredients = {{type = "item", name = "pyromorphite-ore", amount = 1}},
		results = {
			{type="item", name="lead-plate", amount=5},
			{type="item", name="phosphate", amount=3}
			--{type="fluid", name="chlorine", amount=1}
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "alumina",
		icon = "__outer_moons__/graphics/icons/alumina.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chemical",
		order = "c[alumina]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "aluminate", amount = 1},
		  {type = "fluid", name = "water", amount = 10},
		},
		results =
		{
		  {type = "item", name = "alumina", amount = 3},
		  {type = "item", name = "gallium-metal", amount = 1, probability = 0.1},
		  {type = "item", name = "vanadium", amount = 1, probability = 0.01},
		},
		allow_productivity = true,
		main_product = "alumina",
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
		show_amount_in_title = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		  tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "gold-cable",
		category = "electronics-or-assembling",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/gold-wire.png",
		ingredients = {{type = "item", name = "gold", amount = 1}},
		results = {{type="item", name="copper-cable", amount=3}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "silver-cable",		
		category = "electronics-or-assembling",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/silver-wire.png",
		ingredients = {{type = "item", name = "silver", amount = 1}},
		results = {{type="item", name="copper-cable", amount=4}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "bronze",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/bronze-d-plate.png",
		ingredients = {
			{type = "item", name = "copper-plate", amount = 8},
			{type = "item", name = "tin", amount = 1},
		},
		results = {{type="item", name="bronze", amount=9}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "brass",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/brass-d-plate.png",
		ingredients = {
			{type = "item", name = "copper-plate", amount = 2},
			{type = "item", name = "zinc", amount = 1},
		},
		results = {{type="item", name="brass", amount=3}},
		allow_productivity = true
	},
	--{
	--	type = "recipe",
	--	name = "electrum",
	--	enabled = false,
	--	icon = "__pbnuclear__/graphics/icons/brass-d-plate.png",
	--	ingredients = {
	--		{type = "item", name = "silver", amount = 1},
	--		{type = "item", name = "gold", amount = 1},
	--	},
	--	results = {{type="item", name="brass", amount=3}},
	--	allow_productivity = true
	--},
})	
--Periodic Table
data:extend(
{	
	{
		type = "recipe",
		name = "hydrogen-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/fluid/hydrogen-atom.png",
		subgroup = "row-1",
		order = "a[hydrogen]",
		ingredients = {
			{type = "fluid", name = "hydrogen", amount = 1},
		},
		results = {{type="fluid", name="hydrogen", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "helium-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/fluid/helium-atom-large.png",
		subgroup = "row-1",
		order = "b[helium]",
		ingredients = {
			{type = "fluid", name = "helium", amount = 1},
		},
		results = {{type="fluid", name="helium", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "lithium-element",
		enabled = false,
		icon = "__space-age__/graphics/icons/lithium-plate.png",
		subgroup = "row-2",
		order = "a[lithium]",
		ingredients = {
			{type = "item", name = "lithium-plate", amount = 1},
		},
		results = {{type="item", name="lithium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "beryllium-element",
		enabled = false,
		icon = "__outer_moons__/graphics/icons/beryllium-plate.png",
		subgroup = "row-2",
		order = "b[beryllium]",
		ingredients = {
			{type = "item", name = "beryllium-plate", amount = 1},
		},
		results = {{type="item", name="beryllium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "boron-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/salt.png",
		subgroup = "row-2",
		order = "b[boron]",
		ingredients = {
			{type = "item", name = "boric-acid", amount = 1},
		},
		results = {{type="item", name="boric-acid", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "carbon-element",
		enabled = false,
		icon = "__space-age__/graphics/icons/carbon.png",
		subgroup = "row-2",
		order = "c[carbon]",
		ingredients = {
			{type = "item", name = "carbon", amount = 1},
		},
		results = {{type="item", name="carbon", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "nitrogen-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__outer_moons__/graphics/icons/fluid/nitrogen.png",
		subgroup = "row-2",
		order = "d[nitrogen]",
		ingredients = {
			{type = "fluid", name = "nitrogen", amount = 1},
		},
		results = {{type="fluid", name="nitrogen", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "oxygen-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__outer_moons__/graphics/icons/fluid/oxygen.png",
		subgroup = "row-2",
		order = "e[oxygen]",
		ingredients = {
			{type = "fluid", name = "oxygen", amount = 1},
		},
		results = {{type="fluid", name="oxygen", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "fluorine-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__outer_moons__/graphics/icons/fluid/fluorine.png",
		subgroup = "row-2",
		order = "f[fluorine]",
		ingredients = {
			{type = "fluid", name = "fluorine", amount = 1},
		},
		results = {{type="fluid", name="fluorine", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "neon-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/fluid/neon-pubchem.png",
		subgroup = "row-2",
		order = "f[neon]",
		ingredients = {
			{type = "fluid", name = "neon", amount = 1},
		},
		results = {{type="fluid", name="neon", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "sodium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/salt.png",
		subgroup = "row-3",
		order = "a[sodium]",
		ingredients = {
			{type = "item", name = "salt", amount = 1},
		},
		results = {{type="item", name="salt", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "magnesium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/magnesium-plate.png",
		subgroup = "row-3",
		order = "b[magnesium]",
		ingredients = {
			{type = "item", name = "magnesium-plate", amount = 1},
		},
		results = {{type="item", name="magnesium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "aluminium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/aluminum-plate.png",
		subgroup = "row-3",
		order = "c[aluminium]",
		ingredients = {
			{type = "item", name = "aluminum-plate", amount = 1},
		},
		results = {{type="item", name="aluminum-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "silicon-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/silicon-wafer.png",
		subgroup = "row-3",
		order = "d[silicon]",
		ingredients = {
			{type = "item", name = "silicon-wafer", amount = 1},
		},
		results = {{type="item", name="silicon-wafer", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "phosphorus-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/phosphate.png",
		subgroup = "row-3",
		order = "e[phosphorus]",
		ingredients = {
			{type = "item", name = "phosphate", amount = 1},
		},
		results = {{type="item", name="phosphate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "sulfur-element",
		enabled = false,
        icon = "__base__/graphics/icons/sulfur.png",
		subgroup = "row-3",
		order = "f[sulfur]",
		ingredients = {
			{type = "item", name = "sulfur", amount = 1},
		},
		results = {{type="item", name="sulfur", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "chlorine-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__outer_moons__/graphics/icons/fluid/chlorine.png",
		subgroup = "row-3",
		order = "g[chlorine]",
		ingredients = {
			{type = "fluid", name = "chlorine", amount = 1},
		},
		results = {{type="fluid", name="chlorine", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "argon-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/fluid/argon-pubchem.png",
		subgroup = "row-3",
		order = "h[argon]",
		ingredients = {
			{type = "fluid", name = "argon", amount = 1},
		},
		results = {{type="fluid", name="argon", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "potassium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/potassium-salt.png",
		subgroup = "row-4",
		order = "a[potassium]",
		ingredients = {
			{type = "item", name = "potassium-salt", amount = 1},
		},
		results = {{type="item", name="potassium-salt", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "calcium-element",
		enabled = false,
        icon = "__space-age__/graphics/icons/calcite.png",
		subgroup = "row-4",
		order = "b[calcium]",
		ingredients = {
			{type = "item", name = "calcite", amount = 1},
		},
		results = {{type="item", name="calcite", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "scandium-element",
		enabled = false,
        icon = "__base__/graphics/icons/iron-plate.png",
		subgroup = "row-4",
		order = "b[scandium]",
		ingredients = {
			{type = "item", name = "scandium", amount = 1},
		},
		results = {{type="item", name="scandium", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "titanium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/titanium-plate.png",
		subgroup = "row-4",
		order = "b[titanium]",
		ingredients = {
			{type = "item", name = "titanium-plate", amount = 1},
		},
		results = {{type="item", name="titanium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "vanadium-element",
		enabled = false,
        icon = "__base__/graphics/icons/iron-plate.png",
		subgroup = "row-4",
		order = "b[vanadium]",
		ingredients = {
			{type = "item", name = "vanadium", amount = 1},
		},
		results = {{type="item", name="vanadium", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "chromium-element",
		enabled = false,
        icon = "__base__/graphics/icons/iron-plate.png",
		subgroup = "row-4",
		order = "c[chromium]",
		ingredients = {
			{type = "item", name = "chromium", amount = 1},
		},
		results = {{type="item", name="chromium", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "manganese-element",
		enabled = false,
        icon = "__base__/graphics/icons/iron-plate.png",
		subgroup = "row-4",
		order = "c[manganese]",
		ingredients = {
			{type = "item", name = "manganese", amount = 1},
		},
		results = {{type="item", name="manganese", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "iron-element",
		enabled = false,
        icon = "__base__/graphics/icons/iron-plate.png",
		subgroup = "row-4",
		order = "d[iron]",
		ingredients = {
			{type = "item", name = "iron-plate", amount = 1},
		},
		results = {{type="item", name="iron-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "cobalt-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/cobalt-plate.png",
		subgroup = "row-4",
		order = "e[cobalt]",
		ingredients = {
			{type = "item", name = "cobalt-plate", amount = 1},
		},
		results = {{type="item", name="cobalt-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "nickel-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/nickel-plate.png",
		subgroup = "row-4",
		order = "e[nickel]",
		ingredients = {
			{type = "item", name = "nickel-plate", amount = 1},
		},
		results = {{type="item", name="nickel-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "copper-element",
		enabled = false,
        icon = "__base__/graphics/icons/copper-plate.png",
		subgroup = "row-4",
		order = "f[copper]",
		ingredients = {
			{type = "item", name = "copper-plate", amount = 1},
		},
		results = {{type="item", name="copper-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "zinc-element",
		enabled = false,
        icon = "__base__/graphics/icons/iron-plate.png",
		subgroup = "row-4",
		order = "f[zinc]",
		ingredients = {
			{type = "item", name = "zinc", amount = 1},
		},
		results = {{type="item", name="zinc", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "gallium-element",
		enabled = false,
        icon = "__pbnuclear__/graphics/icons/gallium-metal.png",
		subgroup = "row-4",
		order = "g[gallium]",
		ingredients = {
			{type = "item", name = "gallium-metal", amount = 1},
		},
		results = {{type="item", name="gallium-metal", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "germanium-element",
		enabled = false,
        icon = "__pbnuclear__/graphics/icons/germanium-metal.png",
		subgroup = "row-4",
		order = "g[germanium]",
		ingredients = {
			{type = "item", name = "germanium-metal", amount = 1},
		},
		results = {{type="item", name="germanium-metal", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "arsenic-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/arsenic.png",
		subgroup = "row-4",
		order = "h[arsenic]",
		ingredients = {
			{type = "item", name = "arsenic", amount = 1},
		},
		results = {{type="item", name="arsenic", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "selenium-element",
		enabled = false,
        icon = "__base__/graphics/icons/iron-plate.png",
		subgroup = "row-4",
		order = "h[selenium]",
		ingredients = {
			{type = "item", name = "iron-plate", amount = 1},
		},
		results = {{type="item", name="iron-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "bromine-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/fluid/bromine.png",
		subgroup = "row-4",
		order = "i[bromine]",
		ingredients = {
			{type = "fluid", name = "bromine", amount = 1},
		},
		results = {{type="fluid", name="bromine", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "krypton-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/fluid/krypton-pubchem.png",
		subgroup = "row-4",
		order = "i[krypton]",
		ingredients = {
			{type = "fluid", name = "krypton", amount = 1},
		},
		results = {{type="fluid", name="krypton", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "yttrium-element",
		enabled = false,
        icon = "__pbnuclear__/graphics/icons/yttrium-plate.png",
		subgroup = "row-5",
		order = "c[yttrium]",
		ingredients = {
			{type = "item", name = "yttrium-plate", amount = 1},
		},
		results = {{type="item", name="yttrium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "zirconium-element",
		enabled = false,
        icon = "__pbnuclear__/graphics/icons/zirconium-metal.png",
		subgroup = "row-5",
		order = "c[zirconium]",
		ingredients = {
			{type = "item", name = "zirconium-metal", amount = 1},
		},
		results = {{type="item", name="zirconium-metal", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "silver-element",
		enabled = false,
        icon = "__pbnuclear__/graphics/icons/silver-bar.png",
		subgroup = "row-5",
		order = "d[silver]",
		ingredients = {
			{type = "item", name = "silver", amount = 1},
		},
		results = {{type="item", name="silver", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "indium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/indium-wafer.png",
		subgroup = "row-5",
		order = "e[indium]",
		ingredients = {
			{type = "item", name = "indium-wafer", amount = 1},
		},
		results = {{type="item", name="indium-wafer", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "tin-element",
		enabled = false,
        icon = "__pbnuclear__/graphics/icons/tin-can.png",
		subgroup = "row-5",
		order = "f[tin]",
		ingredients = {
			{type = "item", name = "tin", amount = 1},
		},
		results = {{type="item", name="tin", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "antimony-element",
		enabled = false,
        icon = "__base__/graphics/icons/iron-plate.png",
		subgroup = "row-5",
		order = "g[antimony]",
		ingredients = {
			{type = "item", name = "iron-plate", amount = 1},
		},
		results = {{type="item", name="iron-plate", amount=1}},
		allow_productivity = false
	},
	--{
	--	type = "recipe",
	--	name = "tellurium-element",
	--	enabled = false,
	--	subgroup = "row-5",
	--	order = "f[tellurium]",
	--	ingredients = {
	--		{type = "item", name = "germanium-metal", amount = 1},
	--	},
	--	results = {{type="item", name="germanium-metal", amount=1}},
	--	allow_productivity = false
	--},
	{
		type = "recipe",
		name = "iodine-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__outer_moons__/graphics/icons/fluid/iodine.png",
		subgroup = "row-5",
		order = "g[krypton]",
		ingredients = {
			{type = "fluid", name = "iodine", amount = 1},
		},
		results = {{type="fluid", name="iodine", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "iodine-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__outer_moons__/graphics/icons/fluid/iodine.png",
		subgroup = "row-5",
		order = "g[krypton]",
		ingredients = {
			{type = "fluid", name = "iodine", amount = 1},
		},
		results = {{type="fluid", name="iodine", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "xenon-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/fluid/xenon-pubchem.png",
		subgroup = "row-5",
		order = "g[krypton]",
		ingredients = {
			{type = "fluid", name = "xenon", amount = 1},
		},
		results = {{type="fluid", name="xenon", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "lanthanum-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/lanthanum-plate.png",
		subgroup = "row-6",
		order = "a[lanthanum]",
		ingredients = {
			{type = "item", name = "lanthanum-plate", amount = 1},
		},
		results = {{type="item", name="lanthanum-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "lanthanum-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/lanthanum-plate.png",
		subgroup = "row-6",
		order = "a[lanthanum]",
		ingredients = {
			{type = "item", name = "lanthanum-plate", amount = 1},
		},
		results = {{type="item", name="lanthanum-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "cerium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/cerium-plate.png",
		subgroup = "row-6",
		order = "a[cerium]",
		ingredients = {
			{type = "item", name = "cerium-plate", amount = 1},
		},
		results = {{type="item", name="cerium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "neodymium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/neodymium-plate.png",
		subgroup = "row-6",
		order = "a[neodymium]",
		ingredients = {
			{type = "item", name = "neodymium-plate", amount = 1},
		},
		results = {{type="item", name="neodymium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "holmium-element",
		enabled = false,
        icon = "__space-age__/graphics/icons/holmium-plate.png",
		subgroup = "row-6",
		order = "b[holmium]",
		ingredients = {
			{type = "item", name = "holmium-plate", amount = 1},
		},
		results = {{type="item", name="holmium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "tungsten-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/tungsten-plate.png",
		subgroup = "row-6",
		order = "b[tungsten]",
		ingredients = {
			{type = "item", name = "tungsten-plate", amount = 1},
		},
		results = {{type="item", name="tungsten-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "osmium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/osmium-plate.png",
		subgroup = "row-6",
		order = "c[osmium]",
		ingredients = {
			{type = "item", name = "osmium-plate", amount = 1},
		},
		results = {{type="item", name="osmium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "iridium-element",
		enabled = false,
        icon = "__outer_moons__/graphics/icons/iridium-plate.png",
		subgroup = "row-6",
		order = "c[yridium]",
		ingredients = {
			{type = "item", name = "iridium-plate", amount = 1},
		},
		results = {{type="item", name="iridium-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "platinum-element",
		enabled = false,
        icon = "__pbnuclear__/graphics/icons/platinum-bar.png",
		subgroup = "row-6",
		order = "c[zplatinum]",
		ingredients = {
			{type = "item", name = "gold", amount = 1},
		},
		results = {{type="item", name="gold", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "gold-element",
		enabled = false,
        icon = "__pbnuclear__/graphics/icons/gold-bar.png",
		subgroup = "row-6",
		order = "d[gold]",
		ingredients = {
			{type = "item", name = "gold", amount = 1},
		},
		results = {{type="item", name="gold", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "mercury-element",
		category = "crafting-with-fluid",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/fluid/mercury.png",
		subgroup = "row-6",
		order = "d[mercury]",
		ingredients = {
			{type = "fluid", name = "mercury", amount = 1},
		},
		results = {{type="fluid", name="mercury", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "lead-element",
		enabled = false,
		icon = "__outer_moons__/graphics/icons/lead-plate.png",
		subgroup = "row-6",
		order = "e[lead]",
		ingredients = {
			{type = "item", name = "lead-plate", amount = 1},
		},
		results = {{type="item", name="lead-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "bismuth-element",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/bismuth-plate.png",
		subgroup = "row-6",
		order = "f[bismuth]",
		ingredients = {
			{type = "item", name = "bismuth-plate", amount = 1},
		},
		results = {{type="item", name="bismuth-plate", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "thorium-element",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/thorium-232.png",
		subgroup = "row-7",
		order = "a[thorium]",
		ingredients = {
			{type = "item", name = "uranium-238", amount = 1},
		},
		results = {{type="item", name="uranium-238", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "uranium-element",
		enabled = false,
		icon = "__base__/graphics/icons/uranium-238.png",
		subgroup = "row-7",
		order = "b[uranium]",
		ingredients = {
			{type = "item", name = "uranium-238", amount = 1},
		},
		results = {{type="item", name="uranium-238", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "neptunium-element",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/neptunium-237.png",
		subgroup = "row-7",
		order = "c[neptunium]",
		ingredients = {
			{type = "item", name = "uranium-238", amount = 1},
		},
		results = {{type="item", name="uranium-238", amount=1}},
		allow_productivity = false
	},
	{
		type = "recipe",
		name = "plutonium-element",
		enabled = false,
		icon = "__outer_moons__/graphics/icons/plutonium-239.png",
		subgroup = "row-7",
		order = "d[plutonium]",
		ingredients = {
			{type = "item", name = "plutonium-239", amount = 1},
		},
		results = {{type="item", name="plutonium-239", amount=1}},
		allow_productivity = false
	},
})
