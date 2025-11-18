print("How far to dig down?")
userNum = tonumber(read())
for i = 1, userNum do
    turtle.digDown()
    turtle.down()
end
