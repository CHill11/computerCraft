function getNextStack()
    local item = turtle.getItemDetail()
    if item then
        return turtle.getSelectedSlot()
    else
        for i = 1,16 do
            turtle.select(i)
            item = turtle.getItemDetail()
            if item then
                return i 
            end    
        end    
    end
end

print("How far to build ceiling?")
length = tonumber(read())
print("How wide to build ceiling?")
width = tonumber(read())

for i = 1,width do    
    for o = 1,length do
        turtle.select(getNextStack())
        turtle.placeUp()
        turtle.forward()
    end
    if i % 2 == 1 then
		turtle.select(getNextStack())
        turtle.placeUp()
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
    else
		turtle.select(getNextStack())
        turtle.placeUp()
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
    end
end
