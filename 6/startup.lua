while true do
   wasSucked = turtle.suckUp() --wasSucked is a boolen to see it suck got an item
   if wasSucked == true then
      item = turtle.getItemDetail()
      if item.name == "minecraft:oak_log" then
          print("sorting wood")
          turtle.turnRight()
          turtle.drop()
          turtle.turnLeft()
      elseif item.name == "minecraft:oak_sapling" then
          print("sorting sapling")
          turtle.turnLeft()
          turtle.drop()
          turtle.turnRight()
      elseif item.name == "minecraft:apple" then
          print("Sorting apple")
          turtle.turnLeft()
          turtle.turnLeft()
          turtle.drop()
          turtle.turnLeft()
          turtle.turnLeft()
      elseif item.name == "minecraft:stick" then
          print("sorting stick")
          turtle.drop()
      else 
          turtle.dropDown()
      end
    end
end      
