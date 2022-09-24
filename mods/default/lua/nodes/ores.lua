-- mods/default/lua/nodes/ores.lua
-- ===============================
-- See README.txt for licensing and other information.

-- Minerals

local stones = {
	{"stone"},
	{"sandstone"},
	{"desert_stone"}
}

for _,stone in pairs(stones) do
	stone = stone[1]
	default.register_node("default:" .. stone .. "_with_coal", {
		description = "Coal Ore",
		tiles = {"default_" .. stone .. ".png^default_mineral_coal.png"},
		groups = {cracky = 3, not_in_creative_inventory = 1},
		drop = 'default:coal_lump',
		sounds = default.node_sound_stone_defaults(),
	})

	default.register_node("default:" .. stone .. "_with_iron", {
		description = "Iron Ore",
		tiles = {"default_" .. stone .. ".png^default_mineral_iron.png"},
		groups = {cracky = 2, not_in_creative_inventory = 1},
		drop = 'default:iron_lump',
		sounds = default.node_sound_stone_defaults(),
	})

	default.register_node("default:" .. stone .. "_with_copper", {
		description = "Copper Ore",
		tiles = {"default_" .. stone .. ".png^default_mineral_copper.png"},
		groups = {cracky = 2, not_in_creative_inventory = 1},
		drop = 'default:copper_lump',
		sounds = default.node_sound_stone_defaults(),
	})

	default.register_node("default:" .. stone .. "_with_mese", {
		description = "Mese Ore",
		tiles = {"default_" .. stone .. ".png^default_mineral_mese.png"},
		paramtype = "light",
		groups = {cracky = 1, not_in_creative_inventory = 1},
		drop = "default:mese_crystal",
		sounds = default.node_sound_stone_defaults(),
		light_source = 1,
	})

	default.register_node("default:" .. stone .. "_with_diamond", {
		description = "Diamond Ore",
		tiles = {"default_" .. stone .. ".png^default_mineral_diamond.png"},
		groups = {cracky = 1, not_in_creative_inventory = 1},
		drop = "default:diamond",
		sounds = default.node_sound_stone_defaults(),
	})
	
	default.register_node("default:" .. stone .. "_with_MITHRIL", {
		description = "Mithril Ore",
		tiles = {"default_" .. stone .. ".png^default_mineral_mithril.png"},
		groups = {cracky = 1, not_in_creative_inventory = 0},
		drop = "default:mithril_ore",
		sounds = default.node_sound_stone_defaults(),
	})

	default.register_node("default:" .. stone .. "_with_gold", {
		description = "Gold Ore",
		tiles = {"default_" .. stone .. ".png^default_mineral_gold.png"},
		drop = "default:gold_lump",
		groups = {cracky = 2, not_in_creative_inventory = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	default.register_node("default:" .. stone .. "_with_salt", {
		description = "Salt Ore",
		tiles = {"default_" .. stone .. ".png^default_mineral_salt.png"},
		groups = {cracky = 2, not_in_creative_inventory = 1},
		drop = {
			max_items = 5,
			items = {
				{items = {"default:salt 2"}},
				{items = {"default:salt"}, rarity = 2},
				{items = {"default:salt"}, rarity = 3},
				{items = {"default:salt"}, rarity = 5}
			}
		},
		sounds = default.node_sound_stone_defaults(),
	})
end



-- Blocks

default.register_node("default:mese", {
	description = "Mese Block",
	tiles = {"default_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	light_source = 3,
})

default.register_node("default:coalblock", {
	register = {stair = true, slab = true},
	description = "Coal Block",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3, fuel = 370},
	sounds = default.node_sound_stone_defaults(),
})

default.register_node("default:steelblock", {
	register = {stair = true, slab = true},
	description = "Steel Block",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_steelblock"},
	slab = {legacy_alias = "stairs:slab_steelblock"},
})

default.register_node("default:copperblock", {
	register = {stair = true, slab = true},
	description = "Copper Block",
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_copperblock"},
	slab = {legacy_alias = "stairs:slab_copperblock"},
})

default.register_node("default:bronzeblock", {
	register = {stair = true, slab = true},
	description = "Bronze Block",
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_bronzeblock"},
	slab = {legacy_alias = "stairs:slab_bronzeblock"},
})

default.register_node("default:mithrilblock", {
	register = {stair = true, slab = true},
	description = "Mitrhil Block",
	tiles = {"default_mithril_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_mithrilblock"},
	slab = {legacy_alias = "stairs:slab_mithrilblock"},
})

default.register_node("default:goldblock", {
	register = {stair = true, slab = true},
	description = "Gold Block",
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_goldblock"},
	slab = {legacy_alias = "stairs:slab_goldblock"},
})

default.register_node("default:diamondblock", {
	register = {stair = true, slab = true},
	description = "Diamond Block",
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
	stair = {legacy_alias = "stairs:stair_diamondblock"},
	slab = {legacy_alias = "stairs:slab_diamondblock"},
})

default.register_node("default:saltblock", {
	register = {stair = true, slab = true},
	description = "Salt Block",
	tiles = {"default_salt_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})


--
-- Crafting
--

core.register_craft({
	output = "default:mese",
	recipe = {
		{"default:mese_crystal", "default:mese_crystal", "default:mese_crystal"},
		{"default:mese_crystal", "default:mese_crystal", "default:mese_crystal"},
		{"default:mese_crystal", "default:mese_crystal", "default:mese_crystal"},
	}
})

core.register_craft({
	output = "default:coalblock",
	recipe = {
		{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
		{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
		{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
	}
})

core.register_craft({
	output = "default:steelblock",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	}
})

core.register_craft({
	output = "default:copperblock",
	recipe = {
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
	}
})

core.register_craft({
	output = "default:bronzeblock",
	recipe = {
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
		{"default:bronze_ingot", "default:bronze_ingot", "default:bronze_ingot"},
	}
})

core.register_craft({
	output = "default:goldblock",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
	}
})

core.register_craft({
	output = "default:diamondblock",
	recipe = {
		{"default:diamond", "default:diamond", "default:diamond"},
		{"default:diamond", "default:diamond", "default:diamond"},
		{"default:diamond", "default:diamond", "default:diamond"},
	}
})
