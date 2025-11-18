local hopper = peripheral.wrap("back")
while true do
    local hopperInv = hopper.list()
    local totalCoal = 0
    for _,item in ipairs(hopperInv) do
        totalCoal = totalCoal + item.count
    end
    print(totalCoal)
    if totalCoal > 64 then
        rs.setOutput("back",true)
    else
        rs.setOutput("back", false)
    end
    sleep(1)
end
