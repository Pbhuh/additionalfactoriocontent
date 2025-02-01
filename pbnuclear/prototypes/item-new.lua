local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local meld = require("meld")

---Creates a basic item
---@param name string name of the item
---@param stack_size integer? The stack size of the item
---@param weight integer? The weight of the item
---@param glow boolean? Does this item glow?
---@param size int? The size of the icon image
---@param extra table? Extra parameters to set?
---@return table
local function quick_item(name, stack_size, weight, glow, extra)
    return meld({
        type = "item",
        name = name,
        subgroup = "intermediate-product",
        stack_size = stack_size or 100,
        icon = "__outer_moons__/graphics/icons/" .. name .. ".png",
        pictures = {
            size = 64,
            filename = "__outer_moons__/graphics/icons/" .. name .. ".png",
            scale = 0.5,
            draw_as_glow = glow or false,
        },
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        weight = weight or (2 * kg)
    }, extra or {})
end

data:extend(
{
	{
		type = "item",
		name = "uranium-tetrachloride",
		icon = "__pbnuclear__/graphics/icons/uranium-tetrachloride.png",
		subgroup = "uranium-processing",
		color_hint = { text = "+" },
		order = "a[uranium-processing]-b[uranium-tetrachloride]",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 100,
		random_tint_color = item_tints.iron_rust,
		weight = 5*kg
	},
	{
		type = "item",
		name = "uranium-tetrafluoride",
		icon = "__pbnuclear__/graphics/icons/uranium-tetrafluoride.png",
		subgroup = "uranium-processing",
		order = "a[uranium-processing]-b[uranium-tetrafluoride]",
		color_hint = { text = "+" },
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 100,
		random_tint_color = item_tints.iron_rust,
		weight = 5*kg
	},
	{
		type = "item",
		name = "low-enriched-uranium",
		icon = "__pbnuclear__/graphics/icons/low-enriched-uranium.png",
		pictures =
		{
		layers =
		{
			{
			size = 64,
			filename = "__pbnuclear__/graphics/icons/low-enriched-uranium.png",
			scale = 0.5,
			mipmap_count = 4
			},
			{
			draw_as_light = true,
			blend_mode = "additive",
			size = 64,
			filename = "__pbnuclear__/graphics/icons/low-enriched-uranium.png",
			scale = 0.5,
			tint = {0.3, 0.3, 0.3, 0.3}
			}
		}
		},
		--subgroup = "uranium-processing",
		color_hint = { text = "+" },
		--order = "a[uranium-processing]-d[low-enriched-uranium]",
		inventory_move_sound = item_sounds.nuclear_inventory_move,
		pick_sound = item_sounds.nuclear_inventory_pickup,
		drop_sound = item_sounds.nuclear_inventory_move,
		stack_size = 100,
		weight = 50*kg
	},
	{
		type = "ammo",
		name = "plutonium-implosion-bomb",
		icon = "__pbnuclear__/graphics/icons/plutonium-implosion-bomb.png",
		pictures =
		{
		layers =
		{
			{
			size = 64,
			filename = "__pbnuclear__/graphics/icons/plutonium-implosion-bomb.png",
			scale = 0.5,
			mipmap_count = 4
			},
			{
			draw_as_light = true,
			size = 64,
			filename = "__pbnuclear__/graphics/icons/plutonium-implosion-bomb-light.png",
			scale = 0.5
			}
		}
		},
		ammo_category = "rocket",
		ammo_type =
		{
		range_modifier = 1.5,
		cooldown_modifier = 10,
		target_type = "position",
		action =
		{
			type = "direct",
			action_delivery =
			{
			type = "projectile",
			projectile = "atomic-rocket", --plutonium-rocket
			starting_speed = 0.05,
			source_effects =
			{
				type = "create-entity",
				entity_name = "explosion-hit"
			}
			}
		}
		},
		subgroup = "ammo",
		order = "d[rocket-launcher]-d[atomic-bomb]",
		inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
		pick_sound = item_sounds.atomic_bomb_inventory_pickup,
		drop_sound = item_sounds.atomic_bomb_inventory_move,
		stack_size = 10,
		weight = 1.5 * tons
	},
	{
		type = "ammo",
		name = "thermonuclear-bomb",
		icon = "__pbnuclear__/graphics/icons/thermonuclear-bomb.png",
		pictures =
		{
		layers =
		{
			{
			size = 64,
			filename = "__pbnuclear__/graphics/icons/thermonuclear-bomb.png",
			scale = 0.5,
			mipmap_count = 4
			},
			{
			draw_as_light = true,
			size = 64,
			filename = "__pbnuclear__/graphics/icons/plutonium-implosion-bomb-light.png",
			scale = 0.5
			}
		}
		},
		ammo_category = "rocket",
		ammo_type =
		{
		range_modifier = 1.5,
		cooldown_modifier = 10,
		target_type = "position",
		action =
		{
			type = "direct",
			action_delivery =
			{
			type = "projectile",
			projectile = "thermonuclear-rocket",
			starting_speed = 0.05,
			source_effects =
			{
				type = "create-entity",
				entity_name = "explosion-hit"
			}
			}
		}
		},
		subgroup = "ammo",
		order = "d[rocket-launcher]-d[atomic-bomb]",
		inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
		pick_sound = item_sounds.atomic_bomb_inventory_pickup,
		drop_sound = item_sounds.atomic_bomb_inventory_move,
		stack_size = 10,
		weight = 1.5 * tons
	},
	{
		type = "item",
		name = "diamond",
		icon = "__pbnuclear__/graphics/icons/diamond.png",
		subgroup = "aiolos-processes",
		order = "e[diamonds]",
		inventory_move_sound = item_sounds.wire_inventory_move,
		pick_sound = item_sounds.wire_inventory_pickup,
		drop_sound = item_sounds.wire_inventory_move,
		stack_size = 200,
		default_import_location = "aiolos",
		ingredient_to_weight_coefficient = 0.6
	},
	{
        type = "item",
        name = "pyromorphite-ore",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/pyromorphite-ore.png",
		subgroup = "raw-resource",
		color_hint = { text = "C" },
		order = "r[pyromorphite-ore]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "borax-ore",
        group = "intermediate-products",
        icon = "__outer_moons__/graphics/icons/magnesium-ore.png",
        pictures =
		{
		  { size = 64, filename = "__outer_moons__/graphics/icons/magnesium-ore.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__outer_moons__/graphics/icons/magnesium-ore-2.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__outer_moons__/graphics/icons/magnesium-ore-3.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__outer_moons__/graphics/icons/magnesium-ore-4.png", scale = 0.5, mipmap_count = 4 },
		},
		subgroup = "raw-resource",
		color_hint = { text = "C" },
		order = "p[borax-ore]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "boric-acid",
        group = "intermediate-products",
        icon = "__outer_moons__/graphics/icons/salt.png",
        pictures =
		{
		  { size = 64, filename = "__outer_moons__/graphics/icons/magnesium-ore.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__outer_moons__/graphics/icons/magnesium-ore-2.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__outer_moons__/graphics/icons/magnesium-ore-3.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__outer_moons__/graphics/icons/magnesium-ore-4.png", scale = 0.5, mipmap_count = 4 },
		},
        subgroup = "chemical",
		default_import_location = "nauvis",
        order = "k[salt]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	-- Rare-Earth Metals	
	{
        type = "item",
        name = "gadolinite-ore",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/gadolinite-ore.png",
		subgroup = "raw-resource",
		color_hint = { text = "C" },
		order = "q[gadolinite-ore]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "monazite",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/monazite.png",
		subgroup = "raw-resource",
		color_hint = { text = "C" },
		order = "q[monazite]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "scandium",
        group = "intermediate-products",
        icon = "__base__/graphics/icons/iron-plate.png",
        subgroup = "rare-earth",
		default_import_location = "nauvis",
        order = "k[scandium]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "yttrium-plate",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/yttrium-plate.png",
        subgroup = "rare-earth",
		default_import_location = "nauvis",
        order = "k[yttrium]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "praesodymium-plate",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/praesodymium-plate.png",
        subgroup = "rare-earth",
		default_import_location = "nauvis",
        order = "m[praesodymium]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	--Foundry excess
	{
        type = "item",
        name = "slag",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/slag.png",
        subgroup = "vulcanus-processes",
		order = "a[melting]-a[slag]",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 50,
		default_import_location = "vulcanus",
        weight = 2 * kg
    },
	-- Alloying Elements
	---Vanadium ores: Carnotite: Potassium Uranium Vanadate - K2(UO2)2(VO4)2·3H2O - Patrónite VS4 -- Bauxite
	{
        type = "item",
        name = "vanadium",
        group = "intermediate-products",
        icon = "__base__/graphics/icons/iron-plate.png",
        subgroup = "alloying-element",
		default_import_location = "nauvis",
        order = "n[vanadium]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{ --Chromium (Cr) increases stress corrosion resistance.
        type = "item",
        name = "chromium",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/chromium-metal.png",
        subgroup = "alloying-element",
		default_import_location = "nauvis",
        order = "o[chromium]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{ --Manganese (Mn) increases strength through solid solution strengthening and improves work hardening ability.
        type = "item",
        name = "manganese",
        group = "intermediate-products",
        icon = "__base__/graphics/icons/iron-plate.png",
        subgroup = "alloying-element",
		default_import_location = "nauvis",
        order = "o[manganese]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "zinc",
        group = "intermediate-products",
        icon = "__base__/graphics/icons/iron-plate.png",
        subgroup = "alloying-element",
		default_import_location = "nauvis",
        order = "o[zinc]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "tin",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/tin-can.png",
        subgroup = "alloying-element",
		default_import_location = "nauvis",
        order = "o[tin]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "zirconium-metal",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/zirconium-metal.png",
		subgroup = "alloy",
		default_import_location = "nauvis",
        order = "f[brass]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	--Precious Metals
	{
        type = "item",
        name = "silver",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/silver-bar.png",
        subgroup = "precious-metals",
		default_import_location = "nauvis",
        order = "o[tin]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "gold",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/gold-bar.png",
        subgroup = "precious-metals",
		default_import_location = "nauvis",
        order = "o[tin]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 10 * kg
    },
	{
        type = "item",
        name = "platinum",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/platinum-bar.png",
        subgroup = "precious-metals",
		default_import_location = "nauvis",
        order = "o[tin]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 10 * kg
    },
	{
		type = "item",
		name = "bismuth-plate",		
        group = "raw-material",
		icon = "__pbnuclear__/graphics/icons/bismuth-plate.png",
		subgroup = "raw-material",
		order = "c[lead-plate]",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 100,
		weight = 1 * kg,
	},
	--Alloys	
	{
        type = "item",
        name = "bronze",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/bronze-d-plate.png",
		subgroup = "alloy",
		default_import_location = "nauvis",
        order = "e[bronze]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "brass",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/brass-d-plate.png",
		subgroup = "alloy",
		default_import_location = "nauvis",
        order = "f[brass]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "electrum",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/electrum-plate.png",
		subgroup = "alloy",
		default_import_location = "nauvis",
        order = "f[electrum]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "cupronickel",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/cupronickel-plate.png",
		subgroup = "alloy",
		default_import_location = "nauvis",
        order = "g[cupronickel]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	-- Metalloids / Semiconductors
	{
        type = "item",
        name = "gallium-metal",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/gallium-metal.png",
        subgroup = "chemical",
		default_import_location = "nauvis",
        order = "n[vanadium]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "germanium-metal",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/gallium-metal.png",
        subgroup = "chemical",
		default_import_location = "nauvis",
        order = "n[vanadium]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "germanium-wafer",
        group = "intermediate-products",
        icon = "__pbnuclear__/graphics/icons/germanium-wafer.png",
        subgroup = "chemical",
		default_import_location = "nauvis",
        order = "n[vanadium]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
	--extra
	{
		type = "item",
		name = "assembling-machine-solar-roof",
		icon = "__pbnuclear__/graphics/icons/assembling-machine-solar-roof.png",
		subgroup = "production-machine",
		color_hint = { text = "1" },
		order = "a[assembling-machine-1s]",
		inventory_move_sound = item_sounds.mechanical_inventory_move,
		pick_sound = item_sounds.mechanical_inventory_pickup,
		drop_sound = item_sounds.mechanical_inventory_move,
		place_result = "assembling-machine-solar-roof",
		stack_size = 50,
		random_tint_color = item_tints.iron_rust
	},
	{
		type = "item",
		name = "rubber-tree-seed",
		localised_name = {"item-name.funneltrunk-seed"},
		icon = "__outer_moons__/graphics/icons/funneltrunk-seed.png",
		pictures =
		{
		  { size = 64, filename = "__outer_moons__/graphics/icons/funneltrunk-seed.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__outer_moons__/graphics/icons/funneltrunk-seed-2.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__outer_moons__/graphics/icons/funneltrunk-seed-3.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__outer_moons__/graphics/icons/funneltrunk-seed-4.png", scale = 0.5, mipmap_count = 4 },
		},
		subgroup = "agriculture-processes",
		order = "b[seeds]-d[funneltrunk-seed]",
		plant_result = "rubber-tree",
		place_result = "rubber-tree",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 10,
		weight = 10 * kg,
		fuel_category = "chemical",
		fuel_value = "4MJ"
	},
	{
		type = "item",
		name = "treetap",
		icon = "__pbnuclear__/graphics/icons/treetap.png",
		subgroup = "extraction-machine",
		order = "b[fluids]-b[pumpjack]",
		inventory_move_sound = item_sounds.pumpjack_inventory_move,
		pick_sound = item_sounds.pumpjack_inventory_pickup,
		drop_sound = item_sounds.pumpjack_inventory_move,
		place_result = "treetap",
		stack_size = 20
	},
	--{
    --    type = "item",
    --    name = "vanadinite", --Pb5(VO4)3Cl
    --    group = "intermediate-products",
    --    icon = "__pbnuclear__/graphics/icons/vanadinite.png",
	--	subgroup = "raw-resource",
	--	color_hint = { text = "C" },
	--	order = "q[vanadinite]",
    --    inventory_move_sound = item_sounds.resource_inventory_move,
    --    pick_sound = item_sounds.resource_inventory_pickup,
    --    drop_sound = item_sounds.resource_inventory_move,
    --    stack_size = 50,
    --    weight = 2 * kg
    --},
})