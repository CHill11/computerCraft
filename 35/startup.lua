--id = 35
--Starts on left and passes right
rs.setOutput("bottom",true)
hopper = peripheral.wrap("bottom")
rednet.open("left")
pause = false
passDownItems = {"nether_wart_block","weeping_vines","warped_fungus","nether_wart","glowstone","wither_skeleton_skull","blackstone","warped_stem"}
while true do
	wasSucked = turtle.suck() --wasSucked is a boolen to see it suck got an item
	if wasSucked == true then
		item = turtle.getItemDetail()
		if item.name == "minecraft:netherrack" then
			print("sorting " .. item.name)
			turtle.dropUp()
		elseif item.name == "minecraft:soul_sand" then
			print("sorting " .. item.name)
			turtle.dropDown()
			rs.setOutput("bottom",false)
			while true do --check to see if hoppper has items
				hopInv = hopper.list()
				local totalCount = 0
				for _, stack in pairs(hopInv) do
					totalCount = totalCount + stack.count
				end
				if totalCount == 0 then
				break
				end                
				sleep(0.5)
				print("Going to sleep. Hopper contains " .. totalCount .. " total item(s).")
				--print(textutils.serialize(hopInv)) -- Print table content for debugging
			end
			print("Resuming...")
			rs.setOutput("bottom",true)
			elseif item.name == "minecraft:soul_soil" then
				print("Sorting " .. item.name)
				turtle.turnRight()
				turtle.drop()
				turtle.turnLeft()
		else
			pause = false --bollean set for no sleep
			for i = 1, 8 do
				checkItem = "minecraft:" .. passDownItems[i]
				--print(checkItem) 
				if item.name == checkItem then
					pause = true --set to false if item is in this row
				end
			end
			print("Passing along " .. item.name) 
			turtle.turnLeft()
			turtle.turnLeft()
			turtle.drop()
			if pause == true then --pause and wait for a rednet message
			print("about to enter get rednet")
				while pause do
					local event, id, message = os.pullEvent("rednet_message")
					print(message)
					if message == "sort" then
						print("back to sorting")
						pause = false
					end
				end
            end
			turtle.turnLeft()
			turtle.turnLeft()
			
		end
	end      
end