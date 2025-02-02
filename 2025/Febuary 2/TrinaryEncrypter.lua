function Tabler(Input)
	local EncryptDecryptTypeBoolean, TextTypeBoolen, InFile, OutFile
	if Input ~= "ENCRYPT" or Input ~= "DECRYPT" then EncryptDecryptTypeBoolean = true elseif Input == "ENCRYPT" or Input == "DECRYPT" then InFile, OutFile, EncryptDecryptTypeBoolean = io.open("input.txt", "r"), io.open("output.txt", "w+"), false end
	if Input:find("%a+") and EncryptDecryptTypeBoolean then TextTypeBoolean = true elseif Input:find("[012]") and EncryptDecryptTypeBoolean then TextTypeBoolean = false end
	
end
repeat 
	io.write("ENCRYPT to encrypt, DECRYPT to decrypt, EXIT to exit.")
	local choice = io.read("*l"):gsub("\n", "")
until choice == "EXIT"