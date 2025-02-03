function TrinaryEncoder(ASCII)
	local EncoderTable, IndiceMod = {}, ASCII%3
	table.insert(EncoderTable, 1, IndiceMod)
	print("\[INITIAL\]: These are the ascii values outputted "..ASCII.." "..ASCII.." "..IndiceMod)
	repeat
		ASCII = math.floor(ASCII/3); IndiceModNew = ASCII%3
		if ASCII > 0 then table.insert(EncoderTable, 1, IndiceModNew) end
		print("\[UNTIL ASCII 0\]: These are the ascii values outputted "..ASCII.." "..IndiceModNew)
	until ASCII == 0
	local result = table.concat(EncoderTable)
	return result
end
function TrinaryDecoder(Trinary)
	local DecoderTable = {}
end
function Tabler(Input)
	local ConversionTable, EncryptDecryptTypeBoolean, TextTypeBoolen, InFile, OutFile = {}
	if Input ~= "ENCRYPT" or Input ~= "DECRYPT" then EncryptDecryptTypeBoolean = true elseif Input == "ENCRYPT" or Input == "DECRYPT" then InFile, OutFile, EncryptDecryptTypeBoolean = io.open("input.txt", "r"), io.open("output.txt", "w+"), false end
	if Input:find("%a+") and EncryptDecryptTypeBoolean then TextTypeBoolean = true elseif Input:find("[012]") and EncryptDecryptTypeBoolean then TextTypeBoolean = false end
	if TextTypeBoolean then
		for num1 = 1, #Input, 1 do
			local Indice = string.byte(Input, num1); print("\[TABLER\]: This is the indice from Tabler. "..Indice); table.insert(ConversionTable, TrinaryEncoder(Indice))
		end
		return table.concat(ConversionTable, " ")
	elseif not TextTypeBoolean then
		for num1 = 1, #input, 1 do
			local Indice = input:find("")
		end
	end
end
repeat 
	io.write("ENCRYPT to encrypt, DECRYPT to decrypt, EXIT to exit.\n")
	local choice = io.read("*l"):gsub("\n", "")
	if choice ~= "EXIT" then print(Tabler(choice)) end
until choice == "EXIT"