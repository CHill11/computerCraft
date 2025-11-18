usefulFunctions = require("usefulFunctions")
local facing = usefulFunctions.turnRight("north")
print(facing)
for i = 1,10 do
    facing = usefulFunctions.turnRight(facing)
    print(facing)
    read()
end

