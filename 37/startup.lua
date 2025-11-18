--id = 37
--pass along to the right
rs.setOutput("bottom",true)
hopper = peripheral.wrap("bottom")
rednet.open("left")
while true do
    os.pullEvent("turtle_inventory") --see if turle has an item
      item = turtle.getItemDetail()
      if item then
          if item.name == "minecraft:shroomlight" then
              print("sorting " .. item.name)
              turtle.dropUp()
          elseif item.name == "minecraft:weeping_vines" then
              print("sorting " .. item.name)
              turtle.dropDown()
              rs.setOutput("bottom",false)
				while true do --check to see if hoppper has items
					hopInv = hopper.list()
					local totalCount = 0
					for _, stack in pairs(hopInv) do
						totalCount = totalCount + stack.count
					end
					print(totalCount)
					if totalCount == 0 then
						rednet.send(35,"sort")
						break
					end                
					sleep(0.5)
					print("Going to sleep. Hopper contains " .. totalCount .. " total item(s).")
					--print(textutils.serialize(hopInv)) -- Print table content for debugging
				end
				print("Resuming...")
				rs.setOutput("bottom",true)
          elseif item.name == "minecraft:crimson_roots" then
              print("Sorting " .. item.name)
              turtle.drop()
          else
              print("Passing along " .. item.name) 
              turtle.turnRight()
              turtle.drop()
              turtle.turnLeft()
          end
      end
end      
