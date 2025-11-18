rednet.open("right")
stop = false
repeat
id, message = rednet.receive()
if id then
    print(message)
    stop = true
end
until stop
