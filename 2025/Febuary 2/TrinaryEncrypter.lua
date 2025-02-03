function TrinaryEncoder(ASCII)
	local EncoderTable, IndiceDivision, IndiceMod, ASCIIResult = {}, math.floor(ASCII/3), ASCII%3
	table.insert(EncoderTable, 1, IndiceMod)
	repeat
		IndiceDivision = math.floor(IndiceDivision/3); IndiceModNew = IndiceDivision%3; ASCIIResult = IndiceDivision
		table.insert(EncoderTable, 1, IndiceModNew)
	until ASCIIResult == 0
	local result = table.concat(EncoderTable)
	return result
end
function Tabler(Input)
	local ConversionTable, EncryptDecryptTypeBoolean, TextTypeBoolen, InFile, OutFile = {}
	if Input ~= "ENCRYPT" or Input ~= "DECRYPT" then EncryptDecryptTypeBoolean = true elseif Input == "ENCRYPT" or Input == "DECRYPT" then InFile, OutFile, EncryptDecryptTypeBoolean = io.open("input.txt", "r"), io.open("output.txt", "w+"), false end
	if Input:find("%a+") and EncryptDecryptTypeBoolean then TextTypeBoolean = true elseif Input:find("[012]") and EncryptDecryptTypeBoolean then TextTypeBoolean = false end
	if TextTypeBoolean then
		for num1 = 1, #Input, 1 do
			local Indice = string.byte(Input, num1); table.insert(ConversionTable, TrinaryEncoder(Indice))
		end
	end
end
repeat 
	io.write("ENCRYPT to encrypt, DECRYPT to decrypt, EXIT to exit.\n")
	local choice = io.read("*l"):gsub("\n", "")
	if choice ~= "EXIT" then print(Tabler(choice)) end
until choice == "EXIT"