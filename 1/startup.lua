local server = 207
local fileName = "usefulFunctions.lua"

if fs.exists("usefulFunctions.lua") then
	fs.delete("usefulFunctions.lua")
end
while not fs.exists("usefulFunctions.lua") do
	if shell.run("getfile.lua",server, fileName) then
		print("Updated usefulFunctions.lua")
	else 
		print("Could not update usefulFunctions.lua")
	end
end