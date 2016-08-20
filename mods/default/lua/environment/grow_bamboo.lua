-- mods/default/lua/environment/grow_bamboo.lua
-- =============================================
-- See README.txt for licensing and other information.

-- Bamboo
function default.grow_bamboo(pos, node)
	pos.y = pos.y - 1
	local name = core.get_node(pos).name
	if name ~= "default:dirt_with_grass" and name ~= "default:dirt" then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "default:bamboo" and height < 15 do
		height = height + 1
		pos.y = pos.y + 1
		node = core.get_node(pos)
	end
	if height == 15 or node.name ~= "air" then
		return
	end
    --[[if height == 15 then
        local path = minetest.get_modpath("default") ..
            "/schematics/bamboo_leaves.mts"
        minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
            path, "0", nil, false)
        end
    end]]--
	core.set_node(pos, {name = "default:bamboo"})
	return true
end

core.register_abm({
	nodenames = {"default:bamboo"},
	neighbors = {"default:dirt", "default:dirt_with_grass", "default:sand"},
	interval = 30, -- 50
	chance = 8,  -- 20
	action = function(...)
		default.grow_bamboo(...)
	end
})
