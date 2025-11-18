function digForward(blocksMined)
    print("entered digForward")
    if turtle.detect() then
        turtle.dig()
        blocksMined = blocksMined + 1
    end 
    assert(turtle.forward())
    return blocksMined
end
 
function returnHome(x, y)
print(x,y)
    if x % 2 == 0 then
        print("Enter returnHome even")
        turtle.turnRight()
        for i = 2, x do
            assert(turtle.forward())
        end
        turtle.turnRight()
    else
        print("returnHome odd")
        turtle.turnLeft()
        for i = 2, x do
            assert(turtle.forward())
        end
        turtle.turnLeft()
        for i = 2, y do
           assert(turtle.forward())
        end
        turtle.turnLeft()
        turtle.turnLeft()
    end
    turtle.select(12) -- Start of the item drop off process
    if turtle.getItemCount() == 0 then
        turtle.select(1)
        return
    else 
        turtle.turnLeft()
        turtle.turnLeft()
        turtle.dig()
        blocksMined = blocksMined + 1
        turtle.select(16)
        turtle.place()
        for i = 1, 15 do
            turtle.select(i)
            turtle.drop()
        end
        turtle.turnLeft()
        turtle.turnLeft()
    end
    turtle.select(1)
    return blocksMined
end
 
function isFull()
    print("Entered isFull")
    for slot = 1, 16 do
        if turtle.getItemCount(slot) == 0 then
            return false
        end 
    end
    return true
end
fuel = turtle.getFuelLevel()
chest = true
userDistY = nil
userDistX = nil
userDistZ = nil
blocksMined = 0
 
if fuel < 500 then
    print("Fuel below 500, exiting.")
    return
end
 
while userDistY == nil do
    print("How far shoud I go forward?")
    userDistY = tonumber(read())
end
 
while userDistX == nil do
    print("How far to the right should I go?")
    userDistX = tonumber(read())
end
 
while userDistZ == nil do
    print("How deep should I go")
    userDistZ = tonumber(read())
end
 
while chest do
turtle.select(16)
item = turtle.getItemDetail()
    if item == nil then
        print("Need a chest in the last slot")   
    elseif item.name ~= "minecraft:chest" then
        print("Not a chest in the last slot")
    else
       chest = false 
    end
    sleep(3)
    item = turtle.getItemDetail()
end
    
for z = 1, userDistZ do
    print("entered z")
    for x = 1, userDistX do
        print("x is " .. x .. " befor y loop")
        for y = 2, userDistY do
            blocksMined = digForward(blocksMined)
        end
        
        print("x is " .. x .. " after y loop")
        --sleep(2)
        if x < userDistX then   
            if ((x % 2) == 0) then
                print("Going left")
                turtle.turnLeft()
                blocksMined = digForward(blocksMined)                
                turtle.turnLeft()
            else
                print("Going right")
                turtle.turnRight()
                blocksMined  = digForward(blocksMined)
                turtle.turnRight()
            end
        end
        
       -- sleep(5)
        print("end of x loop")
    end
    returnHome(userDistX, userDistY)
    if z < userDistZ then
        turtle.digDown()
        blocksMined = blocksMined + 1
        turtle.down()
    end
end -- end of z loop
print("end of z loop")
    
for z = 2, userDistZ do
    turtle.up()
end
print("The number of block mined is " .. blocksMined)
