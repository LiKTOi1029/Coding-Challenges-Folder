function Calculator(Input)
	local ParserString, CalculationTable, Result = "", {}
	for num1 = 1, #Input, 1 do
		ParserString = ParserString..Input:sub(num1,num1)
		if Input:sub(num1,num1) == " " or num1 == Input:len() then ParserString:gsub(" ", "") table.insert(CalculationTable, ParserString); ParserString = "" end
	end
	if CalculationTable[6] then Result = (CalculationTable[1]*(CalculationTable[2]/CalculationTable[3])*CalculationTable[4])+(CalculationTable[5]/CalculationTable[6]) else Result = CalculationTable[1]*(CalculationTable[2]/CalculationTable[3])*CalculationTable[4] end
	return Result
end
repeat
	io.write("Input in the following order: DAMAGE AMMUNITION RPS PIERCE (and optionally) DAMAGE SECOND\nEXIT to exit\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" and choice:find("%d+") then print(Calculator(choice)) else io.write("Input a valid number\n") end
until choice == "EXIT"