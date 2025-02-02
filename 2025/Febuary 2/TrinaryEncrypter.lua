function Tabler(Input)
	local ConversionTable, EncryptDecryptTypeBoolean, TextTypeBoolen, InFile, OutFile = {}
	if Input ~= "ENCRYPT" or Input ~= "DECRYPT" then EncryptDecryptTypeBoolean = true elseif Input == "ENCRYPT" or Input == "DECRYPT" then InFile, OutFile, EncryptDecryptTypeBoolean = io.open("input.txt", "r"), io.open("output.txt", "w+"), false end
	if Input:find("%a+") and EncryptDecryptTypeBoolean then TextTypeBoolean = true; break elseif Input:find("[012]") and EncryptDecryptTypeBoolean then TextTypeBoolean = false end
	if TextTypeBoolean then
		for num1 = 1, #Input, 1 do
			local indice = Input:sub(num1,num1)
			
			
		end
	end
end
repeat 
	io.write("ENCRYPT to encrypt, DECRYPT to decrypt, EXIT to exit.")
	local choice = io.read("*l"):gsub("\n", "")
	if choice ~= "EXIT" then Tabler(choice) end
until choice == "EXIT"