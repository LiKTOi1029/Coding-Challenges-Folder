function Calculator(Input)
	local ParserString, CalculationTable = "", {}
	for num1 = 1, #Input, 1 do
		if Input:sub(num1,num1) ~= " " then ParserString = ParserString..Input:sub(num1,num1) elseif Input:sub(num1,num1) == " " then table.insert(CalculationTable, tonumber(ParserString)); ParserString = "" end
	end
	for num2, value in ipairs(CalculationTable) do io.write(value.." ") end
	local result = CalculationTable[1]*(CalculationTable[2]/CalculationTable[3])*CalculationTable[4]
	if CalculationTable[4] and CalculationTable[5] then local result = result+(math.floor(CalculationTable[4]/CalculationTable[5])) end
	return result
end
repeat
	io.write("Input in the following order: DAMAGE AMMUNITION RPS PIERCE <DAMAGE SECOND>\n\"<\" and \">\" means these values are optional\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" then print(Calculator(choice)) end
until choice == "EXIT"