data:extend(
{
  {
    type = "technology",
    name = "space-platform",
    icon = "__space-age__/graphics/technology/space-platform.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "asteroid-collector"
      },
      {
        type = "unlock-recipe",
        recipe = "crusher"
      },
      {
        type = "unlock-recipe",
        recipe = "metallic-asteroid-crushing"
      },
      {
        type = "unlock-recipe",
        recipe = "carbonic-asteroid-crushing"
      },
      {
        type = "unlock-recipe",
        recipe = "oxide-asteroid-crushing"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-bay"
      }
    },
    prerequisites = {"rocket-silo"},
    research_trigger = {type = "create-space-platform"}
  }

})


data:extend(
{
  {
    type = "technology",
    name = "agriculture",
    icon = "__space-age__/graphics/technology/agriculture.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "agricultural-tower"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-spoilage"
      }
    },
    prerequisites = {"planet-discovery-gleba"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "iron-stromatolite"
    }
  },

  {
    type = "technology",
    name = "yumako",
    icon = "__space-age__/graphics/technology/yumako.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "yumako-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "copper-bacteria"
      }
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "yumako-tree"
    }
  },

  {
    type = "technology",
    name = "jellynut",
    icon = "__space-age__/graphics/technology/jellynut.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "jellynut-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-bacteria"
      }
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "jellystem"
    }
  },
  
  {
    type = "technology",
    name = "boompuff",
    icon = "__pbpetrus__/graphics/technology/boompuff-powder.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "boompuff-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "potassium-bacteria"
      }
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "boompuff"
    }
  },

  {
    type = "technology",
    name = "bioflux",
    icon = "__space-age__/graphics/technology/bioflux.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bioflux"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-bioflux"
      }
    },
    prerequisites = {"biochamber"},
    research_trigger =
    {
      type = "craft-item",
      item = "biochamber"
    }
  },
  
  {
    type = "technology",
    name = "biochamber",
    icon = "__space-age__/graphics/technology/biochamber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "biochamber"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-yumako-mash"
      },
      {
        type = "unlock-recipe",
        recipe = "burnt-spoilage"
      },
      {
        type = "unlock-recipe",
        recipe = "pentapod-egg"
      },
      {
        type = "unlock-recipe",
        recipe = "ethanol-from-nutrients"
      },
      {
        type = "unlock-recipe",
        recipe = "sulfur-from-boompuff"
      }
    },
    prerequisites = {"yumako", "jellynut", "boompuff" },
    research_trigger =
    {
      type = "craft-item",
      item = "nutrients",
      count = 10
    }
  },

  {
    type = "technology",
    name = "artificial-soil",
    icon = "__space-age__/graphics/technology/artificial-soil.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "artificial-yumako-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "artificial-jellynut-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "artificial-boompuff-soil"
      }
    },
    research_trigger =
    {
      type = "craft-item",
      item = "nutrients",
      count = 500
    },
    prerequisites = {"yumako", "boompuff", "jellynut"}
  },

  {
    type = "technology",
    name = "bacteria-cultivation",
    icon = "__space-age__/graphics/technology/bacteria-cultivation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "copper-bacteria-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-bacteria-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "potassium-bacteria-cultivation"
      }
    },
    prerequisites = {"bioflux"},
    research_trigger =
    {
      type = "craft-item",
      item = "bioflux"
    }
  },

  {
    type = "technology",
    name = "bioflux-processing",
    icon = "__space-age__/graphics/technology/bioflux-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bioplastic"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket-fuel-from-jelly"
      },
      --{
      --  type = "unlock-recipe",
      --  recipe = "biosulfur"
      --},
      {
        type = "unlock-recipe",
        recipe = "biolubricant"
      }
    },
    prerequisites = {"bioflux"},
    research_trigger =
    {
      type = "craft-item",
      item = "bioflux",
      count = 25
    }
  },

  {
    type = "technology",
    name = "gleba-explosives",
    icon = "__base__/graphics/technology/explosives.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "explosives-from-niter"
      }
	},
    prerequisites = {"agricultural-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  }

}
)
