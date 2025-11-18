function placeBlock(num)
    turtle.place()
    num = num + 1
    return num
end

function placeBlockDown(num)
    turtle.placeDown()
    num = num + 1
    return num
end

print("How far should i build?")
dist = tonumber(read())
moved = 1
placed = 0
while moved < dist do
    if placed > 64 then 
        turtle.select(2)
        if placed > 128 then
            turtle.select(3)
            if placed > 192 then
                turtle.select(4)
                if placed > 256 then
                    turtle.select(5)
                end
            end
        end
    end
    placed = placeBlockDown(placed)
    turtle.turnLeft()
    placed = placeBlock(placed)
    turtle.turnRight()
    turtle.turnRight()
    placed = placeBlock(placed)
    turtle.turnLeft()
    assert(turtle.forward())
    moved = moved + 1
    print(moved)
    print(placed)
end
