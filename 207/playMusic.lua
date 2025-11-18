
local usefulFunctions = require("usefulFunctions")
if not rednet.isOpen() then
    usefulFunctions.openRednet()
end
local diskDrive = peripheral.find("drive")
print("started")
while true do
    local _,id,message,protocal = os.pullEvent("rednet_message")
    print(protocal)
    if message == "Play" and protocal == "Music" then
        print("Playing music...")
        diskDrive.playAudio()
    elseif message == "Stop" and protocal == "Music" then
        diskDrive.stopAudio()
    end
end