function TrinaryEncoder(ASCII)
	local EncoderTable, IndiceMod = {}, ASCII%3
	table.insert(EncoderTable, 1, IndiceMod)
	repeat
		ASCII = math.floor(ASCII/3); IndiceMod = ASCII%3
		if ASCII > 0 then table.insert(EncoderTable, 1, IndiceMod) end
	until ASCII == 0
	local Result = table.concat(EncoderTable)
	return Result
end
function TrinaryDecoder(Trinary)
	local DecoderTable, TrinaryFormula = {}
	for num3 = Trinary:len(), 1, -1 do
		TrinaryFormula = Trinary:sub(num3,num3)*(3^(num3-1))
		table.insert(DecoderTable, TrinaryFormula)
	end
	DecoderTable = tonumber(table.concat(DecoderTable, "+"))
	return DecoderTable
end
function Tabler(Input)
	local ConversionTable, EncryptDecryptTypeBoolean, TextTypeBoolen, InFile, OutFile = {}
	if Input ~= "ENCRYPT" or Input ~= "DECRYPT" then EncryptDecryptTypeBoolean = true elseif Input == "ENCRYPT" or Input == "DECRYPT" then InFile, OutFile, EncryptDecryptTypeBoolean = io.open("input.txt", "r"), io.open("output.txt", "w+"), false end
	if Input:find("%a+") and EncryptDecryptTypeBoolean then TextTypeBoolean = true elseif Input:find("[012]") and EncryptDecryptTypeBoolean then TextTypeBoolean = false end
	if TextTypeBoolean then
		for num1 = 1, #Input, 1 do
			local Indice = string.byte(Input, num1); table.insert(ConversionTable, TrinaryEncoder(Indice))
		end
		return table.concat(ConversionTable, " ")
	elseif not TextTypeBoolean then
		local ParserString = ""
		for num2 = 1, #Input, 1 do
			local Indice, count = Input:sub(num2,num2), 0
			ParserString = ParserString..Indice
			if Indice == " " or num2 == Input:len() then table.insert(ConversionTable, string.char(TrinaryDecoder(ParserString))); print(TrinaryDecoder(ParserString)); ParserString = ""; end
		end
		return table.concat(ConversionTable, "")
	end
end
repeat 
	io.write("ENCRYPT to encrypt, DECRYPT to decrypt, EXIT to exit.\n")
	local choice = io.read("*l"):gsub("\n", "")
	if choice ~= "EXIT" then print(Tabler(choice)) end
until choice == "EXIT"