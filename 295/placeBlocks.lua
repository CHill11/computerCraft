local slot = 1
print("Starting...")
while true do    
    if not turtle.detect() then
        if not turtle.place() then
            slot = slot + 1
            if slot > 16 then    
				print("Sleeping for 20...")
				sleep(5)
				print("Sleeping for 15...")
				sleep(5)
				print("Sleeping for 10...")
				sleep(5)
				print("Sleeping for 5...")
				sleep(5)
                slot = 1
				term.clear()
				term.setCursorPos(1,1)
				print("Resuming...")
            end
            turtle.select(slot)
        end
    end
end
