local usefulFunctions = require("usefulFunctions")

if not rednet.isOpen() then
    usefulFunctions.openRednet()
end
rednet.send(1,"continue")
