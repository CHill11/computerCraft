local items = {"minecraft:arrow","minecraft:rotten_flesh","minecraft:feather","minecraft:bone","minecraft:glow_ink_sac","minecraft:iron_ingot","minecraft:copper_ingot","minecraft:gold_ingot"}
hopper = peripheral.wrap("top")
while true do
    hopInv = hopper.list()
    if next(hopInv) then
        --print(hopInv)
        print("Waiting for hopper to empty.")
        sleep(1)
    else
        wasSucked = turtle.suck() --wasSucked is a boolen to see it suck got an item
        if wasSucked == true then
            item = turtle.getItemDetail()
            delete = true
            for i = 1, 8 do
                if items[i] == item.name then
                    print("sorting " .. item.name)
                    print("Drop up")
                    turtle.dropUp()
                    delete = false
                    sleep(1)
                elseif i == 8 and delete == true then
                    print("deleting")
                    turtle.turnRight()
                    turtle.drop()
                    turtle.turnLeft()
                    sleep(1)
                end
            end
        end
    end
end
