local usefulFunction = require("usefulFunctions")
print("Enter how far to build")
local length = tonumber(read())
for i = 1,length do
    usefulFunction.digDown()
    usefulFunction.moveForward()
end
print("Done")
