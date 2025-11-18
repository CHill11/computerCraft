function moveForward(num)
    assert(turtle.forward())
    num = num + 1
    return num
end
print("How far should I place torches?")
dist = tonumber(read())
moved = 0
hasTorch = false
repeat
    turtle.select(1)
    item = turtle.getItemDetail()
    if item then
        if item.name == "minecraft:torch" then
            print("Starting...")
            hasTorch = true
        end
    else
        print("Need torches in slot 1")
        sleep(1)
    end
until hasTorch 
while moved < dist do
    moved = moveForward(moved)
   if moved % 8 == 0 then
       turtle.turnLeft() 
       turtle.turnLeft()
       turtle.place()
       turtle.turnLeft()
       turtle.turnLeft()
   end
end
