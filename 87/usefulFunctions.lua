local usefulFunctions = {}--the array of functions

function usefulFunctions.moveForward(moved,dug)
	local moved = moved or 0
	local dug = dug or 0
	if turtle.detect() then
		assert(turtle.dig())
		dug = dug + 1
	end
	if turtle.forward() then
		moved = moved + 1
		return true, moved, dug
	else
		return false, moved, dug
	end
end

function usefulFunctions.moveUp(moved,dug)
	local moved = moved or 0
	local dug = dug or 0
	if turtle.detectUp() then
		assert(turtle.digUp())
		dug = dug + 1
	end
	if turtle.up() then
		moved = moved + 1
		return true, moved, dug
	else
		return false, moved, dug
	end
end

function usefulFunctions.moveDown(moved,dug)
	local moved = moved or 0
	local dug = dug or 0
	if turtle.detect() then
		assert(turtle.digDown())
		dug = dug + 1
	end
	if turtle.down() then
		moved = moved + 1
		return true, moved, dug
	else
		return false, moved, dug
	end
end

function usefulFunctions.moveBack(moved)
	local moved = moved or 0
	if turtle.back() then
		moved = moved + 1
		return true, moved
	else
		return false, moved
	end
end

function usefulFunctions.dig(num)
	num = num or 0
	while turtle.detect() do
		turtle.dig()
		num = num + 1
		sleep(0.3)
	end
	return num
end

function usefulFunctions.digUp(num)
	num = num or 0
	while turtle.detectUp() do
		turtle.digUp()
		num = num + 1
		sleep(0.3)
	end
	return num
end

function usefulFunctions.digDown(num)
	num = num or 0
	if turtle.detectDown() then
		turtle.digDown()
		num = num + 1
		return num
	end
end

function usefulFunctions.emptyInv(start, stop)
	local compleateEmptyInv = false
	local start = start or 1
	local stop = stop or 16
	for i = start, stop do
		turtle.select(i)
		turtle.drop()
		if i == stop then
			compleateEmptyInv = true
		end
	end
	return compleateEmptyInv
end
	
function usefulFunctions.turnAround()
    turtle.turnRight()
    turtle.turnRight()
end
	
function usefulFunctions.hasBlock()
	local placeableBlocks = {
        -- WOOD LOGS (Regular and Stripped)
        "minecraft:oak_log", "minecraft:stripped_oak_log",
        "minecraft:spruce_log", "minecraft:stripped_spruce_log",
        "minecraft:birch_log", "minecraft:stripped_birch_log",
        "minecraft:jungle_log", "minecraft:stripped_jungle_log",
        "minecraft:acacia_log", "minecraft:stripped_acacia_log",
        "minecraft:dark_oak_log", "minecraft:stripped_dark_oak_log",
        "minecraft:mangrove_log", "minecraft:stripped_mangrove_log",
        "minecraft:cherry_log", "minecraft:stripped_cherry_log",
        "minecraft:crimson_stem", "minecraft:stripped_crimson_stem",  -- Nether Woods
        "minecraft:warped_stem", "minecraft:stripped_warped_stem",    -- Nether Woods
        "minecraft:bamboo_block", "minecraft:stripped_bamboo_block",  -- Bamboo

        -- WOOD PLANKS
        "minecraft:oak_planks",
        "minecraft:spruce_planks",
        "minecraft:birch_planks",
        "minecraft:jungle_planks",
        "minecraft:acacia_planks",
        "minecraft:dark_oak_planks",
        "minecraft:mangrove_planks",
        "minecraft:cherry_planks",
        "minecraft:bamboo_planks",
        "minecraft:crimson_planks",
        "minecraft:warped_planks",
        "minecraft:bamboo_mosaic", -- A unique plank-like block
        
        -- CORE BUILDING MATERIALS (from previous list)
        "minecraft:stone",
        "minecraft:cobblestone",
        "minecraft:dirt",
        "minecraft:gravel",
        "minecraft:sand"
        }

    for i = 1, 16 do --search the whole inventory for a block
        turtle.select(i)
        local stack = turtle.getItemDetail()
        if stack and stack.count > 0 then
		local itemName = stack.name --get just the items name
            for _, block_id in ipairs(placeableBlocks) do--check the item to see if it matches an approved block
                if itemName == block_id then
                    print("Placing " .. string.sub(itemName, 11))
                    return true
                end
            end
        end
    end
	turtle.select(1)
    return false
end
	
function usefulFunctions.placeLeft(num)
	local num = num or 0
    if usefulFunctions.hasBlock() then
		turtle.turnLeft()
        turtle.place()
		turtle.turnRight()
		num = num + 1
    else
        print("Out of blocks.")
        return false
    end
    return true
end
	
function usefulFunctions.placeRight(num)
	local num = num or 0
    if usefulFunctions.hasBlock() then
		turtle.turnRight()
        turtle.place()
		turtle.turnLeft()
		num = num + 1
    else
        print("Out of blocks.")
        return false
    end
    return true
end
	
function usefulFunctions.placeUp(num)
	local num = num or 0
    if usefulFunctions.hasBlock() then
        turtle.placeUp()
		num = num + 1
    else
        print("Out of blocks.")
        return false
    end
    return true
end

function usefulFunctions.placeDown(num)
	local num = num or 0
    if usefulFunctions.hasBlock() then
        turtle.placeDown()
		num = num + 1
    else
        print("Out of blocks.")
        return false, num
    end
    return true, num
end

function usefulFunctions.place(num)
	local num = num or 0
    if usefulFunctions.hasBlock() then
        turtle.place()
		num = num + 1
    else
        print("Out of blocks.")
        return false
    end
    return true
end

return usefulFunctions