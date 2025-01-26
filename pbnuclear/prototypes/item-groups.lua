data:extend(
{{
    type = "item-group",
    name = "periodic-table",
    order = "a",
    icon = "__base__/graphics/item-group/logistics.png",
    icon_size = 128,
  },
  ---Periodic Table
  {
    type = "item-subgroup",
    name = "row-1",
    group = "periodic-table",
    order = "a-b"
  },
  {
    type = "item-subgroup",
    name = "row-2",
    group = "periodic-table",
    order = "a-h"
  },
  {
    type = "item-subgroup",
    name = "row-3",
    group = "periodic-table",
    order = "a-h"
  },
  {
    type = "item-subgroup",
    name = "row-4",
    group = "periodic-table",
    order = "a-t"
  },
  --- Intermediates
  {
    type = "item-subgroup",
    name = "rare-earth",
    group = "intermediate-products",
    order = "c-e"
  },
  {
    type = "item-subgroup",
    name = "alloying-element",
    group = "intermediate-products",
    order = "c-b"
  },
  {
    type = "item-subgroup",
    name = "precious-metals",
    group = "intermediate-products",
    order = "c-c"
  },
}
)
