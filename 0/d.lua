turtle.digDown()
for i = 1,150 do 
    turtle.dig()
    turtle.forward()
end
local x,y,z = gps.locate()
while y < 63 do 
    turtle.digUp()
    turtle.up()
    x,y,z = gps.locate()
end
