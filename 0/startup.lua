local server = 207
local fileName = "usefulFunctions.lua"
if shell.run("getfile.lua",server, fileName) then
	print("Updated usefulFunctions.lua")
else 
	print("Could not update usefulFunctions.lua")
end

