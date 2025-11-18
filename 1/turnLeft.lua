
usefulFunctions = require("usefulFunctions")
local facing = usefulFunctions.turnLeft("north")
print(facing)
for i = 1,10 do
    facing = usefulFunctions.turnLeft(facing)
    print(facing)
    read()
end