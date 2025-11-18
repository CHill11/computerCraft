while true do
    if turtle.getItemCount(16) ~= 0 then
        for i = 1, 16 do
            turtle.select(i)
            turtle.dropDown()
        end
        turtle.select(1)
    else
        turtle.attack()
        turtle.suck()
    end
end
