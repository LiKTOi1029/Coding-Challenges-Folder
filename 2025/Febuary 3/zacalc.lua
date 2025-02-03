function Calculator(Input)
	local ParserString, CalculationTable = "", {}
	for num1 = 1, #Input, 1 do
		ParserString = ParserString..Input:sub(num1,num1)
		if Input:sub(num1,num1) == " " or num1 == Input:len() then ParserString:gsub(" ", "") table.insert(CalculationTable, ParserString); ParserString = "" end
		print(ParserString.." "..#CalculationTable)
	end
	for num2, value in ipairs(CalculationTable) do io.write(value.." ") end
	local result = CalculationTable[1]*(CalculationTable[2]/CalculationTable[3])*CalculationTable[4]
	if CalculationTable[6] then result = result+(math.floor(CalculationTable[4]/CalculationTable[5])) end
	return result
end
repeat
	io.write("Input in the following order: DAMAGE AMMUNITION RPS PIERCE (and optionally) DAMAGE SECOND\nEXIT to exit\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" then print(Calculator(choice)) end
until choice == "EXIT"