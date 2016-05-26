--
-- small Mushrooms
--

local mushrooms = {
	{"brown", 2, flowers.grow_brown_giant_mushroom},
	{"red", -6, flowers.grow_red_giant_mushroom}
}

-- Register mushrooms
for k, v in pairs(mushrooms) do
	local name, eat_value, grow = v[1], v[2], v[3]

	default.register_node("flowers:mushroom_" .. name, {
		description = string.sub(string.upper(name), 0, 1) ..
			string.sub(name, 2) .. " Mushroom",
		tiles = {"flowers_mushroom_" .. name .. "_top.png", "flowers_mushroom_" .. name .. "_top.png", "flowers_mushroom_" .. name .. ".png"},
		inventory_image = "flowers_mushroom_" .. name .. ".png",
		wield_image = "flowers_mushroom_" .. name .. ".png",
		drawtype = "nodebox",
			node_box = {
				type = "fixed",
				fixed = {
					{-1/16, -8/16, -1/16, 1/16, -6/16, 1/16},
					{-3/16, -6/16, -3/16, 3/16, -5/16, 3/16},
					{-4/16, -5/16, -4/16, 4/16, -4/16, 4/16},
					{-3/16, -4/16, -3/16, 3/16, -3/16, 3/16},
					{-2/16, -3/16, -2/16, 2/16, -2/16, 2/16},
					},
				},		
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3,  flammable = 3, attached_node = 1, mushroom = 1, attached_node = 1},
		sounds = default.node_sound_leaves_defaults(),
		on_use = core.item_eat(eat_value),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
		growing = grow,
	})

	-- Set alias for "fertile" MTG mushrooms
	core.register_alias("flowers:mushroom_fertile_" .. name, "flowers:mushroom_" .. name)
end


-- Register growing ABM

core.register_abm({
	nodenames = {"group:mushroom"},
	interval = 50,
	chance = 35,
	action = function(pos, node)
		pos.y = pos.y - 1
		local p = core.find_node_near(pos, 1, "air")
		if not p or not default.is_day() then
			return
		end

		local n1 = core.get_node_or_nil(p)
		p.y = p.y - 1
		local n2 = core.get_node_or_nil(p)

		if node and n1 and n2 and core.get_item_group(n2.name, "soil") > 0 then
			p.y = p.y + 1
			if n1.name == "air" and core.get_node_light(p) <= 8 then
				core.set_node(p, {name = node.name})
			end
		end
	end
})

--
-- Mushroom trees
--

-- Growing
function flowers.grow_brown_giant_mushroom(pos)
	local schematic = core.get_modpath("flowers") .. "/schematics/giant_mushroom_brown.mts"
	core.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2}, schematic, 0, {["flowers:mushroom_brown"] = "flowers:mushroom_tree_brown"}, false)
	core.swap_node(pos, {name="flowers:mushroom_tree_brown"})
end

function flowers.grow_red_giant_mushroom(pos)
	local schematic = core.get_modpath("flowers") .. "/schematics/giant_mushroom_red.mts"
	core.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2}, schematic, 0, {["flowers:mushroom_red"] = "flowers:mushroom_tree_red"}, false)
	core.swap_node(pos, {name="flowers:mushroom_tree_red"})
end


-- brown mushroom
default.register_node("flowers:mushroom_tree_brown", {
	description = "Brown Mushroom Trunk",
	tiles = {"flowers_mushroom_trunk_top.png", "flowers_mushroom_trunk_top.png", "flowers_mushroom_trunk_brown.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("flowers:mushroom_head_brown", {
	description = "Brown Mushroom Head",
	tiles = {"flowers_mushroom_head_brown.png", "flowers_mushroom_head_inner.png", "flowers_mushroom_head_brown.png" },
	paramtype = "light",   
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	drop = {
		items = {
			{items = {"flowers:mushroom_brown"}, max = 2, rarity = 2}
		}
	}
})

-- red mushroom
default.register_node("flowers:mushroom_tree_red", {
	description = "Red Mushroom Trunk",
	tiles = {"flowers_mushroom_trunk_top.png", "flowers_mushroom_trunk_top.png", "flowers_mushroom_trunk_red.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = core.rotate_node,
})

core.register_node("flowers:mushroom_head_red", {
	description = "Red Mushroom Head",
	tiles = {"flowers_mushroom_head_red.png", "flowers_mushroom_head_inner.png", "flowers_mushroom_head_red.png"}, 
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	drop = {
		items = {
			{items = {"flowers:mushroom_red"}, max = 2, rarity = 2},
		}
	}
})
