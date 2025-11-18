function forward()
    if turtle.detect() then
        turtle.dig()
    else
        assert(turtle.forward())
    end
end

function hasBlock()
    for i = 1, 16 do
        turtle.select(i)
        stack = turtle.getItemDetail()
        if stack and stack.count > 0 then
            print("hasBlock true")
            return true
        end
    end
    return false
end

function turnAround()
    turtle.turnRight()
    turtle.turnRight()
end

function placeLeft()
    print("in placeLeft")
    turtle.turnLeft()
    if hasBlock() then
        turtle.place()
    else
        print("Out of blocks.")
        return false
    end
    turtle.turnRight()
    return true
end

function placeRight()
    print("in placeRight")
    turtle.turnRight()
    if hasBlock() then
        turtle.place()
    else
        print("Out of blocks.")
        return false
    end
    turtle.turnLeft()
    return true
end

function placeBack()
    if hasBlock() then
        turtle.back()
        turtle.place()
    else
        print("Out of blocks.")
        return false
    end
end
print("How far to delete the water?")
dist = tonumber(read())
print("How high do I need to go?")
hight = tonumber(read())
goUp = false
if not hasBlock() then
    print("No blocks in inventory. Exiting...")
    return false
end
for o = 1, hight do
    for i = 1, dist do --Move the lenght the user specified
        print("i is " .. i)
        print("o is" .. o)
        if  i > 1 then --place a round of block before moving
            forward()
        end
        if not placeLeft() then --see if placing a block succeeded
            print("PlaceLeft false")
            return false
        end
        if not placeRight() then --see if placing a block succeeded
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
        turtle.up()
        turtle.forward()
    end
end
