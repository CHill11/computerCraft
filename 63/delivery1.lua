rednet.send(333,"location")
local id,message = rednet.receive()
print(message)
