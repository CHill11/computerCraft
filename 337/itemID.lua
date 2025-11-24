 while true do
	local item = turtle.getItemDetail()
	if item then
		print("Name:" .. item.name)
	end
end