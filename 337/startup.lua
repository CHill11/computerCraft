local server = 207
local fileNames = {"usefulFunctions.lua","tunnel.lua","getLava.lua","ultimateExcavate.lua"}

for _,name in pairs(fileNames) do
	if shell.run("getfile.lua",server, name) then
		print("Updated " .. name)
	else 
		print("Could not update " .. name)
	end
end