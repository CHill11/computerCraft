local slot = 1
while true do    
    if not turtle.detect() then
        if not turtle.place() then
            slot = slot + 1
            if slot > 16 then    
                slot = 1
            end
            turtle.select(slot)
        end
    end
end
