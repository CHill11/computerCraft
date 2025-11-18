while true do
    block = turtle.getItemDetail()
    if block then    
        print(block.name)
    end
    sleep(1)
end
