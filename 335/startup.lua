local usefulFunctions = require("usefulFunctions")
if not rednet.isOpen() then
    usefulFunctions.openRednet()
end
shell.run("getfile",207,"musicPlayersIDs.lua")
local musicPlayersIDs = require("musicPlayersIDs")
local IDs = musicPlayersIDs.IDs()
local diskDrive = peripheral.find("drive")

while true do
    local _,id,message,protocal = os.pullEvent("rednet_message")
    if id == 63 and message == "Play" and protocal == "Music" then
        for location, ID in pairs(IDs) do
            rednet.send(ID,"Play","Music")
        end
        diskDrive.playAudio()
    end
    if id == 63 and message == "Stop" and protocal == "Music" then
        for location, ID in pairs(IDs) do
            rednet.send(ID,"Stop","Music")
        end
        diskDrive.stopAudio()
    end
end