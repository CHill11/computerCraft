local usefulFunctions = require("usefulFunctions")

local function placeBack()
    if usefulFunctions.hasBlock() then
        usefulFunctions.moveBack()
        usefulFunctions.place()
    else
        print("Out of blocks.")
        return false
    end
end

print("How far to delete the water?")
local dist = tonumber(read())
print("How high do I need to go?")
local hight = tonumber(read())
local goUp = false
if not usefulFunctions.hasBlock() then
    print("No blocks in inventory. Exiting...")
    return false
end
for o = 1, hight do
    for i = 1, dist do --Move the lenght the user specified
        if  i > 1 then --place a round of block before moving
            usefulFunctions.moveForward()
        end
        if not usefulFunctions.placeLeft() then --see if placing a block succeeded
            print("PlaceLeft false")
            return false
        end
        if not usefulFunctions.placeRight() then --see if placing a block succeeded
            return false
        end
        if i == dist then --set the flag to make the turtle go up
            print("in the 'if i == dist'")
            if  o ~= hight then --go up if not last level
                goUp = true
                break
            else
                print("in the else of 'if not 0 == hight'")
                break
            end
        end
    end
    for l = 1, dist do
        print("l is " .. l)
        placeBack()
        if l == dist then
            break
        end
    end
    if goUp then
        usefulFunctions.moveUp()
        usefulFunctions.moveForward()
    end
end