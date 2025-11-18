local server = 335
while true do
    local timerID = os.startTimer(3)
    local event = os.pullEvent("timer")
    rednet.send(server,"Play","Music")
    print("Play")
    read()
    rednet.send(server,"Stop","Music")
    print("Stop")
end