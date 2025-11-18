function dropOff()
    for i = 1, 15 do
        turtle.select(i)
        turtle.drop()
    end
end

fuel = turtle.getFuelLevel()
print(fuel)
moved = 1
move = false

while true do
    if fuel < 30 then
        for i = 1, 15 do
            turtle.select(i) --may not work
            item = turtle.getItemDetail()--might have to put i here
            if item.name == "minecraft:oak_log" then
                turtle.refuel(64)
                print("Refueled")
            end
        end
    else
        hasBlock, block = turtle.inspect()
        if block.name == "minecraft:oak_log" then
            for i = 1, 6 do --harvest the wood
                turtle.dig()
                turtle.digUp()
                turtle.up()
            end
            for i = 1, 6 do-- get back to ground level
                turtle.down()
            end
            move = true
        else 
            move = true
        end
    end
    if moved >= 20 then
        turtle.turnLeft()
        for i = 1, 20 do
            turtle.forward()
        end
        dropOff()
        turtle.turnRight()
        moved = 1
        sleep(500)
    end
    if move then
        move = false
        moved = moved + 1
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
    end
end
