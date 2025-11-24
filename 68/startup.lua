while true do
    os.pullEvent("turtle_inventory")
    local item = turtle.getItemDetail()
    if item then
        if item.name == "minecraft:rotten_flesh" then
            print("sorting " .. item.name)
            turtle.dropDown()
        else
            turtle.drop()
        end
    end
end