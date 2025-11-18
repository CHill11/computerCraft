print("How far to make stairs?")
dist = tonumber(read())
for i = 1, dist do
    if turtle.detectUp() then
        turtle.digUp()
    end
    assert(turtle.up())
    turtle.digUp()
    if turtle.detect() then
        turtle.dig()
    end
    assert(turtle.forward()) 
end
