--data-final-fixes.lua

-- Generic changes

-- Gleba Rocket Fuel Change
data.raw["recipe"]["rocket-fuel-from-jelly"].ingredients = 
{
	{type = "fluid", name = "ethanol", amount = 10},
	{type = "item", name =  "jelly", amount = 30}
}
data.raw["recipe"]["battery"].ingredients = 
{
      {type = "fluid", name = "sulfuric-acid", amount = 20},
      {type = "item", name = "lead-plate", amount = 2}
}
-- Amyz Changes
-- Productivity 3 changes
--data.raw["recipe"]["productivity-module-3"].ingredients = 
--{
--  {type = "item", name = "productivity-module-2", amount = 4},
--  {type = "item", name = "advanced-circuit", amount = 5},
--  {type = "item", name = "processing-unit", amount = 5},
--  {type = "item", name = "uranium-fuel-cell", amount = 1}
--}
-- Cryo Plant changes
--data.raw["assembling-machine"]["cryogenic-plant"].effect_receiver = { base_effect = { productivity = 0.5 } }
--data.raw["assembling-machine"]["cryogenic-plant"].module_slots = 4

--data.raw["recipe"]["fluoroketone-cooling"].ingredients = { { type = "fluid", name = "fluoroketone-hot", amount = 18 } }
--data.raw["recipe"]["fluoroketone-cooling"].results = { { type = "fluid", name= "fluoroketone-cold", amount = 12 } }
--data.raw["recipe"]["fluoroketone-cooling"].energy_required = 9