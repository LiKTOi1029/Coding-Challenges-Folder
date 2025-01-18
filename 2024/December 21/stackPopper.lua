function fChecker(input)
	local tBrackets = {}
	local tPointer = {}
	for num0 = 1, input:len(), 1 do
		table.insert(tBrackets, input:sub(num0,num0))
	end
	for num1, bracket in ipairs(tBrackets) do
	io.write(">>Checking "..bracket.."\n")
		if (bracket == "}" and tPointer[1] == "{") or (bracket == "]" and tPointer[1] == "[") or (bracket == ")" and tPointer[1] == "(") then
			io.write(">>Popping  "..tPointer[1].."\n")
			table.remove(tPointer, 1)
		elseif bracket ~= "}" or bracket ~= "]" or bracket ~= ")" then
			table.insert(tPointer, 1, bracket)
			io.write(">>Inserted "..bracket.."\n")
		end
	end
	if #tPointer == 0 then
		return true
	else
		return false
	end
end
repeat
	io.write(">>Type EXIT to exit and type anything else to input\n")
	local choice = io.read("*l"):gsub("\n", "")
	if choice ~= "EXIT" then io.write(tostring(fChecker(choice)).."\n")
	else break end
until true == false