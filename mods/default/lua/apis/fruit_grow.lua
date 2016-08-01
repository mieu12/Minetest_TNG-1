-- mods/default/lua/apis/fruit_grow.lua
-- ====================================
-- See README.txt for licensing and other information.

local function start_node_timer(pos, def, factor)
	local time = def.growtime / def.steps *
		default.GROW_TIME_FACTOR * math.random(0.6, 1.8) * (factor or 1)

	core.get_node_timer(pos):start(time)
end

local function grow_plant(pos, def, i, name)
	if core.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name ~= def.leaves then
		start_node_timer(pos, def, 0.65)
		return
	end

	core.set_node(pos, {name = name .. "_" .. tostring(i + 1)})
end

function default.register_fruit(name, def)
	local plantdef = {}
	plantdef[0] = table.copy(def.fruit)
	plantdef[0].paramtype = "light"
	plantdef[0].drawtype = "plantlike"

	for i = 1, def.steps do
		local percent = tostring(default.round_number(100 / def.steps * i, 1))

		plantdef[i] = table.copy(plantdef[0])
		plantdef[i].tiles = {def.texture_prefix .. "_" ..
			tostring(i) .. ".png"}


		if i == def.steps then
			-- when fully grown
			plantdef[i].description = (def.description or "Fruit") .. " (Mature)"
		else
			-- when not fully grown
			plantdef[i].on_construct = function(pos)
				start_node_timer(pos, def)
			end
			plantdef[i].on_timer = function(pos, elapsed)
				grow_plant(pos, def, i, name)
			end
			plantdef[i].description = (def.description or "Fruit") .. " (" .. percent .. "% Grown)"
		end

		core.register_node(name .. "_" .. tostring(i), plantdef[i])
	end

	core.register_node(name, {
		description = def.description,

	})
end

default.register_fruit("default:apple", {
	texture_prefix = "default_apple",
	description = "Apple",
	steps = 4,
	growtime = 10,
	leaves = "default:leaves",
	fruit = {
		--
	}
})


default.register_fruit("default:pear", {
	texture_prefix = "default_pear",
	description = "Pear",
	steps = 4,
	growtime = 10,
	leaves = "default:leaves"
})
