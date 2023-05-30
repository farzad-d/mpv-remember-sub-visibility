local filepath = mp.command_native({"expand-path", "~~/sub_vis"})

local loadfile = io.open(filepath, "r")

str_to_bool = { ["yes"] = true, ["no"] = false }

if loadfile then
	set_vis = str_to_bool[string.sub(loadfile:read(), 5)]
	loadfile:close()
	mp.set_property_bool("sub-visibility", set_vis)
end

mp.register_event("shutdown", 
	function()
		local savefile = io.open(filepath, "w+")
		savefile:write("vis=" .. mp.get_property("sub-visibility"), "\n")    
		savefile:close()
	end
)
