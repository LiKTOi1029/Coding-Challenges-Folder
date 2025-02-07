function string.totable(input)
	local iteratedString = {}
	for str in input:gmatch("%d+") do
		table.insert(iteratedString, tonumber(str))
	end
	return iteratedString
end
function __MAIN__(tArray)
	local lowestNum, highestNum, pointer = nil, nil, math.huge
	for num0, item in ipairs(tArray) do
		if tArray[num0-1] then pointer = tArray[num0-1] end
		if pointer < tArray[num0] then highestNum = tArray[num0] end
		if pointer > tArray[num0] then lowestNum = tArray[num0] end
	end
	print(">>The largest number is "..highestNum.."\n>>The smallest number is "..lowestNum)
end
repeat
	io.write(">>Type out numbers separated by any non-integer character.\n>>Type EXIT to exit\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" then __MAIN__(string.totable(choice)) end
until choice == "EXIT"